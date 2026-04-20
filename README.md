# QSP / VEP / Stage281 + Stage283 + Public Verification URL

## Overview

This repository integrates:

- Stage281: Identity binding (GPG + GitHub-linked identity)
- Stage281.5: Identity pinning and reproducibility
- Stage283: Sigstore keyless external proof
- Public Verification URL: Reproducible, browser-accessible verification

It provides a complete, layered trust model:

identity → external proof → public verification

---

## Public Verification

👉 https://mokkunsuzuki-code.github.io/stage281/

The public page exposes:

- summary.json (verification metadata)
- summary.sha256 (integrity hash)
- summary.json.ots (timestamp proof)
- Reproducible verification commands

---

## What This Repository Proves

This repository demonstrates that:

- A signing identity can be cryptographically bound (Stage281)
- That identity can be pinned and reproducible (Stage281.5)
- External systems can independently verify signatures (Stage283)
- All verification can be publicly reproduced via URL

---

## Trust Model

### Identity Trust (Stage281)

- GPG key generation
- GitHub-linked identity
- Signed commits
- Signed tags

### Identity Pinning (Stage281.5)

- identity/identity.json
- identity/public_key.asc
- Reproducible verification steps

### External Trust (Stage283)

- Sigstore keyless signing
- Bundle-based verification
- Independent of local GPG trust

### Public Verification

- GitHub Pages
- summary.json / sha256 / OTS
- Browser-accessible verification

---

## Artifacts

- identity/identity.json
- identity/public_key.asc
- external/sigstore/artifact.sigstore.json
- external/sigstore/artifact.txt
- public/summary.json
- public/summary.sha256
- public/summary.json.ots

---

## Verification Commands

### GPG Commit

```bash
git log --show-signature -1
GPG Tag
git tag -v stage281-v1
Sigstore
cosign verify-blob external/sigstore/artifact.txt \
  --bundle external/sigstore/artifact.sigstore.json \
  --certificate-identity mokkun.suzuki@gmail.com \
  --certificate-oidc-issuer https://oauth2.sigstore.dev/auth
Summary Verification
shasum -a 256 public/summary.json
ots verify public/summary.json.ots
Key Concept

A signature alone proves:

"someone with a private key signed this"

This repository proves:

"this specific identity signed this, and that fact is externally verifiable and publicly reproducible"

Final State

✔ Identity bound
✔ Identity pinned
✔ External proof established
✔ Public verification available

License

MIT License
