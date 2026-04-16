#!/usr/bin/env bash
set -euo pipefail

APPIMAGE="$1"

if [[ -z "$APPIMAGE" ]]; then
  echo "Usage: verify.sh <appimage>"
  exit 1
fi

echo "[SAI] Verifying signature: $APPIMAGE"

# Check signature exists
if [[ ! -f "${APPIMAGE}.sig" ]]; then
  echo "[SAI] ERROR: Missing signature file"
  exit 1
fi

# Verify GPG signature
gpg --verify "${APPIMAGE}.sig" "$APPIMAGE"

echo "[SAI] Checking SHA256 integrity..."

if [[ ! -f "${APPIMAGE}.sha256" ]]; then
  echo "[SAI] ERROR: Missing hash manifest"
  exit 1
fi

sha256sum -c "${APPIMAGE}.sha256"

echo "[SAI] Verification successful."
