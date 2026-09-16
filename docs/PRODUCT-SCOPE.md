# Core OS 1.0 Product Scope

## Included
- Lightweight Debian/XFCE foundation.
- Premium Core theme and branding.
- Core Search / Launcher / Files shortcuts.
- Tasks and reminders stored locally.
- Notification daemon.
- Wi-Fi, Bluetooth, USB and power quick actions.
- Developer toolchain.
- Installer framework.
- Update bundle + GitHub Actions pipeline.
- Password-based lock/login and session locking.

## Intentionally deferred to 2.0
- Full Core Store.
- Large first-party app suite.
- Native Core Files rewrite.
- Native Core Settings rewrite.
- Cloud sync/account service.

## Security boundary
Face recognition is intentionally not enabled in the base image. A secure biometric implementation must be validated against actual laptop cameras, spoof resistance, PAM integration, recovery, and privacy requirements before it becomes an authentication method. Core 1.0 therefore keeps password/PIN authentication authoritative.

## Performance boundary
Core should remain useful on 8 GB RAM systems. Do not introduce an Electron-based shell or permanently running JavaScript desktop process into the core session. Prefer native XFCE/GTK, small shell utilities, systemd, D-Bus and event-driven components.
