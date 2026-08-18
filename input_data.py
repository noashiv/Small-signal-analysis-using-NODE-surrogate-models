import os
from pathlib import Path
import pandas as pd
import sys

# ROOT defines the script's own home folder. 
_ROOT = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, _ROOT)

# Paths
# Paths — alt relativt til scriptets egen placering, så det virker
# uanset hvor mappen bliver downloadet/klonet hen.
MODEL_PATH =os.path.join( _ROOT , "results" , "NODE_PhysTime_AR" , "checkpoint.pt")
DATA_PATH =os.path.join( _ROOT ,"NeuralODES" ,"data" , "all_simulation_timeseries.csv")
OUTPUT_DIR = os.path.join(_ROOT , "results" )


RAMSES_PATH = Path(os.environ.get(
    "RAMSES_PATH",
    r"C:/RAMSES/Noa-Masters-main/URAMSES-3.40c/Release_intel_w64"
))



# Column names produced by the RAMSES data-generation script.
FEATURE_COLS = [
    "V_N0_pu",
    "angle_N0_deg",
    "frequency_PV1_Hz",
]
TARGET_COLS = ["P_MainTR_MW"]
