# Stage281: Public Key Identity Binding

## Overview
Stage281 binds a signing public key to the repository operator identity.

This stage establishes a reproducible path from:

public key → local signature → GitHub account linkage → third-party verification

The goal is not only to sign artifacts, but to make the signer identity externally verifiable.

## What this stage adds
- GPG signing key generation
- Git commit signing
- Git tag signing
- GitHub public key registration
- GitHub Verified-compatible identity linkage
- Reproducible local signature verification

## What this stage proves
- A signing public key can be bound to the repository operator identity
- Commits can be signed with the corresponding private key
- Tags can be signed with the corresponding private key
- Third parties can verify signatures locally
- GitHub can show Verified status when the registered public key and identity conditions are satisfied

## Verification steps

### Verify the latest signed commit
```bash
git log --show-signature -1
Verify the signed tag
git tag -v stage281-v1
Scope note

This stage focuses on GPG-based identity binding and GitHub Verified-compatible signing.

It does not yet add:

hardware-backed key protection
YubiKey storage
X.509 certificate-based signing
Sigstore / keyless identity
threshold or multi-party identity controls

Those can be added in later stages.

Why this matters

A signature alone only proves that some private key signed the object.

Stage281 adds the next layer:
the public key is linked to the operator identity, so the signature becomes attributable, not merely cryptographically valid.

This is the foundation for stronger trust layers in later stages.

Next possible stages
Stage282: move the private key into YubiKey / hardware-backed signing
Stage283: add X.509 or certificate-based identity binding
Stage284: add multi-party or threshold identity controls
License

MIT License
