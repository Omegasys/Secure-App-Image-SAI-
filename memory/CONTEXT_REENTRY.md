# SAI CONTEXT RE-ENTRY FILE

This file restores full understanding of the Secure App Image (SAI) system in a new chat.

---

## What SAI Is

SAI (Secure App Image) is a Linux application runtime system built on top of AppImage with:

- Mandatory sandboxing
- Capability-based permissions
- Cryptographic verification
- Network isolation layer
- Policy-driven execution engine

---

## Core Security Model

### Default Rule
> EVERYTHING IS DENIED unless explicitly allowed.

---

## System Architecture

SAI is composed of:

### 1. Permissions Layer
- JSON-based schema
- Runtime enforcement
- Capability-based access control

### 2. Sandbox Layer
- bubblewrap / firejail isolation
- seccomp syscall filtering
- namespace isolation

### 3. Networking Layer
- iptables-based isolation
- optional proxy routing
- DNS filtering rules

### 4. Integrity Layer
- signature verification
- hash manifest validation
- SBOM generation

---

## Execution Pipeline

1. AppImage selected
2. Signature verified
3. Hash validated
4. Permissions loaded
5. Sandbox initialized
6. Network policy applied
7. App executed inside isolation

---

## Design Philosophy

- Treat all applications as untrusted
- Enforce isolation at runtime, not installation time
- Minimize attack surface by default
- Require explicit opt-in for all sensitive operations

---

## Notes for Future AI Sessions

If this file is present:

- Assume full SAI system context
- Focus on Linux security primitives:
  - namespaces
  - seccomp
  - cgroups
  - iptables/nftables
- Prefer practical implementations over theoretical designs
- Build toward a Flatpak-level security model but AppImage-compatible

---

## Current Development Direction

Next steps likely include:
- GUI permission prompt system
- Rust-based runtime daemon replacing bash scripts
- per-app dynamic sandbox profiles
- secure update system with rollback protection
