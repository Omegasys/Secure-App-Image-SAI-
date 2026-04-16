# SAI Signing Keys

This directory stores cryptographic keys used for Secure App Image (SAI).

## IMPORTANT SECURITY RULES

- NEVER commit private keys to version control
- Add this folder to `.gitignore`
- Store private keys in secure hardware or OS keychain

---

## Recommended Setup

### GPG (current implementation)
- public key: safe to distribute
- private key: must remain offline or hardware-backed

---

## Future Upgrade Path

SAI will migrate to:
- Ed25519 signing
- Deterministic build signatures
- Reproducible build verification
