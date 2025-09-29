import os
from cairosvg import svg2png
from PIL import Image

def convert_svg_to_png_with_white_bg(svg_path, png_path, scale=4.0):
    """
    Convert SVG to PNG with a white background.
    :param svg_path: Path to SVG file
    :param png_path: Output PNG file path
    :param scale: Scale factor for resolution (higher = sharper images)
    """
    # Convert SVG to PNG (scaled up to preserve quality)
    temp_png = png_path + "_temp.png"
    svg2png(url=svg_path, write_to=temp_png, scale=scale)

    # Open the temporary PNG
    img = Image.open(temp_png).convert("RGBA")

    # Create white background
    white_bg = Image.new("RGBA", img.size, "WHITE")
    white_bg.paste(img, (0, 0), img)

    # Save final PNG with white background
    white_bg.convert("RGB").save(png_path, "PNG")

    # Remove temporary file
    os.remove(temp_png)

def process_directory(root_dir, scale=4.0):
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.lower().endswith(".svg"):
                svg_path = os.path.join(dirpath, filename)
                png_path = os.path.splitext(svg_path)[0] + ".png"
                print(f"Converting: {svg_path} -> {png_path}")
                convert_svg_to_png_with_white_bg(svg_path, png_path, scale=scale)

if __name__ == "__main__":
    root_directory = "."  # Change this if needed
    scale_factor = 4.0   # Increase for sharper results (2.0, 4.0, 6.0, etc.)
    process_directory(root_directory, scale=scale_factor)
