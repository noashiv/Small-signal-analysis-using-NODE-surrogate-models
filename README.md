<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->
# Small-signal-analysis-using-NODE-surrogate-models
The introduction of distributed energy sources in the distribution network has increased the difficult of modelling such network with traditional physics-based simulators, as these energy sources often are nonlinear and difficult to characterize component-by-component. A practical alternative that doesnt require a full physical model, could be a learned dynamuc equivalent, that can reproduce a network's behavior once trained and predict how a network responds to disturbances. This is attractive for both real-time monotoring and large-scale grid studies.

This project explores this opportunity by modelling a distribution network using a Neural Ordinary Differential Equation (NODE). NODE trains a network to predict the instantaneous rate of change of the system state, for a given current state, current exogenous inputs and time. The learned rate of change can then be integrated by an ODE solver, which produces a full predicted trajectory using the training data's actual timestamps. In this project the predicted trajectory is the active power flow through the main transformer of the network. The training data is created through RAMSES simulations of a designed distribution network with randomized distrubances applied. 

## Requirements & Setup
All scripts have a .sh file, where path to environment, miniforge3 and script has to be updated to users paths, e.g. 
  ```sh
source /zhome/84/1/154964/miniforge3/etc/profile.d/conda.sh 

conda activate /zhome/84/1/154964/miniforge3/envs/env_ram

python -u /zhome/84/1/154964/RAMSES/NeuralODES/NODE_PhysTime_AR.py 
  ```

The project uses conda, therefor it is suggested to run the code through [Anaconda Navigator][Anaconda-url]. It is recommended to create a seperate environment in Anaconda for this model and belonging RAMSES-simulation.

Miniforge3 can be downloaded [here][mini-url].

The projects key prerequisist are 
  ```sh
  pip install torch, torchdiffeq, pytorch_optimizer, scipy, pyramses
  ```

Furthermore the project requires a CUDA GPU, which can be aquired by connecting to DTU's [hpc][hpc-url].


## Project structure
The project consist of several scripts that simulates the designed distribution network, train the NODE model and analyze the results of the model. 
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
To ensure unity and to simplify the user experience all central configuration are compiled in `input_data.py` and imported in all necessary scripts. 
The user can modify:
  ```sh
  FEATURE_COLS    # Input variables to NODE model
  TARGET_COLS     # Target of NODE model
  DATA_PATH, OUTPUT_DIR, RAMSES_PATH, MODEL_PATH  #Paths to the various results or model configurations
  ```

## Step 1 — Generating simulation data
In `Sim.py` using RAMSES the input data for the NODE model is created. This scripts loads the network configured through `data.dat`, `LF.dat` and `LFRESV`. For this purpose a simple distribution network consisting of one bus with a load and a PV is designed.

First the distrubution network features are setup in data.dat, this entails operating voltage at bus, and load and PV specifications. Similarly `LF.dat` is constructed with bus specifications. Lastly to obtain the load flow in the system `artere.flag` calculates this and creates `LFRESV` (user names this file themselves through artere.flag), where the load flow data can be copied into `data.dat` e.g.
  ```sh
LFRESV N0 1.000000 0. ;
LFRESV N1 0.9922389 -2.2979904E-02 ;
  ```
More on these files and the features presented in them can be read [here][stepss-url].

Now the `Sim.py` script imports the designed distribution network and data and simulates the network dynamics through RAMSES. For the purpose of the project three disturbance types have been implemented:
- Load step: changes the active and reactive power of the injector (L0). The active power (P_step) has the range [0-5], the reactive power (Q_step) has the range [(-2.0) - 2.0]. It has a ramping time in the range [0.02s - 0.2s]
- Voltage fault: is applied to bus N1 as a fault with a non-zero impedance, which results in a voltage drop. The resistance R is in the range [0.001 - 0.05] and the reactance X is in the range [0.001 - 0.1]. It has a duration time of [0.05s - 1s]
- Short circuit: fundementally the same as voltage fault, but R and X are so small that is resembles a short circuit. R and X ranges [0 - 0.005]. It has a duration time of [0.05s - 1s].

They all have a random starting time between 3 to 20s.

The script creates N_SIMULATIONS and writes the output of the simulation in `all_simulation_timeseries.csv`.

It is possible to modify the design of the distribution network and the component specifications, you just have to update `data.dat` and `LF.dat` and run the simulation in `Sim.py`.

This script has a `Sim.sh` file that can be submitted to the DTU's hpc.

## Step 2 — Training the model (NODE_PhysTime_AR.py)
A NODE (neural ordinary differential equation) model predicts the rate of change of the state $dy/d(t)$, given the current state $y$, the current exogenous inputs $x(t)$, and the current time. The predicted rate of change is then integrated using an ODE solver (torchdiffeq) through actual timestamps to produce a predicted trajectory, which can be compared to the actual trajectory (produced in `Sim.py`) to compute the training loss. In this project the exogenous inputs $x(t)$ are bus voltage, angle, and generator frequency and the state $y$ is the active power flow thorugh the main transformer. Before the model can begin its training, data_utils.py loads the simulated data from `Sim.py` and prepares it in three steps: splitting, normalization and padding. The data is split into three sets of training, validation and test sets. The sets are constructed on whole simulations, where 30% of the simulations are in the test set, 70% is training where 15% of this is allocated to validation. Afterwards the data is Z-score normalized and padded to ensure equal length of the simulations. 

The model then starts its training on the training set, where it trains up to the amount of EPOCHS passes over the training data, alternating with a validation pass. Training ends as soon as the model has completed all training data with the given EPOCHS or when the validation loss stops improving by a certain amount given by `early_stopping.py`. `early_stopping.py` tracks the validation loss and stops once the loss doesnt improve by a meaningful amount over a certain amount of epochs. This protects against overfitting and can shorten computation time. 

<br />
<div align="center">
    <img src="images/Sk" alt="Logo" width="80" height="80">


The complexity of the neural network is configured through:
  ```sh
  HIDDEN_DIM    # Width of each hidden layer in the ODE's right-hand-side network
  DEPTH         # Number of hidden layers
  EPOCHS        # Maximum number of training epochs
  METHODS       # ODE solver method (fixed-step RK4 by default)
  LR            # Learning rate
  BATCH_SIZE    # computed automatically from free GPU memory once the data is loaded
  ```
The scripts writes the trained model's weights with architecture configuration and normalized statistics to `checkpoint.pt`, and the predictions on the test set along with the actual data to `predictions.csv`.

This script has a `Training.sh` file that can be submitted to DTU's hpc.

## Step 3 — Fixed-point analysis (fixedpoints.py)
The script `fixedpoints.py` uses the output of the trained model's learned dynamics and searches for fixed points under frozen input $x(t)$ and time conditions, this is where the model have predicted zero rate of change $f(y^*,x(t), t)$. The fixed points are evaluated through two types of analysis, referred to as analysis A and B.

Analysis A:
freezes the exogenous inputs, time and the expected state at their median initial values across the training runs, and searches for every distinct fixed point near the network's own state range. It then compares each fixed point found with the runs' actual initial condition (the real median starting value across all training runs). This tells if the networks' learned dynamic agrees that the run should start roughly near its initial state or if it thinks the system want to move elsewhere from the start.

Analysis B:
sweep every exogenous feature and time independdently across their full training range and searches fir fixed point at every possible combination. This tells if the network's learned equilibrium behavior changes across the whole operating evelope it was trained on, rather than only at one fixed condition.


For every accepted fixed point, its local stability is evaluated by computing the Jacobian of the learned dynamics with respect to the state at that point, and taking its eigenvalues. This captures how sensitive the predicted rate of change is to a small nudge away from $y*$. If the sign of the largest real part among these eigenvalues (the "spectral abscissa") is negative, the fixed point is stable; if positive, it is unstable.


The output is written to /results/fixed points/:
- `fixed_points_initial_condition.csv`: all fixed points found near the runs' typical starting condition, including the distance to the actual initial state and its stability classification.
- `fixed_points_feature_time_sweep.csv`: all fixed points found in analysis B.
- `fixed_points_sweep_conditions.csv`: one row per swept condition (including conditions where zero fixed points were found).
- `fixed_point_summary.csv`: includes total fixed points found in each analysis and stability classificaton
- `initial_condition_fixed_points.png`: plot of the fixed points found at the initial condition including stability classification and actual start. 

This script has a `fixedpoints.sh` file that can be submitted to the DTU's hpc.


## Step 4 — Stability analysis (stability.py)
The script `stability.py` analyzes along the network's predicted trajectories if the behavior is like a stable system or if it tends to amplify errors and pertubations over time. The script checks for stability in two ways both by computing the Jacobian eigenvalues. The first analysis checks for instantaneous stability at every single timestep. The Jacobian eigenvalues are computed at each recorded timestamp, which then indicates what would happen if a tine perturbation is introduced to the state at that exact moment. The analysis can only give a snapshot of the stability classification as it doesnt take the rest of the run into consideration. 
The second check computes the finite-time Lyapunov exponents (FTLEs) over the whole run. Instead of looking at a single snapshot, this analysis asks what would happen to a perturbation introduced at the start of the run by the time it reaches the end. Here, the Jacobians computed across the run are chained together into a single state-transition matrix, and the run's overall stability is determined by how much that matrix stretches or shrinks perturbation vectors.

For every run in the dataset, the script:
1. Reconstructs the predicted NODE trajectory on the physical-time grid.
2. Computes the state Jacobian along that predicted trajectory.
3. Computes the instantaneous Jacobian eigenvalues, in 1/s.
4. Computes the full-run finite-time Lyapunov exponents, in 1/s.
5. Saves per-timestep values, per-run summaries, and two plots.

The output is written to  results/stability/:
- `stability_eigenvalues.csv`: per-timestep predictions, Jacobians, eigenvalues, and spectral abscissa for every run.
- `stability_ftle_by_run.csv`: one row per run: duration, dominant FTLE, min/max spectral abscissa, and the fraction of the run's duration that looked locally stable.
- `stability_summary.csv`: dataset-wide statistics on the dominant FTLE (mean, std, median, min, max, fraction negative).
- `stability_eigenvalues.png` and `stability_ftle.png`: the instantaneous spectral abscissa over time and a histogram of each run's single dominant FTLE

This script has a `stability.sh` file that can be submitted to the DTU's hpc.

  
## Interpreting results / Troubleshooting

En kort FAQ-agtig sektion: hvad betyder det, hvis fixed points ligger langt fra forventet start? Hvad betyder positive FTLE-værdier? Og evt. kendte faldgruber (CPU-thread-oversubscription, buffering på LSF, osv.), hvis I støder på dem igen og igen.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Anaconda-url]: https://www.anaconda.com/products/navigator
[hpc-url]: https://www.hpc.dtu.dk/
[mini-url]: https://conda-forge.org/download/
[stepss-url]:https://drive.google.com/drive/folders/1oVPO0sc-3-jf_C9IgzafZQesf936TPQs
