#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
[[ $EUID -eq 0 ]] || { echo "ERROR: run with sudo."; exit 1; }
./scripts/preflight.sh

rm -rf config/chroot config/binary config/bootstrap config/auto chroot binary cache build
mkdir -p build

lb config \
  --ignore-system-defaults \
  --distribution trixie \
  --architectures amd64 \
  --binary-images iso-hybrid \
  --debian-installer live \
  --archive-areas "main contrib non-free non-free-firmware" \
  --apt-recommends true \
  --initsystem systemd \
  --initramfs live-boot \
  --linux-packages "linux-image" \
  --linux-flavours "amd64" \
  --firmware-chroot true \
  --firmware-binary true \
  --mirror-bootstrap "https://deb.debian.org/debian/" \
  --mirror-chroot "https://deb.debian.org/debian/" \
  --mirror-chroot-security "https://security.debian.org/debian-security/" \
  --mirror-binary "https://deb.debian.org/debian/" \
  --mirror-binary-security "https://security.debian.org/debian-security/" \
  --mirror-debian-installer "https://deb.debian.org/debian/" \
  --iso-application "Core OS" \
  --iso-publisher "Core OS Project" \
  --iso-volume "COREOS_1_0" \
  --iso-preparer "Core OS Build System" \
  --boot=live components username=user user-fullname="Core User" live-config.user-default-groups=audio,cdrom,dip,floppy,video,plugdev,netdev,powerdev,scanner,bluetooth

lb build
ISO="$(find . -maxdepth 1 -type f -name 'live-image-*.hybrid.iso' -print -quit)"
[[ -n "$ISO" ]] || { echo "ERROR: ISO was not produced."; exit 3; }
cp "$ISO" build/CoreOS-1.0-amd64.iso
sha256sum build/CoreOS-1.0-amd64.iso > build/CoreOS-1.0-amd64.iso.sha256

echo
echo "CORE OS 1.0 BUILD SUCCESSFUL"
echo "ISO: build/CoreOS-1.0-amd64.iso"
echo "SHA256: build/CoreOS-1.0-amd64.iso.sha256"
