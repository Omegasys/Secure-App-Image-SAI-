#!/usr/bin/env bash
set -euo pipefail

# SAI Namespace Isolation Setup
# This script demonstrates manual namespace creation (for debugging)

echo "[SAI] Creating isolated namespaces..."

unshare \
  --mount \
  --uts \
  --ipc \
  --pid \
  --net \
  --user \
  --fork \
  bash -c '
    echo "[SAI] Inside isolated namespace"

    mount -t proc proc /proc

    echo "[SAI] PID: $$"
    echo "[SAI] Host processes are hidden"

    sleep 999999
'
