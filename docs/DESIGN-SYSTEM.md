# Core OS 1.0 Design System

## Brand
- Name: Core OS
- Voice: calm, decisive, technical, premium
- Primary accent: #6C63FF / #7C74FF
- Background: #0B0D10
- Surface: #14181E
- Elevated: #1B2027
- Primary text: #F5F7FA
- Secondary text: #9AA3AE
- UI font: Inter
- Developer font: JetBrains Mono
- Radius: 8–14px
- Motion: short and purposeful; never block boot or startup for branding.

## Desktop rules
1. No application/folder clutter on the desktop.
2. Search and launcher are keyboard-first.
3. One notification surface.
4. Core UI should not require a resident Electron/WebView process.
5. Background services must be justified by a real system need.

## Keyboard-first contract
- Shift+S — Core Search
- Shift+W — Wi-Fi quick action
- Shift+B — Bluetooth quick action
- Shift+U — USB devices
- Shift+Q — Quick Settings
- Shift+F — Core Files
- Shift+C — Camera shortcut
- Shift+M — Meeting shortcut
- Shift+N — New task
- Shift+R — Reminders
- Super+Space — Core Launcher
- Super+L — Lock
- Ctrl+Alt+T — Terminal

Users can remap these through XFCE keyboard settings today; a dedicated Core Settings editor is planned as the native UI layer evolves.
