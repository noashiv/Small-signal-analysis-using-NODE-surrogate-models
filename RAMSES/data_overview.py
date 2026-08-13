
from pathlib import Path
import sys
import pandas as pd
import matplotlib.pyplot as plt


INPUT_FILES = [
    "simulation_summary1.csv",
    "simulation_summary2.csv",
    "simulation_summary3.csv",
    "simulation_summary4.csv",
]

OUTPUT_DIR = Path("resultater")


def load_and_combine(files: list[str]) -> pd.DataFrame:
    
    frames = []
    reference_columns = None

    for batch_no, filename in enumerate(files, start=1):
        path = Path(filename)
        if not path.exists():
            raise FileNotFoundError(f"File not found: {path.resolve()}")

        df = pd.read_csv(path)



        # Bevar det oprindelige id og gør hver række entydig på tværs af filer.
        df.insert(0, "source_file", path.name)
        df.insert(1, "batch_no", batch_no)
        df.rename(columns={"simulation_id": "local_simulation_id"}, inplace=True)
        frames.append(df)

    combined = pd.concat(frames, ignore_index=True)
    combined.insert(2, "global_simulation_id", range(1, len(combined) + 1))
    return combined


def create_summary(df: pd.DataFrame) -> str:

    success_counts = (
        df["success"]
        .fillna(False)
        .astype(bool)
        .value_counts()
        .rename(index={True: "Succes", False: "error"})
    )

    type_summary = (
        df.groupby("disturbance_type", dropna=False)
        .agg(
            antal=("global_simulation_id", "count"),
            succesrate_pct=("success", lambda x: 100 * x.fillna(False).astype(bool).mean()),
            gennemsnit_samples=("number_of_time_samples", "mean"),
            laveste_V_N1=("V_N1_pu_min", "min"),
            højeste_V_N1=("V_N1_pu_max", "max"),
            laveste_frekvens=("frequency_PV1_Hz_min", "min"),
            højeste_frekvens=("frequency_PV1_Hz_max", "max"),
        )
        .round(3)
        .sort_values("antal", ascending=False)
    )

    numeric_overview = (
        df.select_dtypes(include="number")
        .describe()
        .transpose()[["count", "mean", "min", "max"]]
        .round(4)
    )

    missing = df.isna().sum()
    missing = missing[missing > 0].sort_values(ascending=False)

    lines = [
        "DATAOVERVIEW",
        "=" * 70,
        f"Nr of files: {df['source_file'].nunique()}",
        f"Nr of simulations: {len(df)}",
        f"NR of columns: {len(df.columns)}",
        "",
        "SUCCESS:",
        success_counts.to_string(),
        "",
        "FORDELING PÅ FORSTYRRELSESTYPE:",
        type_summary.to_string(),
        "",
        "MANGLENDE VÆRDIER:",
        missing.to_string() if not missing.empty else "Ingen manglende værdier.",
        "",
        "NUMERISK OVERBLIK:",
        numeric_overview.to_string(),
        "",
    ]
    return "\n".join(lines)


def create_plots(df: pd.DataFrame, output_dir: Path) -> None:
    """Gem to enkle oversigtsgrafer."""
    counts = df["disturbance_type"].value_counts().sort_values(ascending=False)
    ax = counts.plot(kind="bar", title="Antal simulationer pr. forstyrrelsestype")
    ax.set_xlabel("Forstyrrelsestype")
    ax.set_ylabel("Antal")
    plt.tight_layout()
    plt.savefig(output_dir / "fordeling_forstyrrelsestyper.png", dpi=150)
    plt.close()

    ax = df.boxplot(
        column="V_N1_pu_min",
        by="disturbance_type",
        grid=False,
        rot=25,
    )
    ax.set_title("Minimum V_N1 pr. forstyrrelsestype")
    ax.set_xlabel("Forstyrrelsestype")
    ax.set_ylabel("V_N1 minimum [pu]")
    plt.suptitle("")
    plt.tight_layout()
    plt.savefig(output_dir / "minimum_spaending.png", dpi=150)
    plt.close()


def main() -> None:
    OUTPUT_DIR.mkdir(exist_ok=True)

    try:
        combined = load_and_combine(INPUT_FILES)
    except (FileNotFoundError, ValueError, pd.errors.ParserError) as exc:
        print(f"Fejl: {exc}")
        sys.exit(1)

    combined_path = OUTPUT_DIR / "samlede_simulationer.csv"
    summary_path = OUTPUT_DIR / "dataoverblik.txt"
    type_summary_path = OUTPUT_DIR / "oversigt_pr_forstyrrelsestype.csv"

    combined.to_csv(combined_path, index=False)

    summary = create_summary(combined)
    summary_path.write_text(summary, encoding="utf-8")

    type_summary = (
        combined.groupby("disturbance_type", dropna=False)
        .agg(
            antal=("global_simulation_id", "count"),
            antal_success=("success", lambda x: x.fillna(False).astype(bool).sum()),
            succesrate_pct=("success", lambda x: 100 * x.fillna(False).astype(bool).mean()),
            gennemsnit_samples=("number_of_time_samples", "mean"),
            V_N1_minimum=("V_N1_pu_min", "min"),
            V_N1_maksimum=("V_N1_pu_max", "max"),
            frekvens_minimum=("frequency_PV1_Hz_min", "min"),
            frekvens_maksimum=("frequency_PV1_Hz_max", "max"),
        )
        .round(4)
        .reset_index()
    )
    type_summary.to_csv(type_summary_path, index=False)

    create_plots(combined, OUTPUT_DIR)

    print(summary)
    print("Filer gemt i:", OUTPUT_DIR.resolve())


if __name__ == "__main__":
    main()