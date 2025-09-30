import pathlib
import gdstk
import os

# Folders you want to process
adders = ["csa", "kogge", "rca"]

# Output folder for SVGs
output_dir = "svgs"
os.makedirs(output_dir, exist_ok=True)

for adder in adders:
    gds_files = sorted(pathlib.Path(adder, "runs").glob("*/results/final/gds/*.gds"))
    
    if not gds_files:
        print(f"⚠️ No GDS file found for {adder}")
        continue

    latest_gds = gds_files[-1]  # pick the latest run
    print(f"Processing {adder}: {latest_gds}")

    # Load GDS and export top cell to SVG
    library = gdstk.read_gds(latest_gds)
    top_cells = library.top_level()

    if not top_cells:
        print(f"No top cells found in {latest_gds}")
        continue

    svg_path = pathlib.Path(output_dir, f"{adder}.svg")
    top_cells[0].write_svg(str(svg_path))
    print(f"✅ Saved {svg_path}")

print("All done! Check the 'svgs' folder.")
