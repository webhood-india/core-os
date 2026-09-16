#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
VERSION="$(cat VERSION)"
OUT="$ROOT/build/update-$VERSION"
rm -rf "$OUT" "$ROOT/build/core-update.tar.gz" "$ROOT/build/core-update.tar.gz.sha256"
mkdir -p "$OUT/payload/usr/local/bin" "$OUT/payload/usr/share/core-os" "$OUT/payload/etc/xdg/gtk-3.0"

cp config/includes.chroot/usr/local/bin/core-* "$OUT/payload/usr/local/bin/"
cp config/includes.chroot/usr/share/core-os/* "$OUT/payload/usr/share/core-os/"
cp config/includes.chroot/etc/xdg/gtk-3.0/gtk.css "$OUT/payload/etc/xdg/gtk-3.0/gtk.css"
printf '%s\n' "$VERSION" > "$OUT/payload/etc/core-os-version"
printf 'VERSION=%s\nBUILD_DATE=%s\n' "$VERSION" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$OUT/manifest.txt"

tar -czf build/core-update.tar.gz -C "$OUT" payload manifest.txt
sha256sum build/core-update.tar.gz > build/core-update.tar.gz.sha256
cp "$OUT/manifest.txt" build/manifest.txt

echo "Built build/core-update.tar.gz"
