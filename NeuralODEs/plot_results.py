#!/usr/bin/env python3
import sys
from pathlib import Path
import os
_ROOT = Path(__file__).resolve().parent.parent  
sys.path.insert(0, str(_ROOT))

import numpy as np
import pandas as pd
import plotly.graph_objects as go
from plotly.subplots import make_subplots
 
from input_data import TARGET_COLS, FEATURE_COLS, DATA_PATH, OUTPUT_DIR

# ==================================================
# USER SETTINGS
# ==================================================
OUTPUT_DIR = Path(OUTPUT_DIR)
RESULTS_FILE = OUTPUT_DIR / "NODE_PhysTime_AR" / "predictions.csv"
FIXED_OUTPUT = OUTPUT_DIR / "fixed points" 

OUTPUT = OUTPUT_DIR / "plots"


OUTPUT.mkdir(parents=True, exist_ok=True)
BINS = 60
X_AXIS = FEATURE_COLS[0]
Y_AXIS = "time_norm"

# Columns to plot:
# (column_name, x_axis_label)
COLUMNS_TO_PLOT = [
    ("V_N0_pu", "Voltage [p.u.]"),
    ("angle_N0_deg", "Angle [deg]"),
    ("frequency_PV1_Hz", "Frequency [Hz]")
]
def _validate_axes(df, x_col, y_col):
    for col in (x_col, y_col):
        if col not in df.columns:
            raise ValueError(
                f"'{col}' not found in the results file. "
                f"Available sweep columns: "
                f"{[c for c in FEATURE_COLS] + ['time_norm']}"
            )
 
 
def _pivot(df, x_col, y_col, value_col, aggfunc):
    """
    Aggregate value_col over every axis except x_col/y_col, then pivot
    into a 2D grid suitable for go.Heatmap. Rows/columns are sorted by
    their numeric axis value so the heatmap reads left-to-right,
    bottom-to-top in the natural order of the swept values.
    """
    pivoted = (
        df
        .groupby([y_col, x_col])[value_col]
        .agg(aggfunc)
        .reset_index()
        .pivot(index=y_col, columns=x_col, values=value_col)
        .sort_index(axis=0)
        .sort_index(axis=1)
    )
    return pivoted
# ==================================================
# GENERAL DISTRIBUTION PLOT
# ==================================================

def plot_distribution(
    series,
    title,
    xlabel,
    output_path,
):
    values = pd.to_numeric(
        series,
        errors="coerce"
    ).dropna()

    if len(values) == 0:
        print(
            f"[warn] No valid samples for "
            f"{output_path.name}"
        )
        return

    output_path.parent.mkdir(
        parents=True,
        exist_ok=True
    )

    mean = values.mean()
    median = values.median()

    stats_text = (
        f"Mean: {mean:.4f}<br>"
        f"Median: {median:.4f}<br>"
        f"Min: {values.min():.4f}<br>"
        f"Max: {values.max():.4f}<br>"
        f"Std: {values.std():.4f}<br>"
    )

    fig = go.Figure()

    fig.add_trace(
        go.Histogram(
            x=values,
            nbinsx=BINS,
            histnorm="probability density",
            name="Distribution",
        )
    )

    fig.add_vline(
        x=mean,
        line_color="red"
    )

    fig.add_vline(
        x=median,
        line_color="green",
        line_dash="dot"
    )

    fig.add_vline(
        x=0,
        line_color="black",
        line_dash="dash",
    )

    fig.update_layout(
        title=title,
        xaxis_title=xlabel,
        yaxis_title="Density",
        template="plotly_white",
        bargap=0.02,
        margin=dict(r=180),
    )

    fig.add_annotation(
        x=1.02,
        y=0.98,
        xref="paper",
        yref="paper",
        xanchor="left",
        yanchor="top",
        text=stats_text,
        showarrow=False,
        align="left",
        bordercolor="black",
        borderwidth=1,
        bgcolor="white",
    )

    fig.write_image(
        output_path.with_suffix(".png"),
        scale=2
    )



# ==================================================
# PREDICTION VS ACTUAL
# ==================================================

def plot_prediction_vs_actual(
    df,
    output_path,
    col_name,
    run_id=None,
    time_col="time_s",
    pred_col=None,
    true_col=None,
):
    if pred_col is None:
        pred_col = f"predicted_{col_name}"
    if true_col is None:
        true_col = f"actual_{col_name}"

    if run_id is None:
        run_id = df["simulation_id"].iloc[0]

    plot_df = df[df["simulation_id"] == run_id].copy()
    plot_df = plot_df.sort_values(time_col)

    actual = plot_df[true_col].to_numpy()
    predicted = plot_df[pred_col].to_numpy()

    mae = np.mean(np.abs(actual - predicted))

    fig = go.Figure()
    fig.add_trace(go.Scatter(x=plot_df[time_col], y=plot_df[true_col], mode="lines", name="Actual"))
    fig.add_trace(go.Scatter(x=plot_df[time_col], y=plot_df[pred_col], mode="lines", name="Prediction"))

    fig.update_layout(
        title=f"Prediction vs Actual — Simulation {run_id}<br>MAE = {mae:.4e}",
        xaxis_title="Time [s]",
        yaxis_title="P_MainTR [MW]",
        template="plotly_white",
        hovermode="x unified",
    )

    fig.write_image(output_path.with_suffix(".png"), scale=2)


# ==================================================
# MODEL DYNAMIC — TYPICAL RUN PER DISTURBANCE TYPE
# ==================================================
 
def plot_typical_prediction_by_disturbance(
    results_df,
    metrics_df,
    output_path,
    col_name,
    time_col="time_s",
):
    """
    For each disturbance type, picks the run whose RMSE is closest to the
    MEDIAN RMSE within that type (not the best- or worst-case run), and
    plots predicted vs. actual for that run. All disturbance types are
    shown side by side in one figure, giving a representative — rather
    than cherry-picked — view of how the model's learned dynamics behave
    across the different kinds of disturbances it was trained on.
    """
 
    valid_df = metrics_df[metrics_df["disturbance_type"].notna()].copy()
 
    if valid_df.empty:
        print("[warn] No disturbance information available — "
              "cannot build typical-run comparison.")
        return
 
    disturbance_types = sorted(valid_df["disturbance_type"].unique())
 
    fig = make_subplots(
        rows=1,
        cols=len(disturbance_types),
        subplot_titles=[
        f"{d} (Sim {None})" for d in disturbance_types
    ],
    )
 
    for col_index, disturbance_type in enumerate(disturbance_types, start=1):
 
        subset = valid_df[valid_df["disturbance_type"] == disturbance_type]
 
        if subset.empty:
            continue
 
        # Find the run whose RMSE is closest to this disturbance type's
        # median RMSE — a "typical" run, not the best or worst one.
        median_rmse = subset["RMSE"].median()
        subset = subset.copy()
        subset["distance_to_median"] = (subset["RMSE"] - median_rmse).abs()
        typical_row = subset.loc[subset["distance_to_median"].idxmin()]
 
        typical_simulation = int(typical_row["simulation_id"])
        typical_rmse = typical_row["RMSE"]
        typical_mae = typical_row["MAE"]
 
        run_df = results_df[
            results_df["simulation_id"] == typical_simulation
        ].copy()
        run_df = run_df.sort_values(time_col)
 
        show_legend = (col_index == 1)  # only show legend once
 
        fig.add_trace(
            go.Scatter(
                x=run_df[time_col],
                y=run_df[f"actual_{col_name}"],
                mode="lines",
                name="Actual",
                legendgroup="actual",
                showlegend=show_legend,
                line=dict(color="blue"),
            ),
            row=1, col=col_index,
        )
 
        fig.add_trace(
            go.Scatter(
                x=run_df[time_col],
                y=run_df[f"predicted_{col_name}"],
                mode="lines",
                name="Prediction",
                legendgroup="prediction",
                showlegend=show_legend,
                line=dict(color="red"),
            ),
            row=1, col=col_index,
        )
 
        # Update this subplot's title now that we know the actual
        # simulation ID and error values for the typical run found.
        fig.layout.annotations[col_index - 1].update(
            text=(
                f"{disturbance_type}<br>"
                f"RMSE = {typical_rmse:.4f}, MAE = {typical_mae:.4f}"
            )
        )
 
        fig.update_xaxes(title_text="Time [s]", row=1, col=col_index)
        if col_index == 1:
            fig.update_yaxes(title_text=f"{col_name} [MW]", row=1, col=col_index)
 
    fig.update_layout(
        title="Typical Run per Disturbance Type",
        template="plotly_white",
        height=450,
        width=450 * len(disturbance_types),
        hovermode="x unified",
    )
    fig.write_image(output_path.with_suffix(".png"), scale=2)


# ==================================================
# MODEL DYNAMIC — OVERLAY OF MANY RUNS
# ==================================================
 
def plot_prediction_overlay(
    results_df,
    output_path,
    col_name,
    time_col="time_s",
    n_runs=30,
    seed=42,
):
    """
    Overlays predicted and actual trajectories for a random sample of
    n_runs test runs, all on the same axes, at low opacity — matching the
    style used for the spectral abscissa plot. Overlapping runs form a
    denser band rather than individual streaks.
 
    This shows the model's GENERAL tendency across many runs at once —
    does it track the baseline and the overall shape of the dynamics? —
    rather than any single run's specific error numbers. It complements
    the typical-run-per-disturbance plot: that one shows one representative
    example per category in detail, this one shows the broad pattern
    across a whole sample simultaneously.
    """
 
    all_simulation_ids = results_df["simulation_id"].unique()
 
    if len(all_simulation_ids) == 0:
        print("[warn] No runs available for the prediction overlay plot.")
        return
 
    rng = np.random.default_rng(seed)
    n_runs = min(n_runs, len(all_simulation_ids))
    sampled_ids = rng.choice(all_simulation_ids, size=n_runs, replace=False)
 
    fig = go.Figure()
 
    for i, simulation_id in enumerate(sampled_ids):
        run_df = results_df[
            results_df["simulation_id"] == simulation_id
        ].copy()
        run_df = run_df.sort_values(time_col)
 
        # Only label the first run's traces, so the legend shows exactly
        # two entries ("Actual", "Predicted") instead of n_runs duplicates.
        show_legend = (i == 0)
 
        fig.add_trace(
            go.Scatter(
                x=run_df[time_col],
                y=run_df[f"actual_{col_name}"],
                mode="lines",
                name="Actual",
                legendgroup="actual",
                showlegend=show_legend,
                line=dict(color="blue", width=0.8),
                opacity=0.25,
                hoverinfo="skip",
            )
        )
 
        fig.add_trace(
            go.Scatter(
                x=run_df[time_col],
                y=run_df[f"predicted_{col_name}"],
                mode="lines",
                name="Predicted",
                legendgroup="predicted",
                showlegend=show_legend,
                line=dict(color="red", width=0.8),
                opacity=0.25,
                hoverinfo="skip",
            )
        )
 
    fig.update_layout(
        title=(
            "Predicted vs. Actual Trajectories"
            f"<br><sup>{n_runs} randomly sampled test runs</sup>"
        ),
        xaxis_title="Time [s]",
        yaxis_title=f"{col_name} [MW]",
        template="plotly_white",
        hovermode="x unified",
    )
 
    fig.write_image(output_path.with_suffix(".png"), scale=2)
 
# ==================================================
# ADD DISTURBANCE INFORMATION TO RESULTS
# ==================================================

def add_disturbance_information(
    results_df,
    simulation_df,
):

    # One metadata row per RAMSES simulation.
    metadata_columns = [
        "simulation_id",
        "disturbance_type",
    ]

    optional_columns = [
        "disturbance_start_time",
        "P_step",
        "Q_step",
        "ramp_time",
        "fault_R",
        "fault_X",
        "fault_impedance_magnitude",
        "fault_duration",
        "fault_clear_time",
    ]

    for column in optional_columns:
        if column in simulation_df.columns:
            metadata_columns.append(column)

    metadata = (
        simulation_df[
            metadata_columns
        ]
        .drop_duplicates(
            subset=["simulation_id"]
        )
        .copy()
    )

    # Neural ODE run_id corresponds to RAMSES simulation_id.
    merged = results_df.merge(
    metadata,
    on="simulation_id",
    how="left"
    )   

    return merged

# =============================================================================
# 1. Stability heatmap
# =============================================================================
 
def plot_stability_heatmap(fixed_points_df, x_col, y_col, output_path):
    """
    Heatmap of the most unstable fixed point's spectral abscissa found at
    each (x_col, y_col) combination, aggregated (max) over every other
    swept axis and over every fixed point found at that condition.
    """
    _validate_axes(fixed_points_df, x_col, y_col)
 
    if fixed_points_df.empty:
        print("[warn] No fixed points found in Analysis B results — "
              "nothing to plot for the stability heatmap.")
        return
 
    pivoted = _pivot(
        fixed_points_df, x_col, y_col,
        value_col="spectral_abscissa_1_per_s",
        aggfunc="max",
    )
 
    # Centre the colour scale on zero, the stability boundary, so stable
    # (negative) and unstable (positive) regions are immediately visible
    # by colour direction rather than shade alone.
    max_abs = float(pivoted.abs().to_numpy(na_value=0).max())
 
    fig = go.Figure(
        data=go.Heatmap(
            z=pivoted.values,
            x=pivoted.columns,
            y=pivoted.index,
            colorscale="RdBu_r",
            zmid=0,
            zmin=-max_abs,
            zmax=max_abs,
            colorbar=dict(title="Spectral abscissa (1/s)"),
            hovertemplate=(
                f"{x_col}: %{{x}}<br>"
                f"{y_col}: %{{y}}<br>"
                "Max spectral abscissa: %{z:.5f} 1/s<extra></extra>"
            ),
        )
    )
 
    fig.update_layout(
        title=(
            "Fixed-point stability across the swept operating envelope"
            "<br><sup>Colour = spectral abscissa of the most unstable "
            "fixed point found at that condition (max over all other "
            "swept axes)</sup>"
        ),
        xaxis_title=x_col,
        yaxis_title=y_col,
        template="plotly_white",
    )
    fig.write_image(output_path.with_suffix(".png"), scale=2)
 
    print(f"[OK] Stability heatmap saved to {output_path}.png/.html")
 
 
# =============================================================================
# 2. Fixed-point count heatmap
# =============================================================================
 
def plot_fixed_point_count_heatmap(sweep_conditions_df, x_col, y_col, output_path):
    """
    Heatmap of the average number of distinct fixed points found at each
    (x_col, y_col) combination, aggregated (mean) over every other swept
    axis. Highlights regions where the network's dynamics have zero,
    one, or several equilibria.
    """
    _validate_axes(sweep_conditions_df, x_col, y_col)
 
    pivoted = _pivot(
        sweep_conditions_df, x_col, y_col,
        value_col="n_fixed_points",
        aggfunc="mean",
    )
 
    fig = go.Figure(
        data=go.Heatmap(
            z=pivoted.values,
            x=pivoted.columns,
            y=pivoted.index,
            colorscale="Viridis",
            colorbar=dict(title="Mean # fixed points"),
            hovertemplate=(
                f"{x_col}: %{{x}}<br>"
                f"{y_col}: %{{y}}<br>"
                "Mean fixed points: %{z:.2f}<extra></extra>"
            ),
        )
    )
 
    fig.update_layout(
        title=(
            "Number of fixed points across the swept operating envelope"
            "<br><sup>Colour = average number of distinct fixed points "
            "found (mean over all other swept axes) — dark cells had "
            "none</sup>"
        ),
        xaxis_title=x_col,
        yaxis_title=y_col,
        template="plotly_white",
    )
 
    fig.write_image(output_path.with_suffix(".png"), scale=2)
 
    print(f"[OK] Fixed-point count heatmap saved to {output_path}.png/.html")
 

# ==================================================
#  HISTOGRAM OF PREDICTION ERROR
# ==================================================

def plot_prediction_error_histogram(
    results_df,
    output_path,
    col_name
):

    df = results_df.copy()

    df["error"] = (
        df[f"predicted_{col_name}"]
        - df[f"actual_{col_name}"]
    )

    errors = (
        pd.to_numeric(
            df["error"],
            errors="coerce"
        )
        .replace(
            [np.inf, -np.inf],
            np.nan
        )
        .dropna()
    )

    if len(errors) == 0:
        print(
            "[warn] No valid prediction "
            "errors found."
        )
        return

    mean_error = errors.mean()
    median_error = errors.median()
    mae = np.mean(np.abs(errors))
    rmse = np.sqrt(
        np.mean(errors ** 2)
    )

    stats_text = (
        f"Mean error: {mean_error:.5f} <br>"
        f"Median error: {median_error:.5f} <br>"
        f"MAE: {mae:.5f} <br>"
        f"RMSE: {rmse:.5f} <br>"
        f"Std: {errors.std():.5f}"
    )

    fig = go.Figure()

    fig.add_trace(
        go.Histogram(
            x=errors,
            nbinsx=BINS,
            histnorm="probability density",
            name="Prediction error"
        )
    )

    # Perfect prediction
    fig.add_vline(
        x=0,
        line_color="black",
        line_dash="dash",
    )

    # Mean prediction error
    fig.add_vline(
        x=mean_error,
        line_color="red",
    )

    fig.update_layout(
        title="Prediction Error Distribution",
        xaxis_title=(
            "Prediction error "
            "(Predicted - Actual) [MW]"
        ),
        yaxis_title="Density",
        template="plotly_white",
        bargap=0.02,
        margin=dict(r=220),
    )

    fig.add_annotation(
        x=1.02,
        y=0.98,
        xref="paper",
        yref="paper",
        xanchor="left",
        yanchor="top",
        text=stats_text,
        showarrow=False,
        align="left",
        bordercolor="black",
        borderwidth=1,
        bgcolor="white",
    )

    fig.write_image(
        output_path.with_suffix(".png"),
        scale=2
    )

    print(
        f"[RESULT] Overall RMSE: "
        f"{rmse:.6f}"
    )

    print(
        f"[RESULT] Overall MAE: "
        f"{mae:.6f}"
    )


# ==================================================
# CALCULATE ERROR FOR EACH SIMULATION
# ==================================================

def calculate_run_metrics(
    results_df, col_name
):

    metrics = []

    for run_id, run_df in results_df.groupby(
        "simulation_id"
    ):

        error = (
            run_df[f"predicted_{col_name}"].to_numpy()
            - run_df[f"actual_{col_name}"].to_numpy()
        )

        valid = np.isfinite(error)

        error = error[valid]

        if len(error) == 0:
            continue

        rmse = np.sqrt(
            np.mean(
                error ** 2
            )
        )

        mae = np.mean(
            np.abs(error)
        )

        max_error = np.max(
            np.abs(error)
        )

        disturbance_type = "unknown"

        if (
            "disturbance_type"
            in run_df.columns
        ):
            disturbance_type = (
                run_df[
                    "disturbance_type"
                ].iloc[0]
            )

        metrics.append({
            "simulation_id": int(run_id),
            "disturbance_type":
                disturbance_type,
            "RMSE": rmse,
            "MAE": mae,
            "Max_absolute_error":
                max_error,
        })

    return pd.DataFrame(metrics)

# ==================================================
# DISTURBANCE IMPACT — VOLTAGE AND POWER FLOW
# ==================================================
 
def plot_disturbance_impact(
    df,
    results_df,
    output_path,
    voltage_col="V_N0_pu",
    power_col="P_MainTR_MW",
    time_col="time_s",
    window_before=2.0,
    window_after=8.0,
):
    """
    For each disturbance type, picks a representative run (the one whose
    voltage drop is closest to the median drop within that type) and
    plots how voltage and power flow both evolve around the disturbance,
    on shared time axes with two y-axes (voltage left, power right).
 
    df is the raw RAMSES simulation data (voltage, power, time, per
    simulation_id). results_df is the trained model's results, which
    already carries disturbance_type (and disturbance_start_time)
    merged in per simulation_id — used here only to identify each run's
    disturbance type and start time, not for the plotted signal itself.
 
    Zooms into a window around the disturbance (window_before/after
    seconds) rather than showing the full run, so the actual response
    shape is visible instead of being dwarfed by the flat baseline.
    """
 
    if "disturbance_type" not in results_df.columns:
        print("[warn] results_df has no 'disturbance_type' column.")
        return
 
    if "disturbance_start_time" not in results_df.columns:
        print("[warn] results_df has no 'disturbance_start_time' column — "
              "cannot window around the disturbance.")
        return
 
    # One row per simulation: simulation_id, disturbance_type,
    # disturbance_start_time. results_df has these repeated across every
    # timestep, so take the first occurrence per simulation.
    disturbance_info_df = (
        results_df
        .groupby("simulation_id")[["disturbance_type", "disturbance_start_time"]]
        .first()
        .reset_index()
    )
 
    disturbance_types = sorted(
        disturbance_info_df["disturbance_type"].dropna().unique()
    )
 
    if not disturbance_types:
        print("[warn] No disturbance types found — nothing to plot.")
        return
 
    fig = make_subplots(
        rows=1,
        cols=len(disturbance_types),
        specs=[[{"secondary_y": True}] * len(disturbance_types)],
        subplot_titles=disturbance_types,
    )
 
    for col_index, disturbance_type in enumerate(disturbance_types, start=1):
 
        type_info = disturbance_info_df[
            disturbance_info_df["disturbance_type"] == disturbance_type
        ].copy()
 
        if type_info.empty:
            continue
 
        # Compute each run's voltage drop, so we can pick the run
        # closest to the median drop within this disturbance type —
        # a representative example, not a cherry-picked one.
        drops = []
        for _, row in type_info.iterrows():
            simulation_id = row["simulation_id"]
            start_time = row["disturbance_start_time"]
 
            run_data = df[df["simulation_id"] == simulation_id]
            run_data = run_data.sort_values(time_col)
 
            baseline_mask = run_data[time_col] < start_time
            window_mask = (
                (run_data[time_col] >= start_time)
                & (run_data[time_col] <= start_time + window_after)
            )
 
            if not baseline_mask.any() or not window_mask.any():
                continue
 
            baseline_voltage = run_data.loc[baseline_mask, voltage_col].iloc[-1]
            min_voltage = run_data.loc[window_mask, voltage_col].min()
 
            drops.append({
                "simulation_id": simulation_id,
                "start_time": start_time,
                "voltage_drop": baseline_voltage - min_voltage,
            })
 
        if not drops:
            continue
 
        drops_df = pd.DataFrame(drops)
        median_drop = drops_df["voltage_drop"].median()
        drops_df["distance_to_median"] = (
            drops_df["voltage_drop"] - median_drop
        ).abs()
        typical_row = drops_df.loc[drops_df["distance_to_median"].idxmin()]
 
        typical_simulation = typical_row["simulation_id"]
        start_time = typical_row["start_time"]
 
        run_df = df[df["simulation_id"] == typical_simulation].copy()
        run_df = run_df.sort_values(time_col)
 
        window_mask = (
            (run_df[time_col] >= start_time - window_before)
            & (run_df[time_col] <= start_time + window_after)
        )
        window_df = run_df.loc[window_mask]
 
        show_legend = (col_index == 1)
 
        # Voltage trace — left y-axis.
        fig.add_trace(
            go.Scatter(
                x=window_df[time_col],
                y=window_df[voltage_col],
                mode="lines",
                name="Voltage (V_N0)",
                legendgroup="voltage",
                showlegend=show_legend,
                line=dict(color="blue"),
            ),
            row=1, col=col_index,
            secondary_y=False,
        )
 
        # Power flow trace — right y-axis.
        fig.add_trace(
            go.Scatter(
                x=window_df[time_col],
                y=window_df[power_col],
                mode="lines",
                name="Power flow (P_MainTR)",
                legendgroup="power",
                showlegend=show_legend,
                line=dict(color="red"),
            ),
            row=1, col=col_index,
            secondary_y=True,
        )
 
        # Mark the disturbance start with a vertical dashed line.
        fig.add_vline(
            x=start_time,
            line_dash="dash",
            line_color="gray",
            row=1, col=col_index,
        )
 
        fig.update_xaxes(title_text="Time [s]", row=1, col=col_index)
 
        if col_index == 1:
            fig.update_yaxes(
                title_text=f"{voltage_col} [pu]",
                row=1, col=col_index, secondary_y=False,
            )
        if col_index == len(disturbance_types):
            fig.update_yaxes(
                title_text=f"{power_col} [MW]",
                row=1, col=col_index, secondary_y=True,
            )
 
    fig.update_layout(
        title="Disturbance Impact — Voltage and Power Flow Response",
        template="plotly_white",
        height=450,
        width=450 * len(disturbance_types),
        hovermode="x unified",
        legend=dict(orientation="h", y=1.15),
    )

    fig.write_image(output_path.with_suffix(".png"), scale=2)
 

# ==================================================
# BOXPLOT OF ERROR METRICS ACROSS SIMULATIONS
# ==================================================

def plot_error_metrics_boxplot(
    metrics_df,
    output_path,
):
    """
    Boxplot showing the distribution of RMSE, MAE, and Max_absolute_error
    across all simulations — one box per metric, so you can see the spread
    (not just the mean) of how well the model performs run to run.
    """

    if metrics_df.empty:
        print(
            "[warn] Cannot build error metrics "
            "boxplot: no metrics available."
        )
        return

    metric_columns = [
        "RMSE",
        "MAE",
        "Max_absolute_error",
    ]

    metric_columns = [
        column
        for column in metric_columns
        if column in metrics_df.columns
    ]

    if not metric_columns:
        print(
            "[warn] None of the expected error "
            "columns were found for the boxplot."
        )
        return

    fig = go.Figure()

    for column in metric_columns:
        values = pd.to_numeric(
            metrics_df[column],
            errors="coerce"
        ).dropna()

        fig.add_trace(
            go.Box(
                y=values,
                name=column,
                boxpoints="outliers",
            )
        )

    fig.update_layout(
        title="Error Metric Distribution Across Simulations",
        yaxis_title="Error [MW]",
        template="plotly_white",
    )

    fig.write_image(
        output_path.with_suffix(".png"),
        scale=2
    )

    print(
        "\n[ERROR METRIC SPREAD]"
    )

    print(
        metrics_df[metric_columns]
        .describe()
        .to_string()
    )

# ==================================================
# MAIN
# ==================================================

def main():

    OUTPUT.mkdir(
        parents=True,
        exist_ok=True
    )

    print(
        f"[*] Loading {DATA_PATH}"
    )

    df = pd.read_csv(
        DATA_PATH
    )

    # ==================================================
    # Input distributions
    # ==================================================

    for column_name, xlabel in COLUMNS_TO_PLOT:

        if column_name not in df.columns:

            print(
                f"[warn] Column not found: "
                f"{column_name}"
            )

            continue

        output_path = (
            OUTPUT
            / f"{column_name}_distribution"
        )

        plot_distribution(
            df[column_name],
            title=column_name,
            xlabel=xlabel,
            output_path=output_path,
        )
                

    # ==================================================
    # Model performance
    # ==================================================

    if RESULTS_FILE.exists():

        print(
            f"[*] Loading {RESULTS_FILE}"
        )

        results_df = pd.read_csv(
            RESULTS_FILE
        )


        # Add disturbance information from
        # original RAMSES dataset.
        results_df = (
            add_disturbance_information(
                results_df,
                df
            )
        )


        # --------------------------------------------------
        # Example prediction
        # --------------------------------------------------

        run_id = int(
            results_df["simulation_id"].iloc[0]
        )

        run_info = df[
            df["simulation_id"]
            == run_id
        ]

        print(
            f"\nSimulation {run_id}"
        )

        info_columns = [
            "disturbance_type",
            "disturbance_start_time",
            "fault_duration",
            "fault_R",
            "fault_X",
            "fault_impedance_magnitude"
        ]

        info_columns = [
            column
            for column in info_columns
            if column in run_info.columns
        ]

        print(
            run_info[
                info_columns
            ]
            .drop_duplicates()
        )
        plot_disturbance_impact(
            df,           # RAMSES-data: V_N0_pu, P_MainTR_MW, time_s, simulation_id
            results_df,   # model-resultater: simulation_id, disturbance_type, disturbance_start_time
            OUTPUT / "disturbance_impact",
        )
        for j, col_name in enumerate(TARGET_COLS):
            plot_prediction_vs_actual(
                results_df,
                OUTPUT
                / f"prediction_vs_actual_{col_name}",
                col_name=col_name,
                run_id=run_id,
                time_col="time_s"
                )   

            # --------------------------------------------------
            # Histogram of prediction errors
            # --------------------------------------------------

            plot_prediction_error_histogram(
                results_df,
                OUTPUT
                / f"prediction_error_histogram_{col_name}",
                col_name=col_name,
            )

            # --------------------------------------------------
            # Calculate error per simulation
            # --------------------------------------------------

            metrics_df = (
                calculate_run_metrics(
                    results_df, col_name=col_name
                )
            )

            metrics_df.to_csv(
                OUTPUT
                / f"simulation_performance_{col_name}.csv",
                index=False
            )
            
            # --------------------------------------------------
            # Average-case prediction
            # --------------------------------------------------
 
            plot_typical_prediction_by_disturbance(
                results_df,
                metrics_df,
                OUTPUT / f"typical_run_by_disturbance_{col_name}",
                col_name=col_name,
                time_col="time_s",
            )

            plot_prediction_overlay(
                results_df,
                OUTPUT / f"prediction_overlay_{col_name}",
                col_name=col_name,
                time_col="time_s",
                n_runs=25,
            )



        # --------------------------------------------------
        # Boxplot of error metrics across simulations
        # --------------------------------------------------

        plot_error_metrics_boxplot(
            metrics_df,
            OUTPUT
            / "error_metrics_boxplot",
        )


    else:

        print(
            f"[warn] Results file not found: "
            f"{RESULTS_FILE}"
        )

    print(
        f"\n[OK] Plots written to: "
        f"{OUTPUT}"
    )
    fixed_points_path = FIXED_OUTPUT / "fixed_points_feature_time_sweep.csv"
    sweep_conditions_path = FIXED_OUTPUT / "fixed_point_sweep_conditions.csv"
 
    if not fixed_points_path.exists() or not sweep_conditions_path.exists():
        raise FileNotFoundError(
            "Expected sweep result files not found. Run fixedpoints.py "
            "first so it can produce:\n"
            f"  {fixed_points_path}\n"
            f"  {sweep_conditions_path}"
        )
    fixed_points_df = pd.read_csv(fixed_points_path)
    sweep_conditions_df = pd.read_csv(sweep_conditions_path)

    plot_stability_heatmap(
        fixed_points_df, X_AXIS, Y_AXIS,
        OUTPUT / f"stability_heatmap_{X_AXIS}_vs_{Y_AXIS}",
    )
 
    plot_fixed_point_count_heatmap(
        sweep_conditions_df, X_AXIS, Y_AXIS,
        OUTPUT / f"fixed_point_count_heatmap_{X_AXIS}_vs_{Y_AXIS}",
    )
 
    print(f"\n[OK] Heatmaps written to: {OUTPUT.resolve()}")
 

if __name__ == "__main__":
    main()
