#!/usr/bin/env bash
set -euo pipefail

APPIMAGE="$1"

if [[ -z "${APPIMAGE}" ]]; then
  echo "Usage: launcher.sh <appimage>"
  exit 1
fi

echo "[SAI] Starting Secure App Image launcher..."

DIR="$(dirname "$APPIMAGE")"

source "$(dirname "$0")/verifier.sh"
source "$(dirname "$0")/mount_image.sh"
source "$(dirname "$0")/sandbox_exec.sh"

verify_image "$APPIMAGE"

MOUNT_POINT=$(mount_image "$APPIMAGE")

echo "[SAI] Mounted at: $MOUNT_POINT"

sandbox_exec "$MOUNT_POINT"

echo "[SAI] Execution finished."
