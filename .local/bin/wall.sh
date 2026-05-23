#!/usr/bin/env bash

# Use absolute paths to ensure the script doesn't fail based on PATH environment
pkill swaybg
WALLPAPER_PATH="$1"

# 1. Basic validation
if [ -z "$WALLPAPER_PATH" ] || [ ! -f "$WALLPAPER_PATH" ]; then
    exit 1
fi

# 2. Update Wallpaper.
swaybg -i "$WALLPAPER_PATH" -m fill &


# 2. Update Colors first (so they are ready)
matugen image "$WALLPAPER_PATH" --source-color-index 0

# 5. Refresh System
if command -v nwg-look >/dev/null; then
    nwg-look -a
fi

pkill vibepanel
vibepanel &
pkill waypaper