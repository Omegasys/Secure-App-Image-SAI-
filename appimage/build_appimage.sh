#!/usr/bin/env bash
set -euo pipefail

# SAI AppImage Builder

APPDIR="AppDir"
OUTPUT="SAI.AppImage"

echo "[SAI] Building AppImage..."

if [[ ! -d "$APPDIR" ]]; then
  echo "[SAI] ERROR: AppDir not found"
  exit 1
fi

# Ensure AppRun is executable
chmod +x "$APPDIR/AppRun"

# Create AppImage (requires appimagetool)
appimagetool "$APPDIR" "$OUTPUT"

echo "[SAI] Built: $OUTPUT"
