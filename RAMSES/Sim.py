import sys
import os
import random
import traceback

import numpy as np
import pandas as pd
import pyramses
from pathlib import Path

print("Python executable:", sys.executable)


# =============================================================================
# User settings
# =============================================================================



RAMSES_PATH = (
    r"C:/RAMSES/Noa-Masters-main/"
    r"URAMSES-3.40c/Release_intel_w64"
)

CMD_FILE = "cmd.txt"

N_SIMULATIONS = 1000
SIMULATION_HORIZON = 25.0

# RAMSES overwrites these files for every simulation.
TRAJECTORY_FILE = "out.trj"
TRACE_FILE = "out.trace" 

# Combined output files.
TIMESERIES_CSV = "all_simulation_timeseries.csv"
SUMMARY_CSV = "simulation_summary.csv"


# Save the summary regularly, so results are not lost if the script stops.
SUMMARY_SAVE_INTERVAL = 25


# =============================================================================
# Disturbance ranges
# =============================================================================

# Load-step ranges.
LOAD_P_MIN = 0.0
LOAD_P_MAX = 5.0

LOAD_Q_MIN = -2.0
LOAD_Q_MAX = 2.0

LOAD_RAMP_MIN = 0.02
LOAD_RAMP_MAX = 0.20

LOAD_START_TIME = 5.0


# Voltage-fault ranges.
VOLTAGE_FAULT_R_MIN = 0.001
VOLTAGE_FAULT_R_MAX = 0.05

VOLTAGE_FAULT_X_MIN = 0.001
VOLTAGE_FAULT_X_MAX = 0.10

VOLTAGE_FAULT_DURATION_MIN = 0.05
VOLTAGE_FAULT_DURATION_MAX = 1.00

VOLTAGE_FAULT_START_TIME = 10.0


# Near-solid short-circuit ranges.
SHORT_CIRCUIT_R_MIN = 0.0
SHORT_CIRCUIT_R_MAX = 0.005

SHORT_CIRCUIT_X_MIN = 0.0
SHORT_CIRCUIT_X_MAX = 0.005

SHORT_CIRCUIT_DURATION_MIN = 0.05
SHORT_CIRCUIT_DURATION_MAX = 1.00

SHORT_CIRCUIT_START_TIME = 15.0


# =============================================================================
# Helper functions
# =============================================================================

def safe_error_text(error_value):
    """
    Convert a RAMSES error or Python exception to a CSV-safe string.
    """
    if error_value is None:
        return ""

    return str(error_value).replace("\n", " ").replace("\r", " ")


def create_disturbance(ram):
    """
    Select one random disturbance, add it to RAMSES and return its parameters.

    Every returned dictionary contains the same keys. Parameters that do not
    apply to the selected disturbance are stored as NaN.
    """

    disturbance_type = random.choice(
        ["load", "voltage_fault", "short_circuit"]
    )

    info = {
        "disturbance_type": disturbance_type,
        "disturbance_start_time": np.nan,
        "P_step": np.nan,
        "Q_step": np.nan,
        "ramp_time": np.nan,
        "fault_R": np.nan,
        "fault_X": np.nan,
        "fault_impedance_magnitude": np.nan,
        "fault_duration": np.nan,
        "fault_clear_time": np.nan,
        "disturbance_command_1": "",
        "disturbance_command_2": "",
    }

    # -------------------------------------------------------------------------
    # Active- and reactive-power load step
    # -------------------------------------------------------------------------
    if disturbance_type == "load":

        p_step = random.uniform(LOAD_P_MIN, LOAD_P_MAX)
        q_step = random.uniform(LOAD_Q_MIN, LOAD_Q_MAX)
        ramp_time = random.uniform(LOAD_RAMP_MIN, LOAD_RAMP_MAX)

        p_command = (
            f"CHGPRM INJ L0 P0 "
            f"{p_step:.6f} {ramp_time:.6f}"
        )

        q_command = (
            f"CHGPRM INJ L0 Q0 "
            f"{q_step:.6f} {ramp_time:.6f}"
        )

        ram.addDisturb(LOAD_START_TIME, p_command)
        ram.addDisturb(LOAD_START_TIME, q_command)

        info.update({
            "disturbance_start_time": LOAD_START_TIME,
            "P_step": p_step,
            "Q_step": q_step,
            "ramp_time": ramp_time,
            "disturbance_command_1": p_command,
            "disturbance_command_2": q_command,
        })

    # -------------------------------------------------------------------------
    # Impedance bus fault producing a voltage dip
    # -------------------------------------------------------------------------
    elif disturbance_type == "voltage_fault":

        fault_r = random.uniform(
            VOLTAGE_FAULT_R_MIN,
            VOLTAGE_FAULT_R_MAX
        )

        fault_x = random.uniform(
            VOLTAGE_FAULT_X_MIN,
            VOLTAGE_FAULT_X_MAX
        )

        duration = random.uniform(
            VOLTAGE_FAULT_DURATION_MIN,
            VOLTAGE_FAULT_DURATION_MAX
        )

        clear_time = VOLTAGE_FAULT_START_TIME + duration

        fault_command = (
            f"FAULT BUS N1 {fault_r:.6f} {fault_x:.6f}"
        )

        clear_command = "CLEAR BUS N1"

        ram.addDisturb(
            VOLTAGE_FAULT_START_TIME,
            fault_command
        )

        ram.addDisturb(
            clear_time,
            clear_command
        )

        info.update({
            "disturbance_start_time": VOLTAGE_FAULT_START_TIME,
            "fault_R": fault_r,
            "fault_X": fault_x,
            "fault_impedance_magnitude": np.hypot(fault_r, fault_x),
            "fault_duration": duration,
            "fault_clear_time": clear_time,
            "disturbance_command_1": fault_command,
            "disturbance_command_2": clear_command,
        })

    # -------------------------------------------------------------------------
    # Near-solid three-phase short circuit
    # -------------------------------------------------------------------------
    elif disturbance_type == "short_circuit":

        fault_r = random.uniform(
            SHORT_CIRCUIT_R_MIN,
            SHORT_CIRCUIT_R_MAX
        )

        fault_x = random.uniform(
            SHORT_CIRCUIT_X_MIN,
            SHORT_CIRCUIT_X_MAX
        )

        duration = random.uniform(
            SHORT_CIRCUIT_DURATION_MIN,
            SHORT_CIRCUIT_DURATION_MAX
        )

        clear_time = SHORT_CIRCUIT_START_TIME + duration

        fault_command = (
            f"FAULT BUS N1 {fault_r:.6f} {fault_x:.6f}"
        )

        clear_command = "CLEAR BUS N1"

        ram.addDisturb(
            SHORT_CIRCUIT_START_TIME,
            fault_command
        )

        ram.addDisturb(
            clear_time,
            clear_command
        )

        info.update({
            "disturbance_start_time": SHORT_CIRCUIT_START_TIME,
            "fault_R": fault_r,
            "fault_X": fault_x,
            "fault_impedance_magnitude": np.hypot(fault_r, fault_x),
            "fault_duration": duration,
            "fault_clear_time": clear_time,
            "disturbance_command_1": fault_command,
            "disturbance_command_2": clear_command,
        })

    return info


def add_signal_to_dataframe(
    dataframe,
    column_name,
    signal_time,
    signal_values
):
    """
    Add a RAMSES signal to the common time-series DataFrame.

    If the signal has the same number of samples as the DataFrame, the values
    are added directly. Otherwise, the signal is linearly interpolated onto
    the DataFrame's time vector.
    """

    signal_time = np.asarray(signal_time, dtype=float)
    signal_values = np.asarray(signal_values, dtype=float)

    if len(signal_values) == len(dataframe):
        dataframe[column_name] = signal_values
        return

    if len(signal_time) != len(signal_values):
        raise ValueError(
            f"Time and value lengths differ for {column_name}: "
            f"{len(signal_time)} versus {len(signal_values)}"
        )

    dataframe[column_name] = np.interp(
        dataframe["time_s"].to_numpy(),
        signal_time,
        signal_values
    )



def extract_timeseries(
    ram,
    case,
    simulation_id,
    disturbance_info
):
    """
    Extract bus, load, PV and transformer trajectories from the latest
    RAMSES trajectory file.

    Frequency at bus N0 is calculated from the bus voltage phase angle.
    """

    # -------------------------------------------------------------------------
    # Open the latest RAMSES trajectory file
    # -------------------------------------------------------------------------
    extractor = pyramses.extractor(case.getTrj())

    injector_names = ram.getAllCompNames("INJ")
    bus_names = ram.getAllCompNames("BUS")

    if not injector_names:
        raise RuntimeError(
            "RAMSES returned no injector names."
        )

    if not bus_names:
        raise RuntimeError(
            "RAMSES returned no bus names."
        )

    # -------------------------------------------------------------------------
    # Create common time vector
    # -------------------------------------------------------------------------
    reference_injector = injector_names[0]
    reference_signal = extractor.getInj(reference_injector).P

    simulation_time = np.asarray(
        reference_signal.time,
        dtype=float
    )

    dataframe = pd.DataFrame({
        "simulation_id": simulation_id,
        "time_s": simulation_time,
    })

    # Add disturbance parameters to every time sample.
    for key, value in disturbance_info.items():
        dataframe[key] = value

    # -------------------------------------------------------------------------
    # Bus voltages, angles and N0 frequency
    # -------------------------------------------------------------------------
    for bus_name in bus_names:

        bus = extractor.getBus(bus_name)

        # Voltage magnitude
        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name=f"V_{bus_name}_pu",
            signal_time=bus.mag.time,
            signal_values=bus.mag.value
        )

        # Voltage phase angle
        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name=f"angle_{bus_name}_deg",
            signal_time=bus.pha.time,
            signal_values=bus.pha.value
        )

    # -------------------------------------------------------------------------
    # Original load L1
    # -------------------------------------------------------------------------
    try:
        load = extractor.getInj("L1")

        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name="Pload_L1_kW",
            signal_time=load.P.time,
            signal_values=np.asarray(
                load.P.value,
                dtype=float
            ) * 1000.0
        )

        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name="Qload_L1_kvar",
            signal_time=load.Q.time,
            signal_values=np.asarray(
                load.Q.value,
                dtype=float
            ) * 1000.0
        )

    except Exception as error:
        print(
            f"Warning: could not extract L1 in simulation "
            f"{simulation_id}: {error}"
        )

    # -------------------------------------------------------------------------
    # Auxiliary PQ injector L0
    # -------------------------------------------------------------------------
    try:
        load_step_injector = extractor.getInj("L0")

        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name="P_L0_kW",
            signal_time=load_step_injector.P.time,
            signal_values=np.asarray(
                load_step_injector.P.value,
                dtype=float
            ) * 1000.0
        )

        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name="Q_L0_kvar",
            signal_time=load_step_injector.Q.time,
            signal_values=np.asarray(
                load_step_injector.Q.value,
                dtype=float
            ) * 1000.0
        )

    except Exception as error:
        print(
            f"Warning: could not extract L0 in simulation "
            f"{simulation_id}: {error}"
        )

    # -------------------------------------------------------------------------
    # PV injector trajectories
    # -------------------------------------------------------------------------
    pv_names = [
        injector_name
        for injector_name in injector_names
        if "PV" in injector_name.upper()
    ]

    for pv_name in pv_names:

        try:
            pv = extractor.getInj(pv_name)
        except Exception as error:
            print(
                f"Warning: could not open PV injector "
                f"{pv_name}: {error}"
            )
            continue

        try:
            add_signal_to_dataframe(
                dataframe=dataframe,
                column_name=f"P_{pv_name}_kW",
                signal_time=pv.Pgen.time,
                signal_values=np.asarray(
                    pv.Pgen.value,
                    dtype=float
                ) * 1000.0
            )

        except Exception as error:
            print(
                f"Warning: Pgen unavailable for "
                f"{pv_name}: {error}"
            )

        try:
            add_signal_to_dataframe(
                dataframe=dataframe,
                column_name=f"Q_{pv_name}_kvar",
                signal_time=pv.Qgen.time,
                signal_values=np.asarray(
                    pv.Qgen.value,
                    dtype=float
                ) * 1000.0
            )

        except Exception as error:
            print(
                f"Warning: Qgen unavailable for "
                f"{pv_name}: {error}"
            )

        try:
            add_signal_to_dataframe(
                dataframe=dataframe,
                column_name=f"frequency_{pv_name}_Hz",
                signal_time=pv.fm.time,
                signal_values=pv.fm.value
            )

        except Exception as error:
            print(
                f"Warning: frequency unavailable for "
                f"{pv_name}: {error}"
            )

    # -------------------------------------------------------------------------
    # Transformer trajectories
    # -------------------------------------------------------------------------
    try:
        transformer = extractor.getBranch("MainTR")

        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name="P_MainTR_MW",
            signal_time=transformer.PT.time,
            signal_values=transformer.PT.value
        )

        add_signal_to_dataframe(
            dataframe=dataframe,
            column_name="Q_MainTR_Mvar",
            signal_time=transformer.QT.time,
            signal_values=transformer.QT.value
        )

    except Exception as error:
        print(
            f"Warning: could not extract MainTR in simulation "
            f"{simulation_id}: {error}"
        )

    return dataframe


def calculate_run_statistics(dataframe):
    """
    Calculate useful minimum and maximum values for the simulation summary.
    """

    statistics = {}

    requested_columns = [
    "V_N0_pu",
    "V_N1_pu",
    "frequency_PV1_Hz",
    "P_PV1_kW",
    "Q_PV1_kvar",
    "Pload_L1_kW",
    "Qload_L1_kvar",
    "P_MainTR_MW",
    "Q_MainTR_Mvar",
]

    for column_name in requested_columns:

        if column_name not in dataframe.columns:
            continue

        values = pd.to_numeric(
            dataframe[column_name],
            errors="coerce"
        )

        statistics[f"{column_name}_min"] = values.min()
        statistics[f"{column_name}_max"] = values.max()

    return statistics


# =============================================================================
# Main program
# =============================================================================

simulation_summary = []

# Remove existing combined output files before starting a new data-generation
# run. Comment these lines out if appending to old data is intentional.
if os.path.exists(TIMESERIES_CSV):
    os.remove(TIMESERIES_CSV)

if os.path.exists(SUMMARY_CSV):
    os.remove(SUMMARY_CSV)

timeseries_header_written = False


for simulation_index in range(N_SIMULATIONS):

    simulation_id = simulation_index + 1

    print(
        f"\nRunning simulation "
        f"{simulation_id}/{N_SIMULATIONS}"
    )

    ram = None
    case = None
    disturbance_info = None

    success = False
    error_message = ""
    number_of_samples = 0
    statistics = {}

    try:
        # ---------------------------------------------------------------------
        # Create a new RAMSES process and configuration for every simulation
        # ---------------------------------------------------------------------
        ram = pyramses.sim(RAMSES_PATH)
        case = pyramses.cfg(CMD_FILE)

        # These two RAMSES files are overwritten for each run.
        case.addTrj(TRAJECTORY_FILE)
        case.addOut(TRACE_FILE)

        # Initialize and pause at t = 0 s.
        ram.execSim(case, 0)

        # ---------------------------------------------------------------------
        # Add one random disturbance
        # ---------------------------------------------------------------------
        disturbance_info = create_disturbance(ram)

        print(
            "Disturbance:",
            disturbance_info["disturbance_type"]
        )

        print(
            "Command 1:",
            disturbance_info["disturbance_command_1"]
        )

        if disturbance_info["disturbance_command_2"]:
            print(
                "Command 2:",
                disturbance_info["disturbance_command_2"]
            )

        # ---------------------------------------------------------------------
        # Run RAMSES
        # ---------------------------------------------------------------------
        ram.contSim(SIMULATION_HORIZON)
        ram.endSim()

        # ---------------------------------------------------------------------
        # Extract the trajectory before it is overwritten by the next run
        # ---------------------------------------------------------------------
        timeseries = extract_timeseries(
            ram=ram,
            case=case,
            simulation_id=simulation_id,
            disturbance_info=disturbance_info
        )

        number_of_samples = len(timeseries)
        statistics = calculate_run_statistics(timeseries)

        # Write the simulation to the same combined CSV file.
        #
        # The first successful simulation writes the header. Subsequent
        # simulations append rows without adding another header.
        timeseries.to_csv(
            TIMESERIES_CSV,
            mode="a",
            header=not timeseries_header_written,
            index=False
        )

        timeseries_header_written = True
        success = True

        print(
            f"Simulation {simulation_id}: SUCCESS, "
            f"{number_of_samples} time samples saved."
        )

    except Exception as error:

        success = False

        python_error = safe_error_text(error)
        ramses_error = ""

        if ram is not None:
            try:
                ramses_error = safe_error_text(
                    ram.getLastErr()
                )
            except Exception:
                ramses_error = ""

        if ramses_error:
            error_message = (
                f"Python error: {python_error} | "
                f"RAMSES error: {ramses_error}"
            )
        else:
            error_message = python_error

        print(
            f"Simulation {simulation_id}: FAILED"
        )
        print(error_message)

        # Print a Python traceback for debugging.
        traceback.print_exc()

        # Try to terminate the RAMSES process cleanly.
        if ram is not None:
            try:
                ram.endSim()
            except Exception:
                pass

    # -------------------------------------------------------------------------
    # Create summary information for this simulation
    # -------------------------------------------------------------------------
    if disturbance_info is None:
        disturbance_info = {
            "disturbance_type": "not_created",
            "disturbance_start_time": np.nan,
            "P_step": np.nan,
            "Q_step": np.nan,
            "ramp_time": np.nan,
            "fault_R": np.nan,
            "fault_X": np.nan,
            "fault_impedance_magnitude": np.nan,
            "fault_duration": np.nan,
            "fault_clear_time": np.nan,
            "disturbance_command_1": "",
            "disturbance_command_2": "",
        }

    summary_row = {
        "simulation_id": simulation_id,
        **disturbance_info,
        "success": success,
        "number_of_time_samples": number_of_samples,
        "error": error_message,
        **statistics,
    }

    simulation_summary.append(summary_row)

    # Save the summary regularly in case execution is interrupted.
    if (
        simulation_id % SUMMARY_SAVE_INTERVAL == 0
        or simulation_id == N_SIMULATIONS
    ):
        pd.DataFrame(simulation_summary).to_csv(
            SUMMARY_CSV,
            index=False
        )

        print(
            f"Summary saved after "
            f"{simulation_id} simulations."
        )


# =============================================================================
# Final report
# =============================================================================

summary_dataframe = pd.DataFrame(simulation_summary)

number_successful = int(
    summary_dataframe["success"].sum()
)

number_failed = int(
    len(summary_dataframe) - number_successful
)

print("\n====================================================")
print("Simulation study completed")
print("====================================================")
print(f"Total simulations:      {len(summary_dataframe)}")
print(f"Successful simulations: {number_successful}")
print(f"Failed simulations:     {number_failed}")
print(f"Time-series file:       {TIMESERIES_CSV}")
print(f"Summary file:           {SUMMARY_CSV}")
print("====================================================")