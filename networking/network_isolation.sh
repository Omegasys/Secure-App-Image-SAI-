#!/usr/bin/env bash
set -euo pipefail

# SAI Network Isolation Layer

echo "[SAI] Applying network isolation..."

# Kill all network access by default
iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Allow loopback only
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

echo "[SAI] Network fully isolated (default deny)"
