# Small-signal-analysis-using-NODE-surrogate-models
A power system can be constructed as a neural network, therefor to model the dynamics and perform a stability analysis, the power system is constructed as a neural network consisting of ordinary differential equations. This model will learn the physical dynamics of the given distribution network simulated with RAMSES and forecast the behavior of the main transformer power. To validate and analyse the forecast a small signal analysis is performed, which from analysization can tell if the learned dynamics are feasible and stable....


Dynamic modelling and stability analysis of power systems with neural ordinary differential equations 

1. Overview
Dynamic modelling and stability analysis of power systems with neural ordinary differential equations.
Explain the motivation for using machine-learning-based dynamic equivalents of active distribution networks.

Kort (3-5 sætninger): hvad er projektet overordnet — en Neural ODE, der lærer den fysiske dynamik i et kraftsystem ud fra RAMSES-simulationer, plus værktøjer til at analysere om den lærte dynamik er fysisk fornuftig (fixed points, stabilitet).

## Requirements & Setup
All scripts have a .sh file, where path to environment, miniforge3 and script has to be updated to users paths. 

The project uses conda, therefor it is suggested to run the code through [Anaconda Navigator][Anaconda-url]. It is recommended to create a seperate environment in Anaconda for this model and belonging RAMSES-simulation.

The projects key prerequisist are 
  ```sh
  pip install torch, torchdiffeq, pytorch_optimizer, scipy, pyramses
  ```
miniforge3 can be downloaded [here][mini-url].

Furthermore the project requires a CUDA GPU, which can be aquired by connecting to DTU's [hpc][hpc-url].




## Project structure
The project consist of several scripts with their own purpose. 
  ```bash
Main/
├── input_data.py                  # Central config: FEATURE_COLS, TARGET_COLS,
│                                   #   DATA_PATH, OUTPUT_DIR, RAMSES_PATH, MODEL_PATH
│
├── RAMSES/                        # RAMSES simulation + distribution network
│   ├── URAMSES-3.40c/              # RAMSES installation
│   ├── data.dat                    # Distribution network configuration
│   ├── LF.dat                      # Distribution network configuration
│   ├── LFRESV                      # Distribution network configuration
│   ├── artere.flag                 # Distribution network configuration
│   ├── init.trace                  # Distribution network data
│   ├── out.trace                   # Simulation results (overwritten per run)
│   └── Sim.py                      # Simulates the distribution network with disturbances (Step 1)
│
└── NeuralODES/                    # Neural ODE pipeline (_ROOT.parent in all scripts)
    ├── data_utils.py                # load_and_normalise_and_split_data()
    ├── early_stopping.py            # EarlyStopping class
    ├── NODE_PhysTime_AR.py          # NODE model + training → checkpoint.pt   (Step 2)
    ├── fixedpoints.py                # Fixed-point analysis                   (Step 3)
    ├── stability.py                  # Stability analysis (Jacobian/FTLE)     (Step 4)
    │
    ├── data/
    │   └── all_simulation_timeseries.csv   # Simulation data ← DATA_PATH points here
    │
    └── results/                            # ← OUTPUT_DIR points here
        ├── NODE_PhysTime_AR/
        │   ├── checkpoint.pt                 # ← MODEL_PATH points here
        │   └── predictions.csv
        ├── fixed points/
        │   ├── fixed_points_initial_condition.csv
        │   ├── fixed_points_feature_time_sweep.csv
        │   ├── fixed_point_sweep_conditions.csv
        │   ├── fixed_point_summary.csv
        │   └── initial_condition_fixed_points.png
        └── stability/
            ├── stability_eigenvalues.csv
            ├── stability_ftle_by_run.csv
            ├── stability_summary.csv
            ├── stability_eigenvalues.png
            └── stability_ftle.png
  ```
## Configuration — input_data.py
To ensure unity and to simplify the user experience all central configuration are compiled in input_data.py and imported in all other scripts. 
The user can modify:
  ```sh
  FEATURE_COLS    # Input variables to NODE model
  TARGET_COLS     # Target of NODE model
  DATA_PATH, OUTPUT_DIR, RAMSES_PATH, MODEL_PATH  #Paths to the various results or model configurations
  ```

## Step 1 — Generating simulation data
In Sim.py using RAMSES the input data for the NODE model is created. This scripts loads the network configured through data.dat, LF.dat and LFRESV. For this purpose a simple distribution network consisting of one bus with a load and a PV is constructed.

First the distrubution network features are setup in data.dat, this entails operating voltage at bus, and load and PV specifications. 


Hvad scriptet gør (kører RAMSES-simulationer med tilfældige disturbances, gemmer én samlet CSV), hvordan man kører det, hvad output er (all_simulation_timeseries.csv), og et par nøgleparametre man kan justere (N_SIMULATIONS, disturbance-ranges).
Tilføj noget om data.dat og det nuværende netværk.

## Step 2 — Training the model (NODE_PhysTime_AR.py)

Kort koncept: hvad er en Neural ODE her, hvorfor fysisk tid, hvad lærer netværket (dy/dt). Hvordan man kører det, vigtige config-parametre (HIDDEN_DIM, DEPTH, EPOCHS), og hvad output er (checkpoint.pt, predictions.csv).

## Step 3 — Fixed-point analysis (fixed_points_physical_node.py)

Konceptet i 3-4 sætninger (som vi formulerede tidligere: finder ligevægtspunkter modellen har lært, tjekker om de er fysisk fornuftige og stabile). Hvordan man kører det (kræver et trænet checkpoint), hvad output-filerne betyder.

## Step 4 — Stability analysis (stability_physical_node.py)

Samme opskrift: koncept kort, hvordan man kører det, hvordan man læser de to plots (instantaneous spectral abscissa, FTLE-histogram) — evt. med et lille "sådan læser du dette plot"-afsnit, ligesom vi gennemgik.

9. Interpreting results / Troubleshooting

En kort FAQ-agtig sektion: hvad betyder det, hvis fixed points ligger langt fra forventet start? Hvad betyder positive FTLE-værdier? Og evt. kendte faldgruber (CPU-thread-oversubscription, buffering på LSF, osv.), hvis I støder på dem igen og igen.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Anaconda-url]: https://www.anaconda.com/products/navigator
[hpc-url]: https://www.hpc.dtu.dk/
[mini-url]: https://conda-forge.org/download/
