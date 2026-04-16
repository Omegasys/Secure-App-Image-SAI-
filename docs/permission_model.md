# SAI Permission Model

## Overview

SAI uses a **capability-based permission system**.

Applications must explicitly request access.

---

## Default State
ALL PERMISSIONS = DENIED


---

## Permission Types

### 1. Network
- NONE (default)
- HTTP only
- Full TCP/UDP (rare)

---

### 2. Filesystem
- read-only /app
- explicit user directories only

---

### 3. Device Access
- camera
- microphone
- GPU (optional)
- USB devices

---

### 4. System Access
- process visibility
- IPC
- system info access

---

## Permission Schema Example

```json
{
  "network": false,
  "filesystem": {
    "home": "read-only",
    "app": "read-only"
  },
  "devices": {
    "camera": false,
    "microphone": false
  }
}
