import pandas as pd
import os

# Define the adders and paths
adders = {
    "CSA": "csa/ppa_summary.csv",
    "Kogge": "kogge/ppa_summary.csv",
    "RCA": "rca/ppa_summary.csv"
}

dataframes = {}

for adder, path in adders.items():
    if os.path.exists(path):
        df = pd.read_csv(path)
        # Drop run_dir column (we only need metrics and values)
        df = df.drop(columns=["run_dir"])
        # Transpose: metrics as index, values as column
        df_t = df.T
        df_t.columns = [adder]  # rename column with adder name
        dataframes[adder] = df_t
    else:
        print(f"Warning: File not found {path}")

# Combine into a single comparison table
comparison_df = pd.concat(dataframes.values(), axis=1)

# Save as text file
with open("adders.txt", "w") as f:
    f.write(comparison_df.to_string())

print("Comparison table saved as adders.txt")
