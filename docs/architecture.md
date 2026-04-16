# SAI Architecture

## Overview

SAI separates execution into 4 core layers:

1. Verification Layer
2. Mount Layer
3. Sandbox Layer
4. Permission Layer

---

## Execution Flow
User → launcher.sh
↓
verifier.sh (signature + hash check)
↓
mount_image.sh (read-only mount)
↓
permission_engine (policy evaluation)
↓
sandbox_exec.sh (isolated execution)
↓
Application runs


---

## Components

### 1. Launcher
- Entry point
- Orchestrates execution pipeline

### 2. Verifier
- Validates:
  - Digital signature
  - File hash integrity
- Rejects modified images

### 3. Mount System
- Mounts AppImage as:
  - read-only squashfs
- Prevents runtime modification

### 4. Sandbox Layer
- Uses:
  - bubblewrap or firejail
- Provides:
  - namespaces
  - filesystem isolation
  - process isolation

### 5. Permission Engine
- Determines allowed capabilities:
  - network
  - filesystem access
  - device access
- Enforces runtime restrictions

---

## Design Philosophy

- Security is enforced at runtime, not packaging time
- Applications are treated as hostile
- Minimal trust assumptions
