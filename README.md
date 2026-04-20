# Stage281: Public Key Identity Binding

## Overview
Stage281 binds a signing public key to the operator identity.

This stage adds:
- GPG signing key generation
- Git commit signing
- Git tag signing
- GitHub Verified linkage through registered public key
- Reproducible local verification steps

## What this stage proves
- A public key can be bound to the repository operator identity
- Commits can be signed locally
- GitHub can display Verified for signed commits and tags
- Third parties can verify that the signature corresponds to the registered public key

## Scope note
This stage focuses on GitHub Verified + GPG identity binding.
X.509 / certificate-based signing can be added in a later stage.

## License
MIT License
