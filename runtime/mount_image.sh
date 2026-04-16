#!/usr/bin/env bash

mount_image() {
  local appimage="$1"

  echo "[SAI] Mounting AppImage (read-only)..."

  MOUNT_DIR=$(mktemp -d)

  # AppImage is typically executable squashfs
  # This is a simplified mount (real implementation uses --appimage-extract or FUSE)
  "$appimage" --appimage-extract >/dev/null 2>&1 || true

  if [[ -d "squashfs-root" ]]; then
    mv squashfs-root "$MOUNT_DIR/app"
  else
    mkdir -p "$MOUNT_DIR/app"
  fi

  echo "$MOUNT_DIR/app"
}
