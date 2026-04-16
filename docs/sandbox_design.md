# SAI Sandbox Design

## Objective

Run every AppImage inside a **fully isolated Linux sandbox**.

---

## Base Technology

Preferred:
- bubblewrap (bwrap)

Alternative:
- firejail

---

## Isolation Layers

### 1. Filesystem Isolation
- Root filesystem = AppImage only
- Host filesystem = hidden
- Writable layer = tmpfs overlay

---

### 2. Network Isolation
Default:
- NO network access

Optional:
- Routed through controlled proxy

---

### 3. Process Isolation
- Separate PID namespace
- No visibility into host processes

---

### 4. Device Isolation
Blocked:
- /dev/sda*
- GPU (optional allow flag)
- USB devices

---

### 5. Syscall Filtering (seccomp)
Blocked syscalls:
- mount
- ptrace
- kexec
- init_module

---

## Example bubblewrap model

Conceptually:
