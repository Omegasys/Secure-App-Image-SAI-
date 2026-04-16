#!/usr/bin/env bash
set -euo pipefail

# SAI Signing Script
# Uses GPG as a baseline signing mechanism (replaceable with Ed25519 later)

APPIMAGE="$1"
KEY_ID="${SAI_KEY_ID:-}"

if [[ -z "$APPIMAGE" ]]; then
  echo "Usage: sign.sh <appimage>"
  exit 1
fi

if [[ -z "$KEY_ID" ]]; then
  echo "ERROR: SAI_KEY_ID not set"
  exit 1
fi

echo "[SAI] Signing: $APPIMAGE"

# Create detached signature
gpg --default-key "$KEY_ID" \
    --output "${APPIMAGE}.sig" \
    --detach-sign \
    "$APPIMAGE"

# Create hash manifest
sha256sum "$APPIMAGE" > "${APPIMAGE}.sha256"

echo "[SAI] Signature written to ${APPIMAGE}.sig"
echo "[SAI] Hash written to ${APPIMAGE}.sha256"
