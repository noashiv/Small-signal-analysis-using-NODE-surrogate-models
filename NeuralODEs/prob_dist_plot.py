#!/usr/bin/env python3

from pathlib import Path

import numpy as np
import pandas as pd
import plotly.graph_objects as go


# ==================================================
# USER SETTINGS
# ==================================================

DATA_FILE = Path(
    "/zhome/84/1/154964/RAMSES/NeuralODES/data/"
    "all_simulation_timeseries.csv"
)

RESULTS_FILE = Path(
    "/zhome/84/1/154964/RAMSES/NeuralODES/results/"
    "NODE_PhysTime_AR/predictions.csv"
)

OUTPUT_DIR = Path(
    "/zhome/84/1/154964/RAMSES/NeuralODES/results/plots"
)

BINS = 60


# Columns to plot:
# (column_name, x_axis_label)
COLUMNS_TO_PLOT = [
    ("V_N0_pu", "Voltage [p.u.]"),
    ("angle_N0_deg", "Angle [deg]"),
    ("frequency_PV1_Hz", "Frequency [Hz]")
]


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

    fig.write_html(
        output_path.with_suffix(".html")
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
    run_id=None,
    time_col="time_s",
    pred_col="predicted",
    true_col="actual",
):

    if run_id is None:
        run_id = df["run_id"].iloc[0]

    plot_df = df[
        df["run_id"] == run_id
    ].copy()

    plot_df = plot_df.sort_values(
        time_col
    )

    actual = plot_df[
        true_col
    ].to_numpy()

    predicted = plot_df[
        pred_col
    ].to_numpy()

    mae = np.mean(
        np.abs(
            actual - predicted
        )
    )

    fig = go.Figure()

    fig.add_trace(
        go.Scatter(
            x=plot_df[time_col],
            y=plot_df[true_col],
            mode="lines",
            name="Actual",
        )
    )

    fig.add_trace(
        go.Scatter(
            x=plot_df[time_col],
            y=plot_df[pred_col],
            mode="lines",
            name="Prediction",
        )
    )

    fig.update_layout(
        title=(
            f"Prediction vs Actual — "
            f"Simulation {run_id}<br>"
            f"MAE = {mae:.4e}"
        ),
        xaxis_title="Time [s]",
        yaxis_title="P_MainTR [MW]",
        template="plotly_white",
        hovermode="x unified",
    )

    fig.write_html(
        output_path.with_suffix(".html")
    )

    fig.write_image(
        output_path.with_suffix(".png"),
        scale=2
    )


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
        left_on="run_id",
        right_on="simulation_id",
        how="left"
    )

    return merged


# ==================================================
# 1. HISTOGRAM OF PREDICTION ERROR
# ==================================================

def plot_prediction_error_histogram(
    results_df,
    output_path,
):

    df = results_df.copy()

    df["error"] = (
        df["predicted"]
        - df["actual"]
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

    fig.write_html(
        output_path.with_suffix(".html")
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
    results_df,
):

    metrics = []

    for run_id, run_df in results_df.groupby(
        "run_id"
    ):

        error = (
            run_df["predicted"].to_numpy()
            - run_df["actual"].to_numpy()
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
# 2. WORST-CASE PREDICTION
# ==================================================

def plot_worst_case_prediction(
    results_df,
    metrics_df,
    output_path,
    time_col="time",
):

    if metrics_df.empty:
        print(
            "[warn] Cannot determine "
            "worst-case simulation."
        )
        return

    # Simulation with highest RMSE
    worst_index = (
        metrics_df["RMSE"].idxmax()
    )

    worst_info = (
        metrics_df.loc[worst_index]
    )

    worst_simulation = int(
        worst_info["simulation_id"]
    )

    worst_rmse = (
        worst_info["RMSE"]
    )

    worst_mae = (
        worst_info["MAE"]
    )

    disturbance_type = (
        worst_info["disturbance_type"]
    )

    worst_df = results_df[
        results_df["run_id"]
        == worst_simulation
    ].copy()

    worst_df = worst_df.sort_values(
        time_col
    )

    fig = go.Figure()

    fig.add_trace(
        go.Scatter(
            x=worst_df[time_col],
            y=worst_df["actual"],
            mode="lines",
            name="Actual",
        )
    )

    fig.add_trace(
        go.Scatter(
            x=worst_df[time_col],
            y=worst_df["predicted"],
            mode="lines",
            name="Prediction",
        )
    )

    fig.update_layout(
        title=(
            "Worst-case Prediction"
            f"<br>Simulation "
            f"{worst_simulation}"
            f" — {disturbance_type}"
            f"<br>RMSE = "
            f"{worst_rmse:.5f} "
            f", MAE = "
            f"{worst_mae:.5f} "
        ),
        xaxis_title="Time [s]",
        yaxis_title="P_MainTR [MW]",
        template="plotly_white",
        hovermode="x unified",
    )

    fig.write_html(
        output_path.with_suffix(".html")
    )

    fig.write_image(
        output_path.with_suffix(".png"),
        scale=2
    )

    print(
        "\n[WORST CASE]"
    )

    print(
        f"Simulation ID: "
        f"{worst_simulation}"
    )

    print(
        f"Disturbance: "
        f"{disturbance_type}"
    )

    print(
        f"RMSE: "
        f"{worst_rmse:.6f} "
    )

    print(
        f"MAE: "
        f"{worst_mae:.6f} "
    )


# ==================================================
# 3. PERFORMANCE BY DISTURBANCE TYPE
# ==================================================

def plot_disturbance_comparison(
    metrics_df,
    output_path,
):

    valid_df = metrics_df[
        metrics_df[
            "disturbance_type"
        ].notna()
    ].copy()

    if valid_df.empty:
        print(
            "[warn] No disturbance information "
            "available."
        )
        return

    # Calculate mean, standard deviation and
    # number of simulations for every disturbance.
    summary = (
        valid_df
        .groupby(
            "disturbance_type"
        )["RMSE"]
        .agg(
            ["mean", "std", "count"]
        )
        .reset_index()
    )

    fig = go.Figure()

    fig.add_trace(
        go.Bar(
            x=summary[
                "disturbance_type"
            ],
            y=summary["mean"],
            error_y=dict(
                type="data",
                array=summary[
                    "std"
                ].fillna(0),
                visible=True,
            ),
            text=[
                (
                    f"{value:.4f}"
                )
                for value
                in summary["mean"]
            ],
            textposition="outside",
            name="Mean RMSE"
        )
    )

    fig.update_layout(
        title=(
            "Model Performance by "
            "Disturbance Type"
        ),
        xaxis_title="Disturbance type",
        yaxis_title="Mean RMSE",
        template="plotly_white",
    )

    fig.write_html(
        output_path.with_suffix(".html")
    )

    fig.write_image(
        output_path.with_suffix(".png"),
        scale=2
    )

    summary.to_csv(
        OUTPUT_DIR
        / "disturbance_performance.csv",
        index=False
    )

    print(
        "\n[PERFORMANCE BY DISTURBANCE]"
    )

    print(
        summary.to_string(
            index=False
        )
    )

# ==================================================
# BEST-CASE PREDICTION
# ==================================================

def plot_best_case_prediction(
    results_df,
    metrics_df,
    output_path,
    time_col="time_s",
):

    if metrics_df.empty:
        print(
            "[warn] Cannot determine "
            "best-case simulation."
        )
        return

    # Simulation with lowest RMSE
    best_index = (
        metrics_df["RMSE"].idxmin()
    )

    best_info = (
        metrics_df.loc[best_index]
    )

    best_simulation = int(
        best_info["simulation_id"]
    )

    best_rmse = (
        best_info["RMSE"]
    )

    best_mae = (
        best_info["MAE"]
    )

    disturbance_type = (
        best_info["disturbance_type"]
    )

    # Select the best simulation
    best_df = results_df[
        results_df["run_id"]
        == best_simulation
    ].copy()

    best_df = best_df.sort_values(
        time_col
    )

    # Create figure
    fig = go.Figure()

    # Actual RAMSES trajectory
    fig.add_trace(
        go.Scatter(
            x=best_df[time_col],
            y=best_df["actual"],
            mode="lines",
            name="Actual",
        )
    )

    # Neural ODE prediction
    fig.add_trace(
        go.Scatter(
            x=best_df[time_col],
            y=best_df["predicted"],
            mode="lines",
            name="Prediction",
        )
    )

    fig.update_layout(
        title=(
            "Best-case Prediction"
            f"<br>Simulation "
            f"{best_simulation}"
            f" — {disturbance_type}"
            f"<br>RMSE = "
            f"{best_rmse:.5f} "
            f", MAE = "
            f"{best_mae:.5f} "
        ),
        xaxis_title="Time [s]",
        yaxis_title="P_MainTR [MW]",
        template="plotly_white",
        hovermode="x unified",
    )

    # Save interactive HTML
    fig.write_html(
        output_path.with_suffix(".html")
    )

    # Save PNG
    fig.write_image(
        output_path.with_suffix(".png"),
        scale=2
    )

    print(
        "\n[BEST CASE]"
    )

    print(
        f"Simulation ID: "
        f"{best_simulation}"
    )

    print(
        f"Disturbance: "
        f"{disturbance_type}"
    )

    print(
        f"RMSE: "
        f"{best_rmse:.6f} "
    )

    print(
        f"MAE: "
        f"{best_mae:.6f} "
    )
# ==================================================
# MAIN
# ==================================================

def main():

    OUTPUT_DIR.mkdir(
        parents=True,
        exist_ok=True
    )

    print(
        f"[*] Loading {DATA_FILE}"
    )

    df = pd.read_csv(
        DATA_FILE
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
            OUTPUT_DIR
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
            results_df["run_id"].iloc[0]
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

        plot_prediction_vs_actual(
            results_df,
            OUTPUT_DIR
            / "prediction_vs_actual",
            run_id=run_id,
            time_col="time_s",
        )

        # --------------------------------------------------
        # Histogram of prediction errors
        # --------------------------------------------------

        plot_prediction_error_histogram(
            results_df,
            OUTPUT_DIR
            / "prediction_error_histogram",
        )

        # --------------------------------------------------
        # Calculate error per simulation
        # --------------------------------------------------

        metrics_df = (
            calculate_run_metrics(
                results_df
            )
        )

        metrics_df.to_csv(
            OUTPUT_DIR
            / "simulation_performance.csv",
            index=False
        )

        # --------------------------------------------------
        # Worst-case prediction
        # --------------------------------------------------

        plot_worst_case_prediction(
            results_df,
            metrics_df,
            OUTPUT_DIR
            / "worst_case_prediction",
            time_col="time_s",
        )

        # --------------------------------------------------
        # Best-case prediction
        # --------------------------------------------------

        plot_best_case_prediction(
            results_df,
            metrics_df,
            OUTPUT_DIR
            / "best_case_prediction",
            time_col="time_s",
        )

        # --------------------------------------------------
        # Comparison between disturbance types
        # --------------------------------------------------

        plot_disturbance_comparison(
            metrics_df,
            OUTPUT_DIR
            / "performance_by_disturbance",
        )

    else:

        print(
            f"[warn] Results file not found: "
            f"{RESULTS_FILE}"
        )

    print(
        f"\n[OK] Plots written to: "
        f"{OUTPUT_DIR}"
    )


if __name__ == "__main__":
    main()