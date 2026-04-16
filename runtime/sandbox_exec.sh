#!/usr/bin/env bash

sandbox_exec() {
  local rootfs="$1"

  echo "[SAI] Launching sandbox..."

  # Requires bubblewrap installed
  bwrap \
    --unshare-all \
    --die-with-parent \
    --ro-bind "$rootfs" /app \
    --proc /proc \
    --dev /dev \
    --tmpfs /tmp \
    --ro-bind /usr /usr \
    --ro-bind /lib /lib \
    --ro-bind /lib64 /lib64 \
    --setenv PATH /usr/bin:/bin \
    --chdir /app \
    /app/AppRun 2>/dev/null || {
      echo "[SAI] ERROR: sandbox execution failed"
      exit 1
    }
}
