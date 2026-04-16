# SAI Threat Model

Secure App Image (SAI) assumes that all packaged applications are **untrusted by default**.

---

## Threats Considered

### 1. Malicious Application Code
Apps may attempt to:
- Exfiltrate user data
- Modify system files
- Escalate privileges
- Spy via camera/microphone
- Abuse network access

**Mitigation:**
- Mandatory sandboxing (bubblewrap/firejail)
- Default deny permissions
- No direct host filesystem access

---

### 2. Supply Chain Attacks
AppImages may be:
- Tampered with
- Repackaged maliciously
- Injected with backdoors

**Mitigation:**
- Cryptographic signature verification
- Hash manifest validation
- SBOM tracking (future extension)

---

### 3. Privilege Escalation
Applications attempting:
- Kernel exploits
- SUID abuse
- Namespace escape

**Mitigation:**
- seccomp syscall filtering
- Linux namespaces isolation
- No privileged execution allowed

---

### 4. Data Exfiltration
Apps may try:
- Hidden network communication
- DNS tunneling
- Background telemetry

**Mitigation:**
- Network disabled by default
- Proxy-only optional networking
- DNS filtering rules

---

### 5. Persistence Attacks
Apps attempting to:
- Write to startup directories
- Modify shell configs
- Install background services

**Mitigation:**
- Read-only AppImage mount
- No write access to system directories
- Isolated writable overlay only

---

## Security Principle

> Everything is untrusted unless explicitly allowed.

SAI follows a **default deny, explicit allow** model.
