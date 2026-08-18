"""
NODE_PhysTime_AR — Neural ODE integrated over real physical time grid | eval: autoregressive

What this script does, in plain English:
    We have a bunch of simulation "runs". Each run is a time series: at every
    timestamp we know some input features (V_N0, th_N0, f_G0) and one target
    value (P_T_HVMV_to_MW). Instead of training a normal "predict y from x"
    network, we train a Neural ODE: a small network that predicts the *rate
    of change* dy/dt given the current state y, the current inputs x(t), and
    the current time. A differential equation solver (torchdiffeq) then
    integrates that rate of change forward through the run's actual
    timestamps to produce a full predicted trajectory, which we compare
    against the real trajectory to compute the training loss.

    Designed for single-trajectory online inference rather than batch
    training. Integrates one run at a time through the ODE solver, suitable
    for deployment scenarios where runs arrive one at a time (e.g. streaming
    simulation output).

Requires a CUDA-capable GPU.
"""
# ============================================================
# SINGLE-CELL REAL-TIME NEURAL ODE PIPELINE
# ============================================================
from pathlib import Path
import os
import sys
os.environ["KMP_DUPLICATE_LIB_OK"] = "TRUE"

import time
import numpy as np
import pandas as pd
import torch
from torch._functorch import config as functorch_config
import torch.nn as nn
# odeint_adjoint solves the ODE and, on the backward pass, recomputes
# gradients via the "adjoint method" instead of storing every solver step.
# That makes backprop through long integrations much cheaper on GPU memory.
# I addded this for an experiement it might not be for the best but I will review it myself

_ROOT = Path(__file__).resolve().parent.parent  
sys.path.insert(0, str(_ROOT))
from torchdiffeq import odeint_adjoint as odeint
from input_data import TARGET_COLS, FEATURE_COLS, DATA_PATH, OUTPUT_DIR

# ROOT defines the script's own home folder. data_utils.py and early_stopping.py live right
# next to it, so we just need this directory on the import path.

# Sørg for at mappen findes
os.makedirs(OUTPUT_DIR, exist_ok=True)

RESULTS_CSV = os.path.join(OUTPUT_DIR, "NODE_PhysTime_AR","predictions.csv")

from early_stopping import EarlyStopping
from data_utils import load_and_normalise_and_split_data
from pytorch_optimizer import SOAP  # This is the optimiser we use. I found SOAP worked really well for me but feel free to change it

# ============================================================
# Config
# ============================================================

SEED = 42

if not torch.cuda.is_available():
    raise RuntimeError(
        "CUDA GPU not found. This script requires a CUDA-capable GPU and does not support CPU training."
    )
DEVICE = torch.device("cuda")


HIDDEN_DIM = 128   # width of each hidden layer in the ODE's right-hand-side network
DEPTH = 4          # number of hidden layers
LR = 1e-3          # learning rate (note: SOAP below is constructed with its own lr=1e-3 too)
EPOCHS = 500       # max number of training epochs (early stopping may end it sooner)
BATCH_SIZE = None  # computed below from free GPU memory, once data is loaded
METHOD = "rk4"     # fixed-step Runge-Kutta 4 ODE solver


torch.manual_seed(SEED)
np.random.seed(SEED)

# ============================================================
# Load + normalize data (UNCHANGED)
# ============================================================

# Reads the parquet file (the dataset), splits runs into train/validation/test (by run, so no run
# leaks across splits), and z-score normalizes features/target using
# TRAIN-only statistics. See data_utils.py for the full breakdown.
data = load_and_normalise_and_split_data(
    csv_paths=DATA_PATH,
    feature_cols=FEATURE_COLS,
    target_col=TARGET_COLS,
    run_col="simulation_id",
    time_col="time_s",
    device=DEVICE,
    #seed=SEED,
    #train_fraction=0.70,
    #val_fraction=0.15,
)

train_ids = data["train_ids"]





# Pick the largest batch size that comfortably fits in free GPU memory.
# The formula estimates "bytes needed per run" and divides available
# memory by that to get how many runs we can afford to process at once:
#   _bpr = _T * (len(FEATURE_COLS) + 4) * 4 * 15
#     _T                     = timesteps in the longest run (worst case length)
#     (len(FEATURE_COLS)+4)  = numbers stored per timestep: the raw
#                              features, plus roughly 4 more channels for
#                              y, t, the interpolation buffers, and mask
#     * 4                    = bytes per float32 number
#     * 15                   = Safety factor — the adjoint ODE solver,
#                              backprop gradients, and the SOAP optimizer's
#                              internal state all roughly duplicate this
#                              memory several times over, o/n top of the
#                              raw tensors, so the size can grow alot unexpectedly
#   BATCH_SIZE = min(len(train_ids), max(1, int(_free * 0.75 / _bpr)))
#     _free * 0.75 / _bpr    = how many runs' worth of memory fit in 75%
#                              of free GPU memory (the other 25% is left
#                              as headroom for anything the estimate missed)
#     max(1, ...)            = never round down to a batch size of 0
#     min(len(train_ids), ...) = never pick a batch bigger than the whole training set
# This all works. Its not well optimised and there is probably a much bettter way but it works for now. 


torch.cuda.empty_cache()
_free, _ = torch.cuda.mem_get_info(DEVICE)
_T = max(data["normalized_runs"][rid]["X"].shape[0] for rid in train_ids)
_bpr = _T * (len(FEATURE_COLS) + 4) * 4 * 15
BATCH_SIZE = min(len(train_ids), max(1, int(_free * 0.75 / _bpr)))
print(f"[INFO] BATCH_SIZE={BATCH_SIZE} (free GPU={_free/1e9:.1f}GB)")

val_ids   = data["val_ids"]
test_ids  = data["test_ids"]

run_groups = data["run_groups"]

# I normalise all my features and targets to have a mean of 0.
# This moves all data into a similar range/scale which means we dont have features 
# with large numerical values dominating the training
normalized_runs_base = data["normalized_runs"]  

X_mean, X_std = data["X_mean"], data["X_std"]
y_mean, y_std = data["y_mean"], data["y_std"]





# Rebuild the per-run dict in the shape the rest of this script expects:
# each run gets "feat" (input features), "y" (target), and "t" (its actual timestamps, 
# as a tensor on the GPU so the ODE solver can use them directly).
normalized_runs = {}
for rid, d in normalized_runs_base.items():
    normalized_runs[rid] = {
        "feat": d["X"],
        "y": d["y"],
        "t": torch.tensor(
            run_groups[rid]["time_s"].values.astype(np.float32),
            device=DEVICE
        )
    }

# ============================================================
# Utilities
# ============================================================

def masked_mse(y_pred, y_true, mask):
    """
    So in this project I had a problem that you will liekly also face.
    The runs in the dataset are all different lengths but to train
    them they need to be the same length. So we need a way to make them all match
    My solution was to add fake values to all the runs so they matched the length 
    of the longest run. THen I hide these fake values from the loss function
    so they dont effect training.


    Mean squared error, but only counting timesteps marked as "real" in
    `mask` (1.0 = real data, 0.0 = padding). Runs in a batch have different
    lengths, so shorter runs get padded to match the longest one — this
    function makes sure that padding never affects the loss.

    How the formula actually does that:
      - `diff2 = (y_pred - y_true) ** 2` computes the squared error at
        EVERY timestep, including padded ones (which hold repeated/dummy
        values and would otherwise be meaningless noise in the loss).
      - `diff2 * mask` multiplies each squared error by 1.0 (real
        timestep) or 0.0 (padded timestep). Multiplying by 1 leaves a
        value unchanged; multiplying by 0 zeroes it out. So this single
        elementwise multiply is what "removes" the padded entries — it's
        a numeric on/off switch instead of actually slicing each run to
        its own length (which tensors of different lengths can't easily
        do while staying batched on the GPU).
      - `.sum()` then adds up the (now padding-free) squared errors across
        every real timestep, across every run in the batch, into one number.
      - Dividing by `mask.sum()` is what turns that total into an
        *average*. Since mask entries are exactly 1 or 0, summing them
        counts exactly how many real (non-padded) timesteps went into the
        numerator — i.e. `mask.sum()` is N in the standard MSE formula
        (1/N) * sum((pred - true)^2). We deliberately compute N this way
        instead of calling `.mean()` on the tensor directly, because
        `.mean()` would divide by the full padded shape (T*B) — that would
        under-count the true error whenever there's padding, and the
        amount of padding varies batch to batch, so the loss scale
        wouldn't be comparable across batches.
    """
    diff2 = (y_pred - y_true) ** 2
    return (diff2 * mask).sum() / mask.sum()


def stack_all_runs(run_ids):
    """
    Turns a list of runs (each a different length) into a single set of
    batched tensors so they can all be processed together on the GPU.

    Each run is padded out to the length of the longest run in the list by
    repeating its last value (features/target) and extrapolating its time
    axis at a constant step. A `mask` tensor records which timesteps are
    real (1) vs. padding (0), so `masked_mse` can ignore the padded parts.

    Returns:
        feat  (T, B, F) — input features per run, time-major
        y     (T, B)    — target values per run
        t     (T, B)    — timestamps per run
        y0    (B, 1)    — each run's initial target value (used to start the ODE)
        mask  (T, B)    — 1 where real data exists, 0 where padded
        where T = number of time steps, B = number of runs, F = number of features
    """
    feats, ys, ts, y0s = [], [], [], []
    # ys = the trajectories of each run, ts = the timestamps of each run, y0s = the initial value of each run
    lengths = []

    max_len = max(normalized_runs[r]["feat"].shape[0] for r in run_ids)

    for rid in run_ids:
        feat = normalized_runs[rid]["feat"]
        y    = normalized_runs[rid]["y"]
        t    = normalized_runs[rid]["t"]

        L = feat.shape[0]
        lengths.append(L)

        pad = max_len - L
        if pad > 0:
            # Repeat the last real feature/target value to fill the tail.
            # feat[-1:] is the final row, shape (1, F); .expand(pad, -1)
            # stretches it (no copy) into `pad` identical rows, which we
            # then stick on the end. Since `mask` will mark these rows as
            # padding, their exact values don't affect the loss — they
            # just need to exist so every run in the batch has the same
            # length T for stacking into one tensor.
            feat = torch.cat([feat, feat[-1:].expand(pad, -1)], 0)
            y = torch.cat([y, y[-1:].expand(pad, -1)], 0)
            # The time axis can't just repeat the last timestamp (the ODE
            # solver requires strictly increasing times). Instead we
            # compute this run's average step size — total span
            # (t[-1]-t[0]) divided by the number of steps it took (L-1)
            # — and keep adding that same step to extend the timeline.
            # `max(L-1, 1)` only guards a single-row run (L=1), where
            # there's no step to measure yet, so we'd otherwise divide by
            # zero — 1 makes dt fall back to the run's own span (0) in
            # that degenerate case rather than crashing.
            # torch.arange(1, pad+1) = [1, 2, ..., pad], so each padded
            # timestamp is t[-1] + 1*dt, t[-1] + 2*dt, ... — a straight
            # continuation of the run's own spacing.
            dt   = (t[-1] - t[0]) / max(L - 1, 1)
            t    = torch.cat([t, t[-1] + dt * torch.arange(1, pad + 1, device=t.device)], 0)

        feats.append(feat.unsqueeze(1))
        ys.append(y.unsqueeze(1))
        ts.append(t.unsqueeze(1))
        y0s.append(y[0:1])

    feat = torch.cat(feats, 1)   # (T,B,F)
    y    = torch.cat(ys, 1)      # (T,B)
    t    = torch.cat(ts, 1)      # (T,B)
    y0   = torch.cat(y0s, 0)     # (B,1)

    # Build the real-vs-padding mask from each run's original length.
    mask = torch.zeros_like(y)
    for b, L in enumerate(lengths):
        mask[:L, b] = 1.0

    return feat, y, t, y0, mask

# feat[timestep, run, feature], feat.shape == (500, 64, 3), 500 timesteps, 64 runs, 3 features
# y[timestep, run], y[:, 0] this for example would give the full trajectory for run 0 
# t[timestep, run], t[:, 0] this is the time steps for run 0 for example [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]



# ============================================================
# Batched real-time interpolator
# ============================================================

class BatchedLinearInterpolator(nn.Module):
    """
    The ODE solver needs to know the input features x(t) at arbitrary times
    t — not just the exact timestamps we recorded data at (adaptive/RK
    solvers evaluate in between recorded samples too). This module answers
    "what were the input features at time t?" by linearly interpolating
    between the two nearest known timestamps, for every run in the batch at
    once.
    """

# Store the known timestamps (t_grid) and corresponding input features (x_grid)
# inside the interpolator. They are registered as buffers rather than
# trainable parameters because they are data for the current batch,
# not values the network should learn. Using buffers also means PyTorch
# automatically moves them to the GPU and includes them in state_dicts.
    def __init__(self, t_grid, x_grid):
        super().__init__()
        self.register_buffer("t", t_grid)
        self.register_buffer("x", x_grid)

    def forward(self, tq):
        # tq is the query time, ie the time the solver is checking for a possible solution at
        # torch.searchsorted returns the index where tq would need to be
        # inserted to keep the (sorted) time grid in order — e.g. if the
        # grid is [0, 5, 10] and tq=7, it returns 2 (7 would go between
        # index 1 and 2). That index already points at the sample *after*
        # tq, so we subtract 1 to get `idx`(time index), the sample *before* tq. This is the
        # left edge of the bracket [t[idx], t[idx+1]] that tq falls inside.
        # .clamp(1, len-1) keeps idx (and therefore idx+1) inside valid
        # array bounds if tq lands at or past either end of the grid.
        idx = torch.searchsorted(self.t[:, 0].contiguous(), tq).clamp(
            1, self.t.shape[0] - 1
        ) - 1

        t0, t1 = self.t[idx], self.t[idx + 1]
        x0, x1 = self.x[idx], self.x[idx + 1]

        # Linear interpolation between the two bracketing points.
        # w = (tq - t0) / (t1 - t0) is "how far across the [t0, t1] gap tq
        # sits, as a fraction": w=0 means tq=t0, w=1 means tq=t1, w=0.5
        # means tq is exactly halfway between them. (+1e-8 only prevents a
        # divide-by-zero if two consecutive timestamps happen to be
        # identical.)
        # x0 + w*(x1-x0) then walks that same fraction of the way from x0
        # to x1 — e.g. w=0.5 gives the midpoint (x0+x1)/2, w=0 gives x0
        # back exactly, w=1 gives x1 back exactly. That's the whole
        # definition of a straight line between two points, applied
        # feature-by-feature.
        w = (tq - t0) / (t1 - t0 + 1e-8)
        return x0 + w.unsqueeze(-1) * (x1 - x0)


# ============================================================
# Neural ODE (real-time)
# ============================================================

class NeuralODEFunc(nn.Module):
    """
    The learned right-hand-side of the differential equation: given the
    current state y, current input features x(t), and normalized time, it
    predicts dy/dt — how fast y is currently changing. This is just a plain
    feed-forward network (Linear -> Tanh, repeated `depth` times, then a
    final Linear down to a single number).
    """

    # This function constructs the network to be of the size we defined in the parameters section at the top of the script.
    def __init__(self, nx, hidden_dim, depth, state_dim=1):
        super().__init__()
        layers = []
        in_dim = nx + state_dim + 1  # x + y + t_norm
        for _ in range(depth):
            layers += [nn.Linear(in_dim, hidden_dim), nn.Tanh()]
            in_dim = hidden_dim
        layers.append(nn.Linear(hidden_dim, state_dim))
        self.net = nn.Sequential(*layers)
        self.state_dim = state_dim


# Combine the current input features x(t), the current state y,
# and the current normalized time into a single input vector, then
# feed it through the neural network to predict dy/dt.
    def forward(self, y, x_t, t_norm):
        return self.net(torch.cat([x_t, y, t_norm], dim=-1))


class ODEWrapper(nn.Module):
    """
    torchdiffeq's odeint() calls its function as func(t, y) — just a
    timestamp and the current state. This wrapper adapts that interface to
    NeuralODEFunc, which additionally needs the interpolated input features
    at time t and a time value normalized to [0, 1] over the run's duration.
    """
    def __init__(self, func, interp, t0, t_end):
        super().__init__()
        self.func = func
        self.interp = interp
        self.t0 = t0
        self.t_end = t_end

    def forward(self, t, y):
        x_t = self.interp(t)
        B = y.shape[0]
        # Rescale the current solver time t into the [0, 1] range, where 0
        # = the run's start (t0) and 1 = the run's end (t_end):
        #   t_norm = (t - t0) / (t_end - t0)
        # e.g. if t0=100, t_end=200, and the solver is currently at t=150,
        # t_norm = (150-100)/(200-100) = 0.5 — "halfway through the run".
        # We feed the network this normalized fraction rather than the raw
        # timestamp so it sees the same [0, 1] scale for every run,
        # regardless of each run's absolute start time or duration.
        # (+1e-12 only guards a zero-length run where t_end == t0.)
        t_norm = ((t - self.t0) / (self.t_end - self.t0 + 1e-12))
        # The RK4 solver sometimes calls this with a single shared scalar
        # time t (one number for the whole batch) and sometimes with one
        # time per run (shape (B,)). reshape(-1) flattens either case to a
        # flat list of numbers; .expand(B) then repeats a lone scalar out
        # to B copies (a no-op if it's already length B), so every run in
        # the batch ends up with its own t_norm entry; .unsqueeze(-1) adds
        # the trailing size-1 dimension the network expects (shape (B,1)).
        t_norm = t_norm.reshape(-1).expand(B).unsqueeze(-1)
        return self.func(y, x_t, t_norm)
    # This might seem confusing but basically its just saying weNTraining pass an indexed time variable as a feature to the NN
    # But it is important to remember we a re integrating through physical time values. 


# ============================================================
# Model + optimizer
# ============================================================

model = NeuralODEFunc(
    nx=len(FEATURE_COLS),
    hidden_dim=HIDDEN_DIM,
    depth=DEPTH,
    state_dim=len(TARGET_COLS),
).to(DEVICE)
functorch_config.donated_buffer = False  # required for torch.compile to play nicely with the adjoint ODE solver, I dont understand it
#model = torch.compile(model, dynamic=True)  # pre complies the network for faster GPU execution, I dont understand it but it works and makes training faster.

optimizer = SOAP(model.parameters(), lr=1e-3, betas=(0.95, 0.95), weight_decay=1e-2, precondition_frequency=10) # these are the recommend values for SOAP i found on the authors github
scaler = torch.amp.GradScaler("cuda")  # scales gradients to avoid float16 underflow during mixed-precision training
scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
    optimizer, mode="min", factor=0.5, patience=50, min_lr=1e-9
)  # halves the learning rate if validation loss stalls for 50 epochs
early_stopper = EarlyStopping(patience=100, min_delta=1e-9)  # stops training if val loss stalls for 100 epochs

# ============================================================
# Prepare data
# ============================================================

# Pre-batch the full train/val sets once (padded + masked) so each epoch
# just slices out mini-batches instead of re-padding every time.
"""
ytr   = training targets
yva   = validation targets

ttr   = training timestamps
tva   = validation timestamps

y0tr  = training initial conditions
y0va  = validation initial conditions

masktr = training masks
maskva = validation masks
"""
Xtr, ytr, ttr, y0tr, masktr = stack_all_runs(train_ids)
Xva, yva, tva, y0va, maskva = stack_all_runs(val_ids)

# ============================================================
# Checkpoint metadata (built once, reused by every save below)
# ============================================================

CKPT_DIR = os.path.dirname(RESULTS_CSV)
os.makedirs(CKPT_DIR, exist_ok=True)
CKPT_PATH = os.path.join(CKPT_DIR, "checkpoint.pt")

MODEL_CONFIG = {"nx": len(FEATURE_COLS), "hidden_dim": HIDDEN_DIM, "depth": DEPTH, "method": METHOD}
NORM_STATS = {
    "X_mean": X_mean.tolist(), "X_std": X_std.tolist(),
    "y_mean": y_mean.tolist(), "y_std": y_std.tolist(),
    "feature_cols": FEATURE_COLS, "target_cols": TARGET_COLS,
}
# Static description of how the ODE is set up, saved alongside the final
# checkpoint so a later inference script can reconstruct the pipeline
# without reading this training script.
INTEGRATION_INFO = {
    "grid_type": "physical_time",
    "step_size": "adaptive (solver-controlled)",
    "note": "Solver integrates directly on the physical time array per run. "
            "No index-grid or dt-scaling — the ODE is solved in real seconds.",
    "time_feature": "t_run_norm_via_ODEWrapper",
    "time_feature_note": "ODEWrapper computes t_norm=(t-t0)/(t_end-t0) at each "
                         "solver query and passes it to NeuralODEFunc as a scalar channel.",
    "state_dim": 1,
    "state_structure": "scalar_y",
    "rhs_input": "[X(t), y(t), t_norm] — interpolated controls + state + normalised time",
    "rhs_output": "dy/dt in normalised units/s (physical time derivative)",
    "output": "y_traj(T,B) — normalised target trajectory",
    "inference_call": "Per run: interp=BatchedLinearInterpolator(t,X); "
                     "ode=ODEWrapper(model,interp,t[0],t[-1]); "
                     "odeint(ode, y0, t, method=METHOD)",
}

# ============================================================
# Training loop
# ============================================================


def run_epoch(X, y, t, y0, mask, train=True):
    """
    Runs one full pass over the given dataset (train or val), one mini-batch
    of runs at a time:
      1. Build an interpolator for this batch's input features.
      2. Integrate the neural ODE forward through the batch's actual
         timestamps using RK4, starting from each run's real y0.
      3. Compare the predicted trajectory to the real one with masked MSE.
      4. If training, backpropagate and update the model weights (using
         mixed precision via GradScaler).
    Returns the average loss across all mini-batches.
    """

# B           : number of runs in this dataset split
# start       : first run index in the current mini-batch
# sl          : slice object selecting runs for the current mini-batch
# Xb          : batch input features, shape (T,Batch,F)
# yb          : batch target trajectories, shape (T,Batch)
# tb          : batch physical timestamps, shape (T,Batch)
# y0b         : batch initial conditions for the ODE solver, shape (Batch,1)
# mb          : batch mask, shape (T,Batch)
#               1 = real timestep, 0 = padded timestep
# interp      : interpolator which provides x(t) at arbitrary times
#               requested by the ODE solver
# ode         : wrapper adapting NeuralODEFunc to the interface expected
#               by torchdiffeq (func(t, y))
# y_pred      : predicted trajectories produced by integrating the Neural
#               ODE through the batch's physical timestamps, shape (T,Batch)
# loss        : masked mean squared error between predicted and true
#               trajectories, ignoring padded timesteps



    # Put the model into training mode (enable gradient updates) or
    # evaluation mode (no parameter updates).
    model.train() if train else model.eval()
    # Running totals used to compute the average loss across all batches.
    total_loss, n_batches = 0.0, 0
    # Total number of runs in this dataset split.
    B = y0.shape[0]
    # Process the runs one mini-batch at a time.
    for start in range(0, B, BATCH_SIZE):
        # Select the runs belonging to this mini-batch.
        sl = slice(start, min(start + BATCH_SIZE, B))
        # Extract this batch's:
        #   Xb  = input features
        #   yb  = true target trajectories
        #   tb  = physical timestamps
        #   y0b = initial ODE states
        #   mb  = real/padded timestep mask
        Xb, yb, tb, y0b, mb = X[:, sl], y[:, sl], t[:, sl], y0[sl], mask[:, sl]
        # Clear gradients left over from the previous training batch.
        if train:
            optimizer.zero_grad(set_to_none=True)
        # Enable gradient tracking during training and disable it during
        # validation to save memory and computation.
        with torch.set_grad_enabled(train):
            # Use mixed-precision arithmetic for faster GPU execution.
            with torch.autocast(device_type="cuda", enabled=False):
                # Build an interpolator that can estimate x(t) at arbitrary
                # times requested by the ODE solver.
                interp = BatchedLinearInterpolator(tb, Xb)
                # Wrap the Neural ODE function into the interface expected
                # by torchdiffeq, including access to the interpolated inputs.
                ode = ODEWrapper(model, interp, tb[0], tb[-1])
                # Solve the Neural ODE through the batch's physical time grid.
                # Starting from y0b, the solver repeatedly evaluates dy/dt and
                # integrates forward to produce a predicted trajectory for
                # every run in the batch.
                y_pred = odeint(
                    ode,
                    y0b,
                    tb[:, 0],
                    method=METHOD
                )
                # Compare the predicted and true trajectories while ignoring
                # padded timesteps using the mask.
                loss = masked_mse(y_pred, yb, mb)
            # During training, use backpropagation to determine how each
            # model weight contributed to the trajectory error, then update
            # the weights to reduce that error on future batches.
            if train:
                scaler.scale(loss).backward()
                scaler.step(optimizer)
                scaler.update()
        # Add this batch's loss to the running total.
        total_loss += loss.item()
        n_batches += 1
    # Return the average loss across all mini-batches.
    return total_loss / n_batches


for epoch in range(EPOCHS):
    t0 = time.time()

    train_loss = run_epoch(Xtr, ytr, ttr, y0tr, masktr, train=True)
    val_loss   = run_epoch(Xva, yva, tva, y0va, maskva, train=False)

    scheduler.step(val_loss)  # decay LR if val_loss hasn't improved recently


    if epoch % 1 == 0:
        print(
            f"Epoch {epoch:04d} | "
            f"Train {train_loss:.6e} | "
            f"Val {val_loss:.6e}"
        )

    # Periodic checkpoint every 100 epochs, in case training is interrupted.
    # early_stopper.best_state is always set by this point — its first
    # step() call (epoch 0) already initializes it.
    if (epoch + 1) % 100 == 0:
        torch.save({
            "epoch": epoch,
            "model_state_dict": early_stopper.best_state,
            "model_config": MODEL_CONFIG,
            "norm_stats": NORM_STATS,
            "training_info": {"best_val_loss": float(early_stopper.best)},
        }, CKPT_PATH)

    # early_stopper.step returns True once val_loss hasn't improved for
    # `patience` epochs, and internally remembers the best weights seen so far.
    if early_stopper.step(val_loss, model):
        print(f"Early stopping at epoch {epoch}")
        break

early_stopper.restore(model)  # load back the best-validation-loss weights before saving/evaluating

# ============================================================
# Save final checkpoint (with full metadata for later inference)
# ============================================================

torch.save({
    "model_state_dict": model.state_dict(),
    "model_config": MODEL_CONFIG,
    "integration": INTEGRATION_INFO,
    "norm_stats": NORM_STATS,
    "training_info": {"best_val_loss": float(early_stopper.best)},
}, CKPT_PATH)
print(f"[Checkpoint] Saved to {CKPT_PATH}")

# ============================================================
# Save predictions (test set)
# ============================================================

# For each held-out test run, integrate the trained ODE through that run's
# actual recorded timestamps (no gradients needed here — inference only),
# then convert predictions back from normalized units to physical units.
dfs = []
model.eval()

with torch.inference_mode():
    for rid in test_ids:
        feat = normalized_runs[rid]["feat"]
        y0   = normalized_runs[rid]["y"][0:1]
        t    = normalized_runs[rid]["t"]

        interp = BatchedLinearInterpolator(
            t.unsqueeze(1), feat.unsqueeze(1)
        )
        ode = ODEWrapper(model, interp, t[0], t[-1])

        y_pred = odeint(
            ode,
            y0,
            t,
            method=METHOD
        )[:, 0, :] 

        # Undo the z-score normalization applied during data loading.
        y_pred_np = y_pred.cpu().numpy() * y_std + y_mean
        t_np      = t.cpu().numpy()
        y_true    = run_groups[rid][TARGET_COLS].values
        L = min(len(t_np), len(y_true))
        row_data = {
        "simulation_id": str(rid),
        "time_s": t_np[:L],
    }

        for j, col_name in enumerate(TARGET_COLS):
            row_data[f"actual_{col_name}"] = y_true[:L, j]
            row_data[f"predicted_{col_name}"] = y_pred_np[:L, j]

        dfs.append(pd.DataFrame(row_data))

out_df = pd.concat(dfs, ignore_index=True)
out_df.to_csv(RESULTS_CSV, index=False)
print(f"[SAVE] predictions → {RESULTS_CSV}  ({len(out_df)} rows)")
