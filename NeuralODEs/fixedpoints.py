"""
fixed_points_physical_node.py

Standalone fixed-point analysis for one physical-time Neural ODE checkpoint.

What this script does
    The NODE we trained learned a function f(y, x, t) = dy/dt: 
    "given the current state y, the current inputs x, and the current time t, 
    how fast is y currently changing?"
    
    A fixed point is a state y* where the network predicts dy/dt = 0 for
    some frozen x and t — i.e. if the system were held at inputs x_fixed
    and time t_fixed, y* is a value it would just sit at, neither rising
    nor falling. In power-systems terms, this is looking for the operating
    points the learned dynamics would settle into for a given set of
    exogenous conditions.

    We can't solve f(y*, x_fixed, t_fixed) = 0 algebraically because f is a
    neural network, so instead we do it numerically: pick a state guess,
    hand it to scipy's `root()`, and let it iteratively nudge the guess
    until the network's output is zero. Because the network is nonlinear, 
    there can be more than one such y* for the same (x, t).
    So we repeat the search from many different starting guesses spread across
    the observed target range and keep only the distinct solutions that
    land inside it.

    The network was trained on physical time expressed as the fraction of
    each run elapsed (0 at the run's first sample, 1 at its last). 
    This script builds that same run-fraction from the recorded time column and searches
    fixed points over it, so the frozen conditions we query stay inside
    the range the network actually saw during training.

    Only the training-split runs are used (same seed and split fractions
    as NODE_PhysTime_AR.py), so the observed target range we search within
    matches what the network was actually fitted on.

    Two analyses are performed:

      A. Initial operating condition
         Freeze the exogenous inputs, time, and expected state at their
         median initial values across the training runs, and search for every distinct fixed point near
         there. This tells us starting from a realistic initial
         condition, does the network's learned dynamics agree that the
         state should stay roughly where it started, or does it think the
         system wants to move somewhere else entirely?

      B. Feature-time sweep
         Instead of one frozen condition, sweep every exogenous feature
         and time independently across their full training range, and
         search for fixed points at every combination. This maps out how
         the learned equilibrium behaviour changes across the whole
         operating envelope the network was trained on, not just at one
         point.

    For every accepted fixed point we also compute its local stability:
    we take the Jacobian of f with respect to y at that point (how
    sensitive dy/dt is to small nudges away from y*), get its eigenvalues,
    and check the sign of the largest real part (the "spectral abscissa").
    Negative means small perturbations decay back towards y* (stable);
    positive means they grow away from it (unstable).

Run from the project root:
    python fixed_points_physical_node.py
"""

import os
os.environ["KMP_DUPLICATE_LIB_OK"] = "TRUE"

from itertools import product
from pathlib import Path

import numpy as np
import pandas as pd
import torch
import torch.nn as nn
import matplotlib.pyplot as plt
from scipy.optimize import root
from sklearn.model_selection import train_test_split
from NODE_PhysTime_AR import (FEATURE_COLS, TARGET_COL, HIDDEN_DIM, DEPTH, NeuralODEFunc)

# =============================================================================
# Configuration
# =============================================================================

MODEL_PATH = Path("/zhome/84/1/154964/RAMSES/NeuralODES/results/NODE_PhysTime_AR/checkpoint.pt")
DATA_PATH = Path("/zhome/84/1/154964/RAMSES/NeuralODES/data/all_simulation_timeseries.csv")
OUTPUT_DIR = Path("figures/fixed_points")

# Train/val/test split must match NODE_PhysTime_AR.py (via data_utils.py)
# so the fixed-point search only uses runs the network was trained on.
# scikit-learn's train_test_split with the same seed and test_size always
# produces the same split of run_ids, so we don't need to re-import the
# training script to reproduce it we just repeat the same call here.
SEED = 42
TEST_SIZE = 0.30


TARGET_NAMES = ["P_MW"]

# This script only ever runs a handful of small root-solves and Jacobians
# at a time, so plain CPU is fast enough I think
DEVICE = torch.device("cpu")

# How many evenly spaced values to try per exogenous feature and per
# physical time in Analysis B's sweep. The sweep tries every *combination*
# of these values (a full grid), so the cost grows fast: with 3 exogenous
# features plus time, that's 4 axes, and N_SWEEP=8 gives 8^4 = 4096 frozen
# (x, t) conditions to search for fixed points at. 
N_SWEEP = 8

# How many different starting guesses for the state y we hand to scipy's
# root-finder per frozen condition, spread evenly across the observed
# target range. Since f is nonlinear, root() can converge to a different
# fixed point depending on where it starts, so trying many starting points
# is how we find *all* the distinct fixed points rather than just one.
# This means N_ROOT_GUESSES solves per condition.
N_ROOT_GUESSES = 15

# A candidate solution from root() is only accepted as a real fixed point if:
#   - |f(y*)| < ROOT_RESIDUAL_TOL   (the network's dy/dt there is close enough to zero)
#   - it isn't within ROOT_DEDUP_TOL of a fixed point we already accepted
#     from a different starting guess (so two guesses that converge to the
#     "same" point don't get counted twice)
# STABILITY_TOL is the same idea applied to the eigenvalue check: a
# spectral abscissa within STABILITY_TOL of zero is treated as "marginal"
# rather than confidently stable/unstable, since that close to zero the
# sign is not numerically reliable.
ROOT_RESIDUAL_TOL = 1e-6
ROOT_DEDUP_TOL = 1e-4
STABILITY_TOL = 1e-6


# =============================================================================
# Loading the checkpoint and training data
# =============================================================================

def strip_compile_prefix(state_dict):
    """
    Remove the parameter prefix added by torch.compile, if present.

    When a model is trained under torch.compile(model, ...) (as
    NODE_PhysTime_AR.py does), PyTorch wraps it internally and every
    parameter name in the saved checkpoint gets an "_orig_mod." prefix
    stuck on the front (e.g. "_orig_mod.net.0.weight" instead of just
    "net.0.weight"). Our plain, non-compiled NeuralODEFunc here doesn't
    have that prefix in its parameter names, so loading the checkpoint
    directly would fail to match anything. This just strips the prefix
    back off so the names line up again.
    """
    return {key.replace("_orig_mod.", "", 1): value
            for key, value in state_dict.items()}


def load_model():
    """Rebuild the physical-time NODE and load its trained parameters."""
    checkpoint = torch.load(MODEL_PATH, map_location=DEVICE, weights_only=False)
    config = checkpoint["model_config"]
    state_dim = len(TARGET_COL)

    # Rebuild the same architecture the checkpoint was trained with, using
    # the config dict that NODE_PhysTime_AR.py saved alongside the weights.
    model = NeuralODEFunc(
        nx=len(FEATURE_COLS),
        hidden_dim=HIDDEN_DIM,
        depth=DEPTH,
        state_dim=state_dim,
    )
    model.load_state_dict(strip_compile_prefix(checkpoint["model_state_dict"]))
    # .eval() turns off training-only behaviour (there isn't any dropout/
    # batchnorm here, but it's good practice for inference regardless).
    model.to(DEVICE).eval()

    return model, checkpoint["norm_stats"]


def load_training_data(feature_cols):
    """Load the training-split runs and add each run's normalised time."""
    columns = list(dict.fromkeys(
        ["run_id", "time"] + list(feature_cols) + TARGET_COL
    ))
    data = pd.read_csv(DATA_PATH, usecols=use_cols)
    data = data.sort_values(["simulation_id", "time_s"]).reset_index(drop=True)

    # Recreate exactly the same train/val/test split NODE_PhysTime_AR.py
    # used (same seed, same test_size), then keep only the training runs.
    # We only care about "trained on vs. not" here, so val and test are
    # both lumped into the discarded half.
    run_ids = sorted(data["simulation_id"].unique())
    train_ids, _ = train_test_split(run_ids, test_size=TEST_SIZE, random_state=SEED)
    data = data[data["simulation_id"].isin(train_ids)].reset_index(drop=True)

    # The network sees time as the fraction of the run elapsed (0 to 1),
    # not raw seconds — see t_norm in NODE_PhysTime_AR.py. We rebuild that
    # same quantity here per run: for each run, subtract its own first
    # timestamp and divide by its own total span, so time_norm always
    # starts at 0 and ends at 1 regardless of the run's real duration.
    data["time_norm"] = data.groupby("simulation_id")["time_s"].transform(
        lambda t: (t - t.min()) / (t.max() - t.min())
    )
    return data


def target_normalisation(norm_stats):
    """
    Return target means and standard deviations as state vectors.

    norm_stats (saved in the checkpoint) stores y_mean/y_std as plain
    numbers for a scalar target, but the rest of this script always works
    with state as an array (even for a 1-D state), so np.atleast_1d just
    wraps a bare float into a length-1 array where needed.
    """
    y_mean = np.atleast_1d(np.asarray(
        norm_stats.get("y_mean", 0.0), dtype=np.float64
    ))
    y_std = np.atleast_1d(np.asarray(
        norm_stats.get("y_std", 1.0), dtype=np.float64
    ))
    return y_mean, y_std


# =============================================================================
# Fixed-point search
# =============================================================================

def make_initial_guesses(target_data, y_mean, y_std):
    """
    Build a grid of starting guesses for the root-finder, spread evenly
    across the range of target values actually observed in training.

    This is simply N_ROOT_GUESSES evenly spaced values between the
    observed min and max (in normalised units, since that's the space the
    network operates in). Trying this many spread out starting points is
    what lets us find multiple distinct fixed points if the network's
    dynamics have more than one, instead of only ever finding whichever
    one the root-finder happens to converge to first.
    """
    lo = float(target_data[:, 0].min())
    hi = float(target_data[:, 0].max())
    values = np.linspace(lo, hi, N_ROOT_GUESSES)
    # Convert to the same normalised (z-scored) units the network was
    # trained on, since that's what we'll feed it below.
    values_norm = (values - y_mean[0]) / (y_std[0] + 1e-8)

    return [np.asarray([value], dtype=np.float64) for value in values_norm]


def evaluate_rhs(model, y_norm, x_norm, time_value):
    """
    Evaluate the learned state derivative f(y, x, t) = dy/dt, in
    normalized coordinates, for a single state/input/time combination.

    This is the "objective function" the root-finder will call over and
    over. root() doesn't know anything about neural networks, it just
    repeatedly asks "what is f(y) for this y?" and adjusts y based on the
    answer, so this function's job is purely to translate a plain numpy
    array y into the tensor shapes the model expects, run it through the
    network, and hand back a plain numpy array again. torch.no_grad()
    disables gradient tracking since we're not training or differentiating
    here. This is a forward pass, so tracking gradients would just waste
    memory and time.
    """
    y = torch.tensor(y_norm, dtype=torch.float32, device=DEVICE).reshape(1, -1)
    x = torch.tensor(x_norm, dtype=torch.float32, device=DEVICE).reshape(1, -1)
    t = torch.tensor([[time_value]], dtype=torch.float32, device=DEVICE)

    with torch.no_grad():
        return model(y, x, t).cpu().numpy().reshape(-1).astype(np.float64)


def state_jacobian(model, y_norm, x_norm, time_value):
    """
    Compute the state Jacobian of f with respect to y, at one fixed point.

    The Jacobian here is the matrix of partial derivatives d(dy/dt)_i /
    d(y)_j — i.e. "if I nudge state component j by a tiny amount, how much
    does the predicted rate of change of component i shift?" For our
    scalar state this is just a single number (df/dy). This matrix is
    exactly what local (linearised) stability
    analysis is built on: near the fixed point, small deviations behave
    approximately like a linear system governed by this Jacobian, and its
    eigenvalues tell us whether those deviations grow or decay (see
    classify_stability below).

    We get it via autograd rather than by hand-deriving it: requires_grad_
    on y lets torch.autograd.functional.jacobian trace how the network's
    output changes as y is perturbed, which is exact (not a finite-
    difference approximation) since the network is fully differentiable.
    """
    y = torch.tensor(
        y_norm, dtype=torch.float32, device=DEVICE, requires_grad=True
    )
    x = torch.tensor(x_norm, dtype=torch.float32, device=DEVICE).reshape(1, -1)
    t = torch.tensor([[time_value]], dtype=torch.float32, device=DEVICE)

    def state_rhs(y_vector):
        return model(
            y_vector.reshape(1, model.state_dim), x, t
        ).reshape(model.state_dim)

    jacobian = torch.autograd.functional.jacobian(state_rhs, y)
    return jacobian.detach().cpu().numpy().astype(np.float64)


def find_fixed_points(model, x_norm, time_value, initial_guesses,
                      state_lo_norm, state_hi_norm):
    """
    Find and deduplicate fixed points for one frozen input-time condition.

    For each of the starting guesses built by make_initial_guesses(), we
    ask scipy's root() to solve objective(y) = 0, i.e. find a y where the
    network predicts (numerically) zero rate of change given the frozen
    x_norm and time_value. root() returns whatever it converged to
    (solution.x) plus how far off that still is from a true zero
    (solution.fun, the residual).

    A candidate is only kept as a genuine fixed point if all three hold:
      - residual < ROOT_RESIDUAL_TOL
        The solver actually converged close enough to f(y*) = 0, rather
        than stalling partway.
      - inside_range
        y* falls within the state range the network was actually trained
        on (state_lo_norm/state_hi_norm). A "solution" outside that range
        would mean asking the network to extrapolate, which we don't
        trust.
      - not duplicate
        y* isn't within ROOT_DEDUP_TOL of a fixed point we already
        accepted from an earlier guess in this same loop. Different
        starting guesses often converge to the *same* fixed point, so
        without this check we'd report the same physical equilibrium
        many times over.
    """
    fixed_points = []

    def objective(y_norm):
        return evaluate_rhs(model, y_norm, x_norm, time_value)

    for guess in initial_guesses:
        solution = root(objective, guess)
        y_fixed = solution.x
        residual = np.linalg.norm(solution.fun)

        inside_range = np.all(y_fixed >= state_lo_norm) and \
                       np.all(y_fixed <= state_hi_norm)
        duplicate = any(
            np.linalg.norm(y_fixed - item["y_norm"]) < ROOT_DEDUP_TOL
            for item in fixed_points
        )

        if residual < ROOT_RESIDUAL_TOL and inside_range and not duplicate:
            fixed_points.append({
                "y_norm": y_fixed,
                "residual": residual,
            })

    return fixed_points


def classify_stability(spectral_abscissa):
    """
    Classify local stability from the largest eigenvalue real part.

    The "spectral abscissa" is just the largest real part among the
    Jacobian's eigenvalues. THe single number that determines whether
    perturbations near the fixed point grow or shrink over time, 
    so a positive real part means growth, negative means decay. 
    We don't trust the sign right at the edge of
    numerical noise, so anything within STABILITY_TOL of zero is called
    "marginal" instead of confidently stable/unstable:
      - spectral_abscissa < -STABILITY_TOL  -> stable (perturbations decay)
      - spectral_abscissa > +STABILITY_TOL  -> unstable (perturbations grow)
      - otherwise                            -> marginal (too close to call)
    """
    if spectral_abscissa < -STABILITY_TOL:
        return "stable"
    if spectral_abscissa > STABILITY_TOL:
        return "unstable"
    return "marginal"


def describe_fixed_point(model, fixed_point, x_norm, time_value,
                         y_mean, y_std):
    """
    Turn one accepted fixed point into a full row of results: its state in
    physical (real-world) units, the Jacobian at that point, its
    eigenvalues, and the resulting stability classification.
    """
    y_norm = fixed_point["y_norm"]
    # Undo the z-score normalisation to get the fixed point back in
    # physical units (e.g. MW) instead of normalised network units.
    y_physical = y_norm * (y_std + 1e-8) + y_mean
    jacobian = state_jacobian(model, y_norm, x_norm, time_value)
    eigenvalues = np.linalg.eigvals(jacobian)
    spectral_abscissa = float(np.max(eigenvalues.real))

    result = {
        "residual_norm": fixed_point["residual"],
        "spectral_abscissa_1_per_s": spectral_abscissa,
        "stability": classify_stability(spectral_abscissa),
    }

    for j, name in enumerate(TARGET_NAMES):
        result[f"fixed_{name}"] = float(y_physical[j])
        result[f"fixed_{name}_normalized"] = float(y_norm[j])

    # Flatten the Jacobian matrix into individual named columns
    # (jacobian_1_1, jacobian_1_2, ...) so it's easy to inspect in a CSV.
    for row in range(model.state_dim):
        for col in range(model.state_dim):
            result[f"jacobian_{row + 1}_{col + 1}_1_per_s"] = \
                float(jacobian[row, col])

    # Eigenvalues can be complex (oscillatory dynamics), so we store real
    # and imaginary parts separately rather than losing the imaginary part.
    for j, eigenvalue in enumerate(eigenvalues, start=1):
        result[f"eigenvalue_{j}_real_1_per_s"] = float(eigenvalue.real)
        result[f"eigenvalue_{j}_imag_1_per_s"] = float(eigenvalue.imag)

    return result


# =============================================================================
# Analysis A: initial operating condition
# =============================================================================

def initial_operating_condition(data, feature_cols):
    """
    Return median initial feature, time, and state values across all runs.

    "Initial" here means the first recorded row of each run — groupby(...)
    .first() grabs that one row per run_id. We then take the median across
    all runs' first rows, rather than the mean, so a handful of unusual
    runs (e.g. an outlier starting condition) can't skew the "typical
    starting point" the way an average would.
    """
    initial_rows = data.groupby("run_id", sort=False).first().reset_index()

    x_initial = initial_rows[feature_cols].median().to_numpy(dtype=np.float64)
    # time_initial is 0.0 by construction: every run's first sample defines
    # the origin of time_norm.
    time_initial = float(initial_rows["time_norm"].median())
    y_initial = initial_rows[TARGET_COL].median().to_numpy(dtype=np.float64)

    return x_initial, time_initial, y_initial


def analyse_initial_condition(model, data, norm_stats, initial_guesses,
                              state_lo_norm, state_hi_norm):
    """
    Analysis A: freeze inputs/time at their typical initial values and find
    every distinct fixed point the network's dynamics settle into there.

    This tells us whether the network "agrees" that a run should start out
    roughly stationary near its actual starting state (expected_initial_*
    below), or whether it thinks the dynamics want to move elsewhere right
    from the start.
    """
    feature_cols = norm_stats["feature_cols"]
    x_mean = np.asarray(norm_stats["X_mean"], dtype=np.float64)
    x_std = np.asarray(norm_stats["X_std"], dtype=np.float64)
    y_mean, y_std = target_normalisation(norm_stats)

    x_initial, time_initial, y_expected = initial_operating_condition(
        data, feature_cols
    )
    # Convert the physical initial inputs into the same
    # z-scored units the network was trained on, since evaluate_rhs/
    # state_jacobian both expect normalised inputs.
    x_norm = (x_initial - x_mean) / (x_std + 1e-8)

    fixed_points = find_fixed_points(
        model, x_norm, time_initial, initial_guesses,
        state_lo_norm, state_hi_norm,
    )

    rows = []
    for fixed_id, fixed_point in enumerate(fixed_points, start=1):
        row = {
            "fixed_point_id": fixed_id,
            "time_norm": time_initial,
        }

        for j, feature in enumerate(feature_cols):
            row[feature] = float(x_initial[j])

        for j, name in enumerate(TARGET_NAMES):
            row[f"expected_initial_{name}"] = float(y_expected[j])

        row.update(describe_fixed_point(
            model, fixed_point, x_norm, time_initial, y_mean, y_std
        ))

        # How far this fixed point sits from where runs actually start, in
        # physical units — a small distance means the network thinks the
        # real starting condition is (near) an equilibrium; a large one
        # means it predicts the state should immediately start drifting.
        fixed_physical = fixed_point["y_norm"] * (y_std + 1e-8) + y_mean
        row["distance_from_expected_initial"] = float(
            np.linalg.norm(fixed_physical - y_expected)
        )
        rows.append(row)

    return pd.DataFrame(rows)


# =============================================================================
# Analysis B: feature-time sweep
# =============================================================================

def make_sweep_axes(data, feature_cols):
    """
    Create min-to-max sweep axes for every feature and normalised time.

    Each axis is N_SWEEP evenly spaced values from that column's observed
    minimum to its observed maximum, in physical units. These get combined
    (see analyse_feature_time_sweep below) into a full grid of frozen
    conditions to search fixed points at.
    """
    axes = {
        feature: np.linspace(
            data[feature].min(), data[feature].max(), N_SWEEP
        )
        for feature in feature_cols
    }
    axes["time_norm"] = np.linspace(
        data["time_norm"].min(), data["time_norm"].max(), N_SWEEP
    )
    return axes


def analyse_feature_time_sweep(model, data, norm_stats, initial_guesses,
                               state_lo_norm, state_hi_norm):
    """
    Analysis B: sweep every exogenous feature and time across their full
    training range, and search for fixed points at every combination.

    itertools.product(*sweep_values) walks every possible combination of
    the per-axis sweep values — e.g. with 3 features + time, each having
    N_SWEEP=8 values, that's 8*8*8*8 = 4096 combinations ("conditions"),
    each one a single frozen (x, t) point to run find_fixed_points() at.
    This is what maps the fixed-point structure out across the network's
    whole training envelope, rather than just at one nominal condition.
    """
    feature_cols = norm_stats["feature_cols"]
    x_mean = np.asarray(norm_stats["X_mean"], dtype=np.float64)
    x_std = np.asarray(norm_stats["X_std"], dtype=np.float64)
    y_mean, y_std = target_normalisation(norm_stats)

    axes = make_sweep_axes(data, feature_cols)
    sweep_names = list(feature_cols) + ["time_norm"]
    sweep_values = [axes[name] for name in sweep_names]
    n_conditions = int(np.prod([len(values) for values in sweep_values]))

    rows = []
    condition_rows = []

    for condition_id, values in enumerate(product(*sweep_values), start=1):
        condition = dict(zip(sweep_names, values))
        x_physical = np.asarray(
            [condition[feature] for feature in feature_cols],
            dtype=np.float64,
        )
        time_value = float(condition["time_norm"])
        x_norm = (x_physical - x_mean) / (x_std + 1e-8)

        fixed_points = find_fixed_points(
            model, x_norm, time_value, initial_guesses,
            state_lo_norm, state_hi_norm,
        )

        # Record one summary row per condition regardless of how many
        # fixed points were found (including zero), so
        # sweep_conditions_without_fixed_point in make_summary() can be
        # computed later without re-running the search.
        condition_rows.append({
            "condition_id": condition_id,
            **{feature: float(condition[feature]) for feature in feature_cols},
            "time_norm": time_value,
            "n_fixed_points": len(fixed_points),
        })

        for fixed_id, fixed_point in enumerate(fixed_points, start=1):
            row = {
                "condition_id": condition_id,
                "fixed_point_id": fixed_id,
                **{feature: float(condition[feature]) for feature in feature_cols},
                "time_norm": time_value,
            }
            row.update(describe_fixed_point(
                model, fixed_point, x_norm, time_value, y_mean, y_std
            ))
            rows.append(row)

        if condition_id == 1 or condition_id % 100 == 0:
            print(
                f"  [{condition_id:6d}/{n_conditions}] "
                f"found {len(fixed_points)} fixed point(s)"
            )

    return pd.DataFrame(rows), pd.DataFrame(condition_rows)


# =============================================================================
# Saving summaries and simple figures
# =============================================================================

def make_initial_plot(initial_results):
    """
    Plot the fixed points found at the initial operating condition.

    This is a 1-D strip plot: every fixed point plotted along a single P
    axis (y just fixed at 0 so the points aren't stacked on top of each
    other), colour coded by stability, with a dashed line marking where
    runs actually start.
    """
    if initial_results.empty:
        return

    fig, ax = plt.subplots(figsize=(6, 2.5))
    colors = initial_results["stability"].map({
        "stable": "tab:blue",
        "unstable": "tab:red",
        "marginal": "tab:gray",
    })
    ax.scatter(initial_results["fixed_P_MW"], np.zeros(len(initial_results)),
               c=colors, s=55)
    ax.axvline(
        initial_results["expected_initial_P_MW"].iloc[0],
        color="black", linestyle="--", linewidth=1.0,
        label="Expected initial state",
    )
    ax.set_xlabel("Fixed-point P (MW)")
    ax.set_yticks([])
    ax.legend()

    fig.tight_layout()
    fig.savefig(OUTPUT_DIR / "initial_condition_fixed_points.png", dpi=300)
    plt.close(fig)


def make_summary(initial_results, sweep_results, sweep_conditions):
    """
    Create a compact one row summary of both analyses: how many fixed
    points were found overall, how many sweep conditions had none at all,
    and a stable/unstable/marginal breakdown for each analysis.
    """
    summary = {
        "state_dimension": len(TARGET_COL),
        "initial_condition_fixed_points": len(initial_results),
        "sweep_conditions": len(sweep_conditions),
        "sweep_conditions_without_fixed_point": int(
            (sweep_conditions["n_fixed_points"] == 0).sum()
        ),
        "sweep_fixed_points": len(sweep_results),
    }

    for label in ["stable", "unstable", "marginal"]:
        summary[f"initial_{label}"] = int(
            (initial_results.get("stability", pd.Series(dtype=str)) == label).sum()
        )
        summary[f"sweep_{label}"] = int(
            (sweep_results.get("stability", pd.Series(dtype=str)) == label).sum()
        )

    return pd.DataFrame([summary])


# =============================================================================
# Main
# =============================================================================

def main():
    """Run both fixed-point analyses and save the results."""
    torch.manual_seed(42)
    np.random.seed(42)
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    model, norm_stats = load_model()
    feature_cols = norm_stats["feature_cols"]
    data = load_training_data(feature_cols)
    y_mean, y_std = target_normalisation(norm_stats)

    # state_lo/state_hi define the observed training target range in
    # physical units; state_lo_norm/state_hi_norm are the same range in
    # normalised units. find_fixed_points() uses the normalised version to
    # reject any "solution" that falls outside what the network actually
    # saw during training (see the inside_range check there).
    target_data = data[TARGET_COL].to_numpy(dtype=np.float64)
    state_lo = target_data.min(axis=0)
    state_hi = target_data.max(axis=0)
    state_lo_norm = (state_lo - y_mean) / (y_std + 1e-8)
    state_hi_norm = (state_hi - y_mean) / (y_std + 1e-8)
    initial_guesses = make_initial_guesses(target_data, y_mean, y_std)

    print("Analysis A: initial operating condition")
    initial_results = analyse_initial_condition(
        model, data, norm_stats, initial_guesses,
        state_lo_norm, state_hi_norm,
    )
    print(f"  Found {len(initial_results)} distinct fixed point(s)")

    print("\nAnalysis B: training-range feature-time sweep")
    sweep_results, sweep_conditions = analyse_feature_time_sweep(
        model, data, norm_stats, initial_guesses,
        state_lo_norm, state_hi_norm,
    )

    initial_results.to_csv(
        OUTPUT_DIR / "fixed_points_initial_condition.csv", index=False
    )
    sweep_results.to_csv(
        OUTPUT_DIR / "fixed_points_feature_time_sweep.csv", index=False
    )
    sweep_conditions.to_csv(
        OUTPUT_DIR / "fixed_point_sweep_conditions.csv", index=False
    )

    summary = make_summary(
        initial_results, sweep_results, sweep_conditions
    )
    summary.to_csv(
        OUTPUT_DIR / "fixed_point_summary.csv", index=False
    )

    make_initial_plot(initial_results)

    print("\nSummary")
    print(summary.to_string(index=False))
    print(f"\nResults saved in: {OUTPUT_DIR.resolve()}")


if __name__ == "__main__":
    main()