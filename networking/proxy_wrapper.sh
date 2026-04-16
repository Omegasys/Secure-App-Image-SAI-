#!/usr/bin/env bash
set -euo pipefail

# SAI Proxy Wrapper
# Routes application traffic through controlled proxy (optional)

PROXY="${SAI_PROXY:-}"

if [[ -z "$PROXY" ]]; then
  echo "[SAI] No proxy configured, network remains blocked"
  exit 0
fi

echo "[SAI] Routing through proxy: $PROXY"

export http_proxy="$PROXY"
export https_proxy="$PROXY"
export all_proxy="$PROXY"

# Execute passed command
exec "$@"
