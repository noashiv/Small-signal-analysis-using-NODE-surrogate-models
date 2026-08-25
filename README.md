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

Miniforge3 can be downloaded [here][mini-url].

The projects key prerequisist are 
  ```sh
  pip install torch, torchdiffeq, pytorch_optimizer, scipy, pyramses
  ```

Furthermore the project requires a CUDA GPU, which can be aquired by connecting to DTU's [hpc][hpc-url].




## Project structure
The project consist of several scripts with their own purpose. 
  ```bash
Main/
├── input_data.py                 # Central config: FEATURE_COLS, TARGET_COLS,
│                                 #   DATA_PATH, OUTPUT_DIR, RAMSES_PATH, MODEL_PATH
│
├── RAMSES/                        # RAMSES simulation + distribution network
│   ├── URAMSES-3.40c/             # RAMSES installation
│   ├── data.dat                   # Distribution network configuration
│   ├── LF.dat                     # Distribution network configuration│
|   ├── artere.flag                # Distribution network configurator
│   ├── LFRESV                     # Distribution network configuration
│   ├── init.trace                 # Distribution network data
│   ├── out.trace                  # Simulation results (overwritten per run)
│   └── Sim.py                     # Simulates the distribution network with disturbances (Step 1)
│
└── NeuralODES/                      # Neural ODE pipeline (_ROOT.parent in all scripts)
    ├── data_utils.py                # load_and_normalise_and_split_data()
    ├── early_stopping.py            # EarlyStopping class
    ├── NODE_PhysTime_AR.py          # NODE model + training → checkpoint.pt   (Step 2)
    ├── fixedpoints.py               # Fixed-point analysis                   (Step 3)
    ├── stability.py                 # Stability analysis (Jacobian/FTLE)     (Step 4)
    ├── plotting.py                  # Plotting of input data and results
    │
    ├── data/
    │   └── all_simulation_timeseries.csv   # Simulation data ← DATA_PATH points here
    │
    └── results/                            # ← OUTPUT_DIR points here
        ├── NODE_PhysTime_AR/
        │   ├── checkpoint.pt               # ← MODEL_PATH points here
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

First the distrubution network features are setup in data.dat, this entails operating voltage at bus, and load and PV specifications. Similarly LF.dat is constructed with bus specifications. Lastly to obtain the load flow of the system?? artere.flag calculates this and creates LFRESV (user names this files themselves through artere.flag), where the load flow data can be copied into data.dat e.g.
  ```sh
LFRESV N0 1.000000 0. ;
LFRESV N1 0.9922389 -2.2979904E-02 ;
  ```
More on these files and the features presented in them can be read [here][stepss-url].

Now the Sim.py script imports the constructed network and data and simulates the network dynamics through RAMSES. For the purpose of the project three disturbance types have been implemented:
- Load step - changes the active and reactive power of the injector (L0). The active power (P_step) has the range [0-5], the reactive power (Q_step) has the range [(-2.0) - 2.0]. It has a ramping time in the range [0.02s - 0.2s]
- Voltage fault - is applied to bus N1 as a fault with a non-zero impedance, which results in a voltage drop. The resistance R is in the range [0.001 - 0.05] and the reactance X is in the range [0.001 - 0.1]. It has a duration time of [0.05s - 1s]
- Short circuit - fundementally the same as voltage fault, but R and X are so small that is resembles a short circuit. R and X ranges [0 - 0.005]. It has a duration time of [0.05s - 1s].

They all have a random starting time within 3s to 20s.
The script creates N_SIMULATIONS and writes the output of the simulation in all_simulation_timeseries.csv.


This script has a Sim.sh file that can be submitted to the DTU's hpc.

## Step 2 — Training the model (NODE_PhysTime_AR.py)
A NODE (neural ordinary differential equation) model predicts the rate of change of the state dy/dt, given the current state y, the current exogenous inputs x(t), and the current time. The lpredicted rate of change is then integrated using an ODE solver (torchdiffeq) through actual timestamps to produce a predicted trajectory, which can be compared to the actual trajectory, produced in Sim.py, to compute the training loss. In this project the exogenous inputs x(t) are bus voltage, angle, and generator frequency and the state y is the active power flow thorugh the main transformer. Before the model can begin its training, data_utils.py loads the simulated data from Sim.py and prepares it in three steps: splitting, normalization and padding. The data is split into three sets of training, validation and test sets. The sets are constructed on whole simulations, where 30% of the simulations are in the test set, 70% is training where 15% of this is allocated to validation. Afterwards the data is Z-score normalized and padded to ensure equal length of the simulations. 

The model then starts its training on the training set, where it trains up to the amount of EPOCHS passes over the training data, alternating with a validation pass. Training ends as soon as the model has completed all training data with the given EPOCHS or when th validation loss stops improving by a certain amount given by early_stopping.py. early_stopping.py tracks the validation loss and stops once the loss doesnt improve by a meaningfull amount over a certain amount of epochs. This protects against overfitting and can shorten computation time. 

The complexity of the neural network is configured through:
  ```sh
  HIDDEN_DIM    # Width of each hidden layer in the ODE's right-hand-side network
  DEPTH         # Number of hidden layers
  EPOCHS        # Maximum number of training epochs
  METHODS       # ODE solver method (fixed-step RK4 by default)
  LR            # Learning rate
  BATCH_SIZE    # computed automatically from free GPU memory once the data is loaded
  ```
The scripts writes the trained model's weights with architecture configuration and normalized statistics to checkpoint.pt, and the predictions on the test set along with the actual data to predictions.csv

This script has a Training.sh file that can be submitted to DTU's hpc.

## Step 3 — Fixed-point analysis (fixedpoints.py)
The script fixedpoints.py uses the output of the trained model's learned dynamics and searches for fixed points under frozen input x(t) and time conditions, this is where the model have predicted zero rate of change f(y*,x(t), t). The fixed points are evaluated by checking whether the model agrees that a run should start out stationary near its actual initial state or if it should drift elsewhere first and by sweeping across the models full training set and checking if equillibrium behavior looks physically sensible compared to the rest. For every found fixed point the Jacobian eigenvalues are computed to analyze its local stability. If the model has unrealistic or unstable fixed points, then the model has more likely learned a wrong dynamic. 

This script has a fixedpoints.sh file that can be submitted to the DTU's hpc.


## Step 4 — Stability analysis (stability.py)

Samme opskrift: koncept kort, hvordan man kører det, hvordan man læser de to plots (instantaneous spectral abscissa, FTLE-histogram) — evt. med et lille "sådan læser du dette plot"-afsnit, ligesom vi gennemgik.

9. Interpreting results / Troubleshooting

En kort FAQ-agtig sektion: hvad betyder det, hvis fixed points ligger langt fra forventet start? Hvad betyder positive FTLE-værdier? Og evt. kendte faldgruber (CPU-thread-oversubscription, buffering på LSF, osv.), hvis I støder på dem igen og igen.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Anaconda-url]: https://www.anaconda.com/products/navigator
[hpc-url]: https://www.hpc.dtu.dk/
[mini-url]: https://conda-forge.org/download/
[stepss-url]:https://drive.google.com/drive/folders/1oVPO0sc-3-jf_C9IgzafZQesf936TPQs
