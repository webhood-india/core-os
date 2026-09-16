# Core OS 1.0 — Founder / Developer Edition

Core OS is a lightweight Debian 13 (Trixie) desktop distribution focused on speed, clarity, and professional workflows.

## Design principles
- Minimal desktop: no icon clutter.
- Fast path: keyboard-first controls and event-driven helpers.
- Premium visual language: graphite surfaces, indigo accent, Inter typography.
- Linux underneath: Debian packages, terminal, Git, Python, Node, C/C++ tooling.
- Reproducible builds: Debian-native live-build configuration.
- Update-first architecture: GitHub Actions can publish update bundles separately from ISO builds.

## Core 1.0 includes
- XFCE foundation tuned for low-resource hardware.
- LightDM + live user setup.
- Core visual theme, wallpaper, icons and typography.
- Plank dock with a compact professional layout.
- Core Search (`Shift+S`).
- Quick actions (`Shift+W`, `Shift+B`, `Shift+U`, `Shift+Q`).
- Core Files (`Shift+F`).
- Camera (`Shift+C`) and meeting shortcut (`Shift+M`) with configurable defaults.
- Tasks and reminders stored locally.
- Notification daemon.
- Developer toolchain: Git, SSH, Python, Node/npm, C/C++, CMake.
- Calamares installer framework for the installed-system path.
- Core Update client with staged/backup installation and rollback support.
- GitHub Actions for ISO builds and update-bundle artifacts.

## Deliberate 1.0 boundaries
Face recognition is **not enabled by default**. Secure biometric unlock requires a hardware/PAM implementation and device-specific validation; Core 1.0 provides the security/settings architecture without shipping an unverified face-auth stack that would increase attack surface and background resource use.

The built-in app set is intentionally small. A full Core Store and larger first-party application suite are planned for 2.0.

## Build
Build on **Debian 13/Trixie**, not Ubuntu WSL:

```bash
sudo ./scripts/preflight.sh
sudo ./scripts/build-iso.sh
```

Output:

```text
build/CoreOS-1.0-amd64.iso
build/CoreOS-1.0-amd64.iso.sha256
```

## Update architecture

```text
GitHub commit
    -> GitHub Actions
    -> Core update bundle
    -> GitHub Release / artifact
    -> Core Update client
    -> stage + verify + backup
    -> apply
    -> reboot if required
```

The ISO remains the installation/recovery medium. Routine Core changes should ship as update bundles instead of forcing a complete ISO rebuild.
