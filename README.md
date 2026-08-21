# Small-signal-analysis-using-NODE-surrogate-models
Dynamic modelling and stability analysis of power systems with neural ordinary differential equations 

1. Overview
Dynamic modelling and stability analysis of power systems with neural ordinary differential equations.
Explain the motivation for using machine-learning-based dynamic equivalents of active distribution networks.

Kort (3-5 sætninger): hvad er projektet overordnet — en Neural ODE, der lærer den fysiske dynamik i et kraftsystem ud fra RAMSES-simulationer, plus værktøjer til at analysere om den lærte dynamik er fysisk fornuftig (fixed points, stabilitet).

2. Requirements & Setup

Python-version, nøgleafhængigheder (torchdiffeq, pytorch_optimizer, scipy, pyramses osv.), samt evt. link til requirements.txt/miljø-fil. Kort note om at scriptet kræver CUDA GPU til træning.


3. Project structure

Et lille træ-diagram over mappestrukturen (input_data.py, data_utils.py, NODE_PhysTime_AR.py, osv.) og hvor de skal ligge i forhold til hinanden — meget relevant efter alle vores diskussioner om sys.path/import-stier.

4. Configuration — input_data.py

Forklar at denne fil er den centrale konfiguration alle andre scripts importerer fra: FEATURE_COLS, TARGET_COLS, DATA_PATH, OUTPUT_DIR, RAMSES_PATH, MODEL_PATH. Én ting brugeren skal redigere, før noget køres.

5. Step 1 — Generating simulation data

Hvad scriptet gør (kører RAMSES-simulationer med tilfældige disturbances, gemmer én samlet CSV), hvordan man kører det, hvad output er (all_simulation_timeseries.csv), og et par nøgleparametre man kan justere (N_SIMULATIONS, disturbance-ranges).
Tilføj noget om data.dat og det nuværende netværk.

6. Step 2 — Training the model (NODE_PhysTime_AR.py)

Kort koncept: hvad er en Neural ODE her, hvorfor fysisk tid, hvad lærer netværket (dy/dt). Hvordan man kører det, vigtige config-parametre (HIDDEN_DIM, DEPTH, EPOCHS), og hvad output er (checkpoint.pt, predictions.csv).

7. Step 3 — Fixed-point analysis (fixed_points_physical_node.py)

Konceptet i 3-4 sætninger (som vi formulerede tidligere: finder ligevægtspunkter modellen har lært, tjekker om de er fysisk fornuftige og stabile). Hvordan man kører det (kræver et trænet checkpoint), hvad output-filerne betyder.

8. Step 4 — Stability analysis (stability_physical_node.py)

Samme opskrift: koncept kort, hvordan man kører det, hvordan man læser de to plots (instantaneous spectral abscissa, FTLE-histogram) — evt. med et lille "sådan læser du dette plot"-afsnit, ligesom vi gennemgik.

9. Interpreting results / Troubleshooting

En kort FAQ-agtig sektion: hvad betyder det, hvis fixed points ligger langt fra forventet start? Hvad betyder positive FTLE-værdier? Og evt. kendte faldgruber (CPU-thread-oversubscription, buffering på LSF, osv.), hvis I støder på dem igen og igen.