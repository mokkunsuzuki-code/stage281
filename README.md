# Stage281-283: Identity Binding and External Signing Proof

## Overview
This repository now covers three connected layers:

- **Stage281**: GPG-based identity binding
- **Stage281.5**: pinned public key and reproducible identity verification
- **Stage283**: Sigstore keyless signing and external verification

The progression is:

local identity binding → pinned identity artifacts → externally verifiable signing proof

## Stage281
Stage281 binds a signing public key to the repository operator identity.

This adds:
- GPG signing key generation
- signed commits
- signed tags
- GitHub Verified-compatible identity linkage

## Stage281.5
Stage281.5 strengthens identity verification by pinning the public key in the repository.

This adds:
- `identity/identity.json`
- `identity/public_key.asc`
- `tools/verify_identity.sh`

These artifacts allow third parties to reproduce identity verification locally.

## Stage283
Stage283 adds external signing proof using Sigstore keyless signing.

This adds:
- OIDC-based identity authentication
- short-lived X.509 certificate issuance
- Sigstore transparency-backed bundle output
- reproducible verification with `cosign verify-blob`

## What this repository proves
- A signing key can be bound to the operator identity
- Signed commits and signed tags can be verified locally
- A pinned public key can be published and reused for verification
- External signing proof can be produced without managing a long-lived external private key
- Sigstore bundle verification can succeed independently of local GPG trust

## Verification

### Verify latest GPG-signed commit
```bash
git log --show-signature -1
Verify signed tag
git tag -v stage281-v1
Verify pinned identity
./tools/verify_identity.sh
Verify Sigstore bundle
cosign verify-blob external/sigstore/artifact.txt \
  --bundle external/sigstore/artifact.sigstore.json \
  --certificate-identity mokkun.suzuki@gmail.com \
  --certificate-oidc-issuer https://github.com/login/oauth
Scope note

This repository currently covers:

GPG identity binding
pinned public key verification
Sigstore keyless signing proof

It does not yet cover:

YubiKey-backed hardware protection
threshold signing
multi-party signer policy
Next possible step
Stage282: move signing capability to YubiKey-backed hardware
Stage284: add multi-signer or threshold identity controls
License

MIT License
