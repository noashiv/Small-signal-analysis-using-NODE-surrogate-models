"""
stability_physical_node.py

Standalone stability analysis for one physical-time Neural ODE checkpoint.

What this script does:
    fixed_points_physical_node.py asks "where would the learned dynamics
    settle if we froze the inputs?" This script asks a related but
    different question: "along the trajectories the network actually
    predicts for our real runs, is it behaving like a stable system (small
    errors/perturbations stay small) or an unstable one (they blow up)?"
    That matters because a Neural ODE has no guarantee of stability built
    in. It's just a network that was trained to match trajectories so
    it's worth checking after the fact whether it learned dynamics that
    behave sensibly.

    We check this two ways, both from the same underlying Jacobian (the
    matrix of "how does dy/dt respond to a small nudge in y", same idea as
    in fixed_points_physical_node.py):

    1. Instantaneous stability, at every single timestep.
       At each recorded timestamp along a run's trajectory, we compute the
       Jacobian *at that instant* and its eigenvalues. This tells us,
       "frozen at this exact moment, would a tiny perturbation to the
       state grow or decay?" It's a snapshot — it says nothing about what
       happens a few steps later, since the dynamics (and therefore the
       Jacobian) keep changing along the run.

    2. Finite-time Lyapunov exponents (FTLEs), over the whole run.
       Instead of a snapshot, this asks: if I perturbed the state at the
       *start* of the run, how much would that perturbation have grown or
       shrunk by the *end* of the run, accounting for every instant of
       changing dynamics in between? We get this by chaining together the
       instantaneous Jacobians across the whole run into a single "state
       transition matrix" (see full_run_ftles below for exactly how), and
       looking at how much that matrix stretches or shrinks vectors. This
       is the standard finite-time generalisation of eigenvalue-based
       stability, used because our dynamics aren't constant over time.

    For every run in the dataset, the script:
      1. Reconstructs the predicted NODE trajectory on the physical-time grid.
      2. Computes the state Jacobian along that predicted trajectory.
      3. Computes the instantaneous Jacobian eigenvalues, in 1/s.
      4. Computes the full-run finite-time Lyapunov exponents, in 1/s.
      5. Saves per-timestep values, per-run summaries, and two plots.
      
Run from the project root:
    python stability_physical_node.py
"""
from pathlib import Path
import os
import sys
os.environ["KMP_DUPLICATE_LIB_OK"] = "TRUE"

_ROOT = Path(__file__).resolve().parent.parent  
sys.path.insert(0, str(_ROOT))

import numpy as np
import pandas as pd
import torch
import torch.nn as nn
import matplotlib.pyplot as plt
from scipy.linalg import expm
from torchdiffeq import odeint
from NODE_PhysTime_AR import (HIDDEN_DIM, DEPTH, NeuralODEFunc)
from input_data import TARGET_COLS, FEATURE_COLS, DATA_PATH, OUTPUT_DIR, MODEL_PATH
# =============================================================================
# Configuration
# =============================================================================

RESULTS_DIR = Path(OUTPUT_DIR) / "stability"


# Like fixed_points_physical_node.py, this only does light per-run work
# (one ODE integration + a handful of Jacobians per run), so plain CPU is
# fine — no batching or CUDA needed.
DEVICE = torch.device("cpu")


# =============================================================================
# Physical-time NODE model
# =============================================================================

class LinearInterpolator(nn.Module):
    """
    Linearly interpolate the input features at solver query times.

    Same idea as BatchedLinearInterpolator in NODE_PhysTime_AR.py, just for
    a single run instead of a padded batch: the ODE solver evaluates the
    trajectory at times that don't necessarily line up exactly with our
    recorded samples, so this answers "what were the inputs at time t?" by
    linearly interpolating between the two nearest recorded timestamps.
    time/inputs are registered as buffers (not parameters) since they're
    per-run data, not something the network should learn.
    """

    def __init__(self, time, inputs):
        super().__init__()
        self.register_buffer("time_s", time)
        self.register_buffer("inputs", inputs)

    def forward(self, t):
        # searchsorted finds where t would slot into the sorted time grid;
        # subtracting 1 gives the index of the sample just before t, i.e.
        # the left edge of the [t0, t1] bracket that t falls inside.
        # clamp keeps that index in bounds if t lands at/past either end.
        i = torch.searchsorted(self.time_s, t).clamp(1, len(self.time_s) - 1) - 1
        t0, t1 = self.time_s[i], self.time_s[i + 1]
        x0, x1 = self.inputs[i], self.inputs[i + 1]
        # weight = how far across the [t0, t1] gap t sits (0 at t0, 1 at
        # t1); x0 + weight*(x1-x0) then walks that same fraction of the
        # way from x0 to x1 — the standard straight-line interpolation.
        # (+1e-8 only guards a divide-by-zero if t0 == t1.)
        weight = (t - t0) / (t1 - t0 + 1e-8)
        return x0 + weight * (x1 - x0)


class ODEWrapper(nn.Module):
    """
    Supply x(t) and normalised time to the learned NODE function.

    torchdiffeq's odeint() calls its function as func(t, y) — just a time
    and the current state — but NeuralODEFunc also needs the interpolated
    input features at time t and time expressed as a [0, 1] fraction of
    the run. This wrapper bridges that gap, exactly as ODEWrapper does in
    NODE_PhysTime_AR.py.
    """

    def __init__(self, model, interpolator, start_time, end_time):
        super().__init__()
        self.model = model
        self.interpolator = interpolator
        self.start_time = start_time
        self.end_time = end_time

    def forward(self, t, y):
        x_t = self.interpolator(t).unsqueeze(0)
        # t_norm = 0 at the run's start, 1 at its end — e.g. if
        # start_time=0, end_time=10, and the solver is currently at t=2.5,
        # t_norm = 0.25 ("a quarter of the way through the run"). Feeding
        # the network this fraction rather than raw seconds keeps the time
        # input on the same [0, 1] scale the network was trained on,
        # regardless of how long any individual run actually is.
        # (+1e-12 only guards a zero-length run where end_time == start_time.)
        t_norm = ((t - self.start_time) /
                  (self.end_time - self.start_time + 1e-12)).reshape(1, 1)
        return self.model(y, x_t, t_norm)


# =============================================================================
# Loading the checkpoint and CSV runs
# =============================================================================

def strip_compile_prefix(state_dict):
    """
    Remove the parameter prefix added by torch.compile, if present.

    NODE_PhysTime_AR.py trains under torch.compile(model, ...), which
    prefixes every saved parameter name with "_orig_mod." (e.g.
    "_orig_mod.net.0.weight"). Our plain NeuralODEFunc here isn't
    compiled, so its parameter names don't have that prefix — this strips
    it back off so load_state_dict can match them up.
    """
    return {key.replace("_orig_mod.", "", 1): value
            for key, value in state_dict.items()}


def load_model():
    """Rebuild the physical-time NODE and load its trained parameters."""
    checkpoint = torch.load(MODEL_PATH, map_location=DEVICE, weights_only=False)
    config = checkpoint["model_config"]

    model = NeuralODEFunc(
        nx=len(FEATURE_COLS),
        hidden_dim=HIDDEN_DIM,
        depth=DEPTH,
        state_dim=len(TARGET_COLS),
    )

    model.load_state_dict(strip_compile_prefix(checkpoint["model_state_dict"]))
    model.to(DEVICE).eval()

    return model, checkpoint["norm_stats"]


def load_runs(feature_cols):
    """
    Load the parquet file and group its rows into individual simulation runs.

    Returns a dict of {simulation_id: dataframe}, each dataframe holding just that
    one run's rows sorted by time — this is the same "one run = one
    trajectory" shape used everywhere else in the pipeline
    (NODE_PhysTime_AR.py's normalized_runs, fixed_points_physical_node.py's
    per-run grouping), just built directly from the raw columns here
    instead of going through the shared normalisation helper.
    """
    columns = list(dict.fromkeys(
        ["simulation_id", "time_s"] + list(feature_cols) + list(TARGET_COLS)
    ))
    data = pd.read_csv(DATA_PATH, usecols=columns)
    data = data.sort_values(["simulation_id", "time_s"])
    data = data.drop_duplicates(subset=["simulation_id", "time_s"], keep="first")

    return {
        simulation_id: group.reset_index(drop=True)
        for simulation_id, group in data.groupby("simulation_id", sort=False)
    }


# =============================================================================
# Stability analysis
# =============================================================================

def target_normalisation(norm_stats):
    """
    Return target means and standard deviations as state vectors.

    norm_stats stores these as plain floats for a scalar target; the rest
    of this script always treats state as an array (even for 1-D), so
    np.atleast_1d wraps a bare float into a length-1 array.
    """
    y_mean = np.asarray(norm_stats.get("y_mean", 0.0), dtype=np.float32)
    y_std = np.asarray(norm_stats.get("y_std", 1.0), dtype=np.float32)
    return np.atleast_1d(y_mean), np.atleast_1d(y_std)


def prepare_run(group, norm_stats):
    """Convert one dataframe run into model-ready tensors and arrays."""
    feature_cols = norm_stats["feature_cols"]
    x_mean = np.asarray(norm_stats["X_mean"], dtype=np.float32)
    x_std = np.asarray(norm_stats["X_std"], dtype=np.float32)

    x_raw = group[feature_cols].to_numpy(dtype=np.float32)
    x_norm = (x_raw - x_mean) / (x_std + 1e-8)

    time = torch.tensor(
        group["time_s"].to_numpy(dtype=np.float32), device=DEVICE
    )
    inputs = torch.tensor(x_norm, dtype=torch.float32, device=DEVICE)
    target = group[TARGET_COLS].to_numpy(dtype=np.float32)

    return time, inputs, target


@torch.no_grad()
def reconstruct_trajectory(model, time, inputs, target, norm_stats):
    """
    Integrate the trained NODE from the first measured state.

    This re-runs the exact same kind of ODE integration used at inference
    time in NODE_PhysTime_AR.py: start from the run's real first target
    value (normalised), then let odeint() step the network's learned dy/dt
    forward through the run's actual recorded timestamps. The result is
    the network's own predicted trajectory for this run. It's this
    predicted trajectory that the Jacobians
    and FTLEs below are computed along, since we're analysing the
    stability of what the network actually learned to do.
    """
    y_mean, y_std = target_normalisation(norm_stats)
    y0_norm = (target[0] - y_mean) / (y_std + 1e-8)
    y0 = torch.tensor(
        y0_norm.reshape(1, model.state_dim),
        dtype=torch.float32,
        device=DEVICE,
    )

    interpolator = LinearInterpolator(time, inputs)
    rhs = ODEWrapper(model, interpolator, time[0], time[-1])
    trajectory = odeint(rhs, y0, time, method="rk4")

    return trajectory[:, 0, :]


def instantaneous_stability(model, time, inputs, trajectory):
    """
    Compute the state Jacobian and its eigenvalues at every timestamp.

    At each recorded time i, we take the state the network predicted there
    (trajectory[i]) and ask: "holding the inputs and time fixed at this
    instant, how sensitive is dy/dt to a small nudge in y?" That's the
    Jacobian, obtained via autograd the same way as
    state_jacobian() in fixed_points_physical_node.py. Its eigenvalues'
    real parts tell us whether a tiny perturbation at that exact instant
    would be currently growing or decaying. This is a snapshot at time i
    only, not a statement about the whole run (that's what full_run_ftles
    below is for).

    We loop over timestamps one at a time (rather than vectorising) because
    torch.autograd.functional.jacobian differentiates one function call at
    a time; for the run lengths here this is fast enough not to matter.
    """
    jacobians = []
    eigenvalues = []
    start_time, end_time = time[0], time[-1]

    for i in range(len(time)):
        y = trajectory[i].detach().clone().requires_grad_(True)
        x_t = inputs[i].reshape(1, -1)
        t_norm = ((time[i] - start_time) /
                  (end_time - start_time + 1e-12)).reshape(1, 1)

        def state_rhs(y_vector):
            return model(
                y_vector.reshape(1, model.state_dim), x_t, t_norm
            ).reshape(model.state_dim)

        jacobian = torch.autograd.functional.jacobian(state_rhs, y)
        jacobian = jacobian.detach().cpu().numpy().astype(np.float64)

        jacobians.append(jacobian)
        eigenvalues.append(np.linalg.eigvals(jacobian))

    return np.stack(jacobians), np.stack(eigenvalues)


def full_run_ftles(time, jacobians):
    """
    Compute the full-run finite-time Lyapunov exponents (FTLEs) by
    propagating the state-transition matrix across the whole run.

    The instantaneous eigenvalues from instantaneous_stability() only tell
    us about stability at one frozen instant. FTLEs answer a different
    question: if I perturbed the state at the very start of the run, how
    much would that perturbation have grown or shrunk by the end,
    accounting for the dynamics changing at every step along the way?

    How the formula gets there:
      - Between two consecutive recorded timestamps, we treat the Jacobian
        as roughly constant (equal to whatever we measured at the earlier
        timestamp). Under a *constant* Jacobian J, the exact solution to
        how a small perturbation evolves over a time step dt is
        multiplication by matrix_exponential(J * dt), this is the matrix
        generalisation of how a scalar linear ODE dy/dt = a*y evolves as
        y(t) = y(0) * exp(a*t). scipy's expm() computes that matrix
        exponential.
      - `phi = expm(jacobians[i] * dt) @ phi` chains these one-step
        effects together: phi starts as the identity matrix ("no
        perturbation growth yet"), and each step left-multiplies it by
        that step's growth/decay matrix. After the loop, phi is the full
        "state transition matrix", it maps a small perturbation at the
        run's start to what that same perturbation would have become by
        the run's end, having passed through every changing instant of
        dynamics in between.
      - `np.linalg.svd(phi, compute_uv=False)` gets phi's singular
        values — these measure how much phi stretches or shrinks vectors
        along its most/least sensitive directions, regardless of which
        direction you started perturbing in.
      - `np.log(singular_values) / duration` converts "total
        stretch/shrink factor over the whole run" into an average
        exponential growth *rate* per second, comparable across runs of
        different lengths. A positive value
        means perturbations grow over the run on average (unstable); a
        negative value means they decay (stable).
      - We clamp singular values away from exactly zero
        (np.finfo(float).tiny) purely to avoid log(0) = -inf if phi is
        (numerically) singular along some direction.
      - The result is sorted largest-to-smallest so index 0 is always the
        "dominant" FTLE, the direction that grows fastest (or shrinks
        slowest), which is the one that matters most for judging overall
        stability of the run.
    """
    time_np = time.detach().cpu().numpy().astype(np.float64)
    state_dim = jacobians.shape[1]
    phi = np.eye(state_dim)

    for i, dt in enumerate(np.diff(time_np)):
        phi = expm(jacobians[i] * dt) @ phi

    duration = time_np[-1] - time_np[0]
    singular_values = np.linalg.svd(phi, compute_uv=False)
    singular_values = np.maximum(singular_values, np.finfo(float).tiny)
    ftles = np.log(singular_values) / duration

    return np.sort(ftles)[::-1]


def analyse_run(simulation_id, group, model, norm_stats):
    """
    Run the full pipeline for one simulation run: reconstruct the
    network's predicted trajectory, compute instantaneous Jacobians/
    eigenvalues at every timestep, compute the run's FTLEs, then package
    everything into a per-timestep dataframe and a one-row run summary.
    """
    time, inputs, target = prepare_run(group, norm_stats)
    trajectory = reconstruct_trajectory(
        model, time, inputs, target, norm_stats
    )
    jacobians, eigenvalues = instantaneous_stability(
        model, time, inputs, trajectory
    )
    ftles = full_run_ftles(time, jacobians)

    y_mean, y_std = target_normalisation(norm_stats)
    # Undo the z-score normalisation so predictions are saved in physical
    # units (e.g. MW), comparable to the recorded target column.
    prediction = (
        trajectory.detach().cpu().numpy() * (y_std + 1e-8) + y_mean
    )
    time_np = time.detach().cpu().numpy()
    # Per-timestep spectral abscissa: the largest eigenvalue real part at
    # each instant (same definition as classify_stability() in
    # fixed_points_physical_node.py, just evaluated along the trajectory
    # rather than at a single frozen fixed point).
    spectral_abscissa = np.max(eigenvalues.real, axis=1)

    timestep_rows = pd.DataFrame({
        "simulation_id": simulation_id,
        "time_s": time_np,
    })

    for j, name in enumerate(TARGET_COLS):
        timestep_rows[f"target_{name}"] = target[:, j]
        timestep_rows[f"prediction_{name}"] = prediction[:, j]

    for row in range(model.state_dim):
        for col in range(model.state_dim):
            timestep_rows[
                f"jacobian_{row + 1}_{col + 1}_1_per_s"
            ] = jacobians[:, row, col]

    for j in range(model.state_dim):
        timestep_rows[
            f"eigenvalue_{j + 1}_real_1_per_s"
        ] = eigenvalues[:, j].real
        timestep_rows[
            f"eigenvalue_{j + 1}_imag_1_per_s"
        ] = eigenvalues[:, j].imag

    timestep_rows[
        "spectral_abscissa_1_per_s"
    ] = spectral_abscissa

    dt = np.diff(time_np.astype(np.float64))
    # fraction_time_frozen_stable: of the run's total duration, what
    # fraction of time intervals started at a timestep where the
    # instantaneous spectral abscissa was negative ("frozen-stable" at
    # that instant)? spectral_abscissa[:-1] lines up each interval dt[i]
    # (from timestep i to i+1) with the stability at its starting point i,
    # so dt[spectral_abscissa[:-1] < 0.0] selects just the durations of
    # intervals that started out locally stable; summing those and
    # dividing by the total duration turns it into a fraction (0 to 1).
    # This is a cheap instantaneous proxy for "how much of the run looked
    # locally stable", the dominant_ftle_1_per_s above is the more rigorous
    # whole-run answer to the same underlying question.
    run_summary = {
        "simulation_id": simulation_id,
        "n_timesteps": len(time_np),
        "duration_s": float(time_np[-1] - time_np[0]),
        "dominant_ftle_1_per_s": float(ftles[0]),
        "min_spectral_abscissa_1_per_s": float(np.min(spectral_abscissa)),
        "max_spectral_abscissa_1_per_s": float(np.max(spectral_abscissa)),
        "fraction_time_frozen_stable": float(
            np.sum(dt[spectral_abscissa[:-1] < 0.0]) / np.sum(dt)
        ),
    }

    for j, ftle in enumerate(ftles, start=1):
        run_summary[f"ftle_{j}_1_per_s"] = float(ftle)

    return timestep_rows, run_summary


# =============================================================================
# Saving results and making figures
# =============================================================================

def make_plots(timestep_data, run_summary):
    """
    Plot instantaneous local behaviour and dominant full-run FTLEs.

    First plot: every run's instantaneous spectral abscissa over time, one
    faint line per run (alpha=0.25 so overlapping runs are still readable
    as a density rather than a solid block), with a dashed line at zero —
    lines mostly below zero suggest the network's dynamics are usually
    locally stable; lines crossing above zero show where/when they
    aren't.

    Second plot: a histogram of each run's single dominant FTLE (the
    whole-run stability verdict), again with a dashed line at zero —
    this summarises across the whole dataset whether the network learned
    dynamics that are stable (mass to the left of zero) or unstable (mass
    to the right) over full runs, not just instants.
    """
    fig, ax = plt.subplots(figsize=(8, 4))
    for _, run in timestep_data.groupby("simulation_id"):
        ax.plot(
            run["time_s"],
            run["spectral_abscissa_1_per_s"],
            linewidth=0.7,
            alpha=0.25,
        )
    ax.axhline(0.0, color="black", linestyle="--", linewidth=0.8)
    ax.set_xlabel("Time (s)")
    ax.set_ylabel("Instantaneous spectral abscissa (1/s)")
    fig.tight_layout()
    fig.savefig(RESULTS_DIR / "stability_eigenvalues.png", dpi=300)
    plt.close(fig)

    fig, ax = plt.subplots(figsize=(6, 4))
    ax.hist(
        run_summary["dominant_ftle_1_per_s"],
        bins=20,
        edgecolor="black",
    )
    ax.axvline(0.0, color="black", linestyle="--", linewidth=0.8)
    ax.set_xlabel("Dominant full-run FTLE (1/s)")
    ax.set_ylabel("Number of runs")
    fig.tight_layout()
    fig.savefig(RESULTS_DIR / "stability_ftle.png", dpi=300)
    plt.close(fig)


def main():
    """Load the model, analyse every CSV run, and save all results."""
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)

    model, norm_stats = load_model()
    run_groups = load_runs(norm_stats["feature_cols"])
    simulation_ids = sorted(run_groups)

    timestep_results = []
    run_results = []

    print(
        f"Analysing all {len(simulation_ids)} runs with "
        f"{model.state_dim} NODE state(s) on {DEVICE}..."
    )

    for number, simulation_id in enumerate(simulation_ids, start=1):
        timestep_rows, run_summary = analyse_run(
            simulation_id, run_groups[simulation_id], model, norm_stats
        )
        timestep_results.append(timestep_rows)
        run_results.append(run_summary)

        print(
            f"[{number:3d}/{len(simulation_ids)}] run {simulation_id}: "
            f"dominant FTLE = "
            f"{run_summary['dominant_ftle_1_per_s']:+.6f} 1/s"
        )

    timestep_data = pd.concat(timestep_results, ignore_index=True)
    run_summary = pd.DataFrame(run_results)

    timestep_data.to_csv(
        RESULTS_DIR / "stability_eigenvalues.csv", index=False
    )
    run_summary.to_csv(
        RESULTS_DIR / "stability_ftle_by_run.csv", index=False
    )

    dominant_ftle = run_summary["dominant_ftle_1_per_s"]
    overall_summary = pd.DataFrame([{
        "n_runs": len(run_summary),
        "ftle_mean_1_per_s": dominant_ftle.mean(),
        "ftle_std_1_per_s": dominant_ftle.std(ddof=0),
        "ftle_median_1_per_s": dominant_ftle.median(),
        "ftle_min_1_per_s": dominant_ftle.min(),
        "ftle_max_1_per_s": dominant_ftle.max(),
        "fraction_ftle_negative": (dominant_ftle < 0.0).mean(),
    }])
    overall_summary.to_csv(
        RESULTS_DIR / "stability_summary.csv", index=False
    )

    make_plots(timestep_data, run_summary)

    print("\nOverall summary")
    print(overall_summary.to_string(index=False))
    print(f"\nResults saved in: {RESULTS_DIR.resolve()}")


if __name__ == "__main__":
    main()
