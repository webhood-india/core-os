#!/usr/bin/env bash
set -euo pipefail

. /etc/os-release
ARCH="$(uname -m)"

[[ "$ARCH" == "x86_64" ]] || { echo "ERROR: Core OS 1.0 requires x86_64."; exit 1; }
[[ "${ID:-}" == "debian" && "${VERSION_ID:-}" == "13" ]] || {
  echo "ERROR: Build Core OS 1.0 inside Debian 13 (Trixie). Detected: ${PRETTY_NAME:-unknown}"; exit 1;
}
[[ $EUID -eq 0 ]] || { echo "ERROR: run with sudo."; exit 1; }

TOOLS=(git lb debootstrap xorriso mksquashfs grub-mkstandalone grub-mkimage mkfs.vfat rsync qemu-system-x86_64)
MISSING=()
for t in "${TOOLS[@]}"; do command -v "$t" >/dev/null 2>&1 || MISSING+=("$t"); done
if ((${#MISSING[@]})); then
  echo "ERROR: missing tools: ${MISSING[*]}"; exit 1
fi

[[ -f /usr/share/keyrings/debian-archive-keyring.gpg ]] || {
  echo "ERROR: debian-archive-keyring is missing."; exit 1;
}

FREE_KB="$(df -Pk . | awk 'NR==2 {print $4}')"
MIN_KB=$((20 * 1024 * 1024))
(( FREE_KB >= MIN_KB )) || { echo "ERROR: at least 20 GB free disk space is recommended."; exit 1; }

echo "Preflight OK"
echo "  OS: ${PRETTY_NAME}"
echo "  Architecture: ${ARCH}"
echo "  Build tools: present"
echo "  Free disk: sufficient"
