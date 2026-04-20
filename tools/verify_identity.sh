#!/usr/bin/env bash
set -e

echo "== Import public key =="
gpg --import identity/public_key.asc

echo "== Verify latest commit signature =="
git log --show-signature -1

echo "== Verify tag signature =="
git tag -v stage281-v1

echo "== Identity fingerprint =="
gpg --fingerprint 6881D5D5127E1372
