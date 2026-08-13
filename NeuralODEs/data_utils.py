# data_utils.py
"""
Loads a parquet file of simulation "runs" (each run = a run_id with a time
series of feature/target rows), computes a per-row time-delta (dt) feature,
splits runs into train/val/test sets (by whole run, so no run ever appears
in two splits), and z-score normalizes everything using TRAIN-only
statistics (so val/test never leak information into the normalization).
"""

import pandas as pd
import numpy as np
import torch
import os
from sklearn.model_selection import train_test_split
import sys


def load_and_normalise_and_split_data(
    csv_paths,
    feature_cols,
    target_col,
    random_state=42,
    test_size=0.30,
    val_test_split=0.50,
    device="cpu",
    # --- Δt options ---
    dt_col_name="dt",           # raw dt column name in the returned df
    dt_norm_col_name="dt_norm", # normalized dt column name in the returned df
    dt_last_sample=None,        # value to use for a run's last dt (no "next" row to diff against); None => 0.0
    run_col="run_id",
    time_col="time_s",
):
    """
    Load csv, compute FORWARD-aligned dt per run, create both raw `dt` and z-scored
    `dt_norm` (using TRAIN-only stats), then normalize other features with TRAIN-only z-score.
    Any of ["dt", "dt_norm"] may be included in `feature_cols` (even both).

    Returns:
      - split IDs, per-split tensors, per-run tensors
      - df with computed dt & dt_norm
      - X_mean/X_std (per-feature, passthrough features have mean=0, std=1)
      - y_mean/y_std
      - echo of feature_cols and passthrough_cols
    """
  
    # ----------------------------------------------------------------------
    # 1) Read parquet WITHOUT dt/dt_norm (we compute them here, so they
    #    won't exist as real columns in the file even if requested as features)
    # ----------------------------------------------------------------------
    requested_no_dt = [c for c in feature_cols if c not in (dt_col_name, dt_norm_col_name)]
    use_cols = [run_col, time_col] + list(requested_no_dt) + [target_col]
    df = pd.read_csv(csv_paths, usecols=use_cols)

    # ----------------------------------------------------------------------
    # 2) Sort to ensure time diffs are correct
    # ----------------------------------------------------------------------
    df = df.sort_values([run_col, time_col])

    # Remove duplicate timestamps within each simulation.
    # Keep the last occurrence if the same simulation has the same timestamp twice.
    n_duplicates = df.duplicated(
        subset=[run_col, time_col]
    ).sum()

    if n_duplicates > 0:
        print(f"[INFO] Removing {n_duplicates} duplicate timestamps.")
        df = df.drop_duplicates(
            subset=[run_col, time_col],
            keep="last"
        )
    # Removes NaN-values
    required_cols = feature_cols + [target_col, run_col, time_col]

    n_before = len(df)
    df = df.dropna(subset=required_cols).reset_index(drop=True)

    print(
        f"[INFO] Removed {n_before - len(df)} rows "
        f"with missing values."
    )
    # Convert datetime-like time to numeric seconds for diff/normalization stability.
    if np.issubdtype(df[time_col].dtype, np.datetime64):
        # nanoseconds -> seconds (float)
        df[time_col] = df[time_col].view("int64") / 1e9

    # ----------------------------------------------------------------------
    # 3) Compute per-run FORWARD Δt: dt[t] = time[t+1] - time[t]
    #    (how long until the *next* sample in this run)
    # ----------------------------------------------------------------------
    g = df.groupby(run_col)[time_col]

    # g.shift(-1) shifts every run's time column up by one row, so row i
    # holds time[i+1] instead of time[i] — but only within its own run
    # (groupby keeps runs from bleeding into each other at the shift).
    # Subtracting the original column then computes, row by row:
    #   dt_forward[i] = time[i+1] - time[i]
    # i.e. "how long until the next sample", aligned back onto row i. The
    # very last row of each run has no i+1 to pull from, so shift(-1)
    # leaves NaN there — that's the gap we fill in below.
    dt_forward = g.shift(-1) - df[time_col]
    # Same idea but shifted the other way: g.diff() computes
    # time[i] - time[i-1] for each row — "how long since the previous
    # sample". This is well-defined at the run's last row (unlike the
    # forward version), so it's used as a stand-in dt for that row.
    dt_backward = g.diff()

    # .fillna(dt_backward) replaces every NaN in dt_forward with the
    # value at the same row in dt_backward — i.e. wherever we couldn't
    # measure "time to next sample" (the last row of a run), substitute
    # "time since previous sample" as the closest available estimate of
    # that run's step size. A run with only a single row has no previous
    # sample either, so dt_backward is also NaN there — that remaining
    # gap gets filled with `dt_last_sample` (or 0.0) next.
    dt_forward = dt_forward.fillna(dt_backward)
    if dt_last_sample is None:
        dt_forward = dt_forward.fillna(0.0)
    else:
        dt_forward = dt_forward.fillna(float(dt_last_sample))

    # Negative dt shouldn't happen for correctly-ordered data; clip defensively.
    dt_forward = dt_forward.clip(lower=0).astype(np.float32)

    # Attach raw dt to df
    df[dt_col_name] = dt_forward

    # Diagnostic: warn (don't fail) if the raw data had out-of-order timestamps.
    raw_forward = g.shift(-1) - df[time_col]
    num_neg = int((raw_forward < 0).sum()) if raw_forward.notna().any() else 0
    if num_neg > 0:
        print(
            f"Warning: found {num_neg} negative forward Δt values before clipping; "
            f"verify {time_col} ordering within runs."
        )

    # ----------------------------------------------------------------------
    # 4) Group and split (run-level to avoid leakage)
    # ----------------------------------------------------------------------
    run_groups = {rid: group for rid, group in df.groupby(run_col, sort=False)}
    run_ids = list(run_groups.keys())

    # Split whole runs (not individual rows) into train/val/test, so no run's
    # timesteps ever end up split across two sets.
    train_ids, temp_ids = train_test_split(
        run_ids, test_size=test_size, random_state=random_state
    )
    val_ids, test_ids = train_test_split(
        temp_ids, test_size=val_test_split, random_state=random_state
    )
    print(f"Dataset splits: Train={len(train_ids)}, Val={len(val_ids)}, Test={len(test_ids)}")

    # ----------------------------------------------------------------------
    # 5) Compute TRAIN-only dt mean/std, then create dt_norm across all splits
    # ----------------------------------------------------------------------
    dt_train_all = np.concatenate(
        [run_groups[rid][dt_col_name].values for rid in train_ids]
    ).astype(np.float32)
    dt_mean = float(dt_train_all.mean())
    dt_std  = float(dt_train_all.std())

    # Guard against zero-variance dt (e.g. every run sampled at a fixed
    # timestep, which is common for simulation data) — avoids a divide-by-zero.
    denom = dt_std if dt_std > 1e-12 else 1.0
    # This is a z-score (standardization): subtracting the mean centers
    # the values on 0, and dividing by the standard deviation rescales
    # them so a value of "1.0" means "one standard deviation above the
    # train-set average dt", "-1.0" means one below, etc. Networks train
    # better on inputs like this (small, centered numbers) than on raw
    # values that might be e.g. always around 1000 with tiny relative
    # variation. dt_mean/dt_std come only from `train_ids` (never
    # val/test) so the network is never implicitly told anything about
    # the val/test distributions through the normalization itself.
    df[dt_norm_col_name] = (df[dt_col_name].astype(np.float32) - dt_mean) / (denom + 1e-8)

    # Refresh run_groups to include dt_norm
    run_groups = {rid: group for rid, group in df.groupby(run_col, sort=False)}

    # ----------------------------------------------------------------------
    # 6) Determine passthrough features: if the caller asked for dt/dt_norm
    #    as model inputs, don't re-normalize them below — dt_norm is already
    #    normalized, and raw dt is meant to stay in physical units.
    # ----------------------------------------------------------------------
    passthrough_cols = set()
    if dt_norm_col_name in feature_cols:
        passthrough_cols.add(dt_norm_col_name)
    if dt_col_name in feature_cols:
        passthrough_cols.add(dt_col_name)

    # ----------------------------------------------------------------------
    # 7) TRAIN-only normalization stats for NON-passthrough features
    # ----------------------------------------------------------------------
    feature_cols = list(feature_cols)  # ensure list copy

    X_train_df = pd.concat([run_groups[rid][feature_cols] for rid in train_ids], axis=0)
    y_train_df = pd.concat([run_groups[rid][[target_col]] for rid in train_ids], axis=0)

    print("NaN per feature:")
    print(X_train_df.isna().sum())

    print("Inf per feature:")
    print(
        pd.Series(
            np.isinf(X_train_df.to_numpy(dtype=np.float64)).sum(axis=0),
            index=feature_cols
        )
    )

    print("NaN i target:", y_train_df[target_col].isna().sum())
    print(
        "Inf i target:",
        np.isinf(
            y_train_df[target_col].to_numpy(dtype=np.float64)
        ).sum()
    )

    X_train = X_train_df.values
    y_train = y_train_df.values.ravel()

    X_mean = np.zeros(len(feature_cols), dtype=np.float32)
    X_std  = np.ones(len(feature_cols), dtype=np.float32)

    for j, col in enumerate(feature_cols):
        if col in passthrough_cols:
            # mean=0, std=1 means "z-score normalization" for this column
            # becomes (x - 0) / 1 = x — i.e. a no-op, leaving dt/dt_norm
            # values exactly as they already are wherever they're applied
            # below in step 8.
            X_mean[j] = 0.0
            X_std[j]  = 1.0
        else:
            # Same z-score idea as dt_norm above: record this column's
            # TRAIN-only mean/std now, so every split can later be
            # transformed with these exact same numbers (see step 8).
            vals = X_train_df[col].values.astype(np.float32)
            X_mean[j] = float(vals.mean())
            X_std[j]  = float(vals.std())

    y_mean = float(y_train.mean())
    y_std  = float(y_train.std())
    for col, mean, std in zip(feature_cols, X_mean, X_std):
        print(f"{col}: mean={mean}, std={std}")
    # ----------------------------------------------------------------------
    # 8) Normalize each run using TRAIN stats, respecting passthrough
    # ----------------------------------------------------------------------
    normalized_runs = {}
    for rid, data in run_groups.items():
        X_vals = data[feature_cols].values.astype(np.float32)
        y_vals = data[[target_col]].values.astype(np.float32).ravel()

        X_norm = X_vals.copy()
        for j, col in enumerate(feature_cols):
            if col not in passthrough_cols:
                # Apply the same z-score transform to every split, using
                # the TRAIN-only X_mean/X_std computed above (never this
                # run's own mean/std) — that's what keeps val/test
                # statistics from leaking into what the model sees as
                # "normal". +1e-8 only guards a column with zero variance
                # in the train set (X_std[j] == 0), which would otherwise
                # divide by zero.
                X_norm[:, j] = (X_vals[:, j] - X_mean[j]) / (X_std[j] + 1e-8)
            # else: leave as-is (raw dt or pre-normalized dt_norm)

        y_norm = ((y_vals - y_mean) / (y_std + 1e-8)).astype(np.float32)

        normalized_runs[rid] = {
            "X": torch.tensor(X_norm, dtype=torch.float32, device=device),
            "y": torch.tensor(y_norm, dtype=torch.float32, device=device),
        }

    # ----------------------------------------------------------------------
    # 9) Concatenate per-run tensors into one big tensor per split (handy
    #    for anything that wants all rows of a split at once, rather than
    #    run-by-run).
    # ----------------------------------------------------------------------
    def _cat(rids, key):
        return torch.cat([normalized_runs[rid][key] for rid in rids], dim=0)

    X_train_tensor = _cat(train_ids, "X")
    y_train_tensor = _cat(train_ids, "y")
    X_val_tensor   = _cat(val_ids,   "X")
    y_val_tensor   = _cat(val_ids,   "y")
    X_test_tensor  = _cat(test_ids,  "X")
    y_test_tensor  = _cat(test_ids,  "y")

    print(f"Training data shape: X={X_train_tensor.shape}, y={y_train_tensor.shape}")
    print(f"Validation data shape: X={X_val_tensor.shape}, y={y_val_tensor.shape}")
    print(f"Test data shape: X={X_test_tensor.shape}, y={y_test_tensor.shape}")

    return {
        "train_ids": train_ids,
        "val_ids": val_ids,
        "test_ids": test_ids,
        "X_train": X_train_tensor,
        "y_train": y_train_tensor,
        "X_val": X_val_tensor,
        "y_val": y_val_tensor,
        "X_test": X_test_tensor,
        "y_test": y_test_tensor,
        "normalized_runs": normalized_runs,  # per-run tensors: "X" (T, E), "y" (T,)
        "run_groups": run_groups,            # raw frames with time, dt, dt_norm
        "df": df,                            # full frame including dt & dt_norm
        "X_mean": X_mean,
        "X_std": X_std,
        "y_mean": y_mean,
        "y_std": y_std,
        "dt_mean_train": dt_mean,
        "dt_std_train": dt_std,
        "feature_cols": feature_cols,        # echoed for convenience
        "passthrough_cols": list(passthrough_cols),
    }
