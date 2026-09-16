# Core OS Update Architecture

## Goal
A normal code change should not require a 20–30 minute ISO rebuild.

## Flow
1. Developer commits to `main`.
2. `update-bundle.yml` runs.
3. GitHub Actions packages the Core-owned files into `core-update.tar.gz`.
4. The workflow publishes the bundle to the rolling `core-update-latest` GitHub Release.
5. `core-update check` downloads the manifest.
6. If a newer version exists, the user is offered an approval dialog.
7. `pkexec core-update apply` verifies SHA256, stages files, creates a rollback backup, then applies only the Core-owned paths.
8. Reboot when the update changes session/system files.

## Important
The ISO remains the recovery/install artifact. It is not the routine update transport.

## Future hardening
For a public production release, add cryptographic signing (e.g. minisign/cosign), signed repository metadata, atomic A/B system snapshots, and a dedicated update server/CDN. SHA256 is integrity checking, not authenticity by itself.
