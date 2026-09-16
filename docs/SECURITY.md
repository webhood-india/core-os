# Core OS Security Model

- Password/PIN remains the authoritative local authentication method.
- Face unlock is not enabled by default.
- Core updates verify the downloaded archive hash before applying it.
- Updates create a local backup before modifying Core-owned paths.
- Do not run random downloaded update scripts as root.
- Future production updates should use signed metadata and immutable/atomic deployment.
- User data should remain local unless a user explicitly enables a cloud service.
