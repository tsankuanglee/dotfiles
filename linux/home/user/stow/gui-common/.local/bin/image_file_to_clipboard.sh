#!/bin/bash

# This script sets the clipboard content to an image file in either JPG or PNG format.
# It supports macOS (using osascript), Wayland (using wl-copy), and X11 (using xclip).
# The script automatically detects the environment and uses the appropriate clipboard tool.

# Dependencies:
# - Wayland: Requires wl-copy (installable via package manager).
# - X11: Requires xclip (installable via package manager).
# - macOS: Requires osascript (built-in).
# - realpath: Used to resolve the absolute file path (installable via coreutils on macOS or built-in on Linux)

# Check if a filepath is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filepath> [jpg|png]"
  exit 1
fi

# Resolve the absolute path and add the file:// scheme
FILEPATH=$(realpath "$1")
SCHEME_PATH="file://$FILEPATH"

# Assign the optional format
FORMAT="${2:-png}" # Default to png if no format is provided

# Detect the environment and choose the clipboard tool
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS: Use osascript
  if [ "$FORMAT" == "jpg" ]; then
    osascript -e "set the clipboard to (read (POSIX file \"$SCHEME_PATH\") as JPEG picture)"
  elif [ "$FORMAT" == "png" ]; then
    osascript -e "set the clipboard to (read (POSIX file \"$SCHEME_PATH\") as «class PNGf») -- PNG format"
  else
    echo "Invalid format. Please specify 'jpg' or 'png'."
    exit 1
  fi
elif [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  # Wayland: Use wl-copy
  if [ "$FORMAT" == "jpg" ] || [ "$FORMAT" == "png" ]; then
    cat "$FILEPATH" | wl-copy
  else
    echo "Invalid format. Please specify 'jpg' or 'png'."
    exit 1
  fi
elif [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
  # X11: Use xclip
  if [ "$FORMAT" == "jpg" ] || [ "$FORMAT" == "png" ]; then
    cat "$FILEPATH" | xclip -selection clipboard -t image/"$FORMAT"
  else
    echo "Invalid format. Please specify 'jpg' or 'png'."
    exit 1
  fi
else
  echo "Unsupported environment. Please use macOS, Wayland, or X11."
  exit 1
fi
