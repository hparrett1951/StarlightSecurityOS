#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   LB_DIR=/path/to/starlight-live ./brand_starlight_os_release.sh
# If LB_DIR is not set, defaults to $HOME/starlight/starlight-live

LB_DIR="${LB_DIR:-$HOME/starlight/starlight-live}"

if [[ ! -d "$LB_DIR" ]]; then
  echo "ERROR: Live-build directory not found at $LB_DIR"
  echo "Set LB_DIR to your live-build folder and try again."
  exit 1
fi

if [[ ! -f "$LB_DIR/build.sh" ]]; then
  echo "WARNING: build.sh not found in $LB_DIR. Continuing anyway..."
fi

mkdir -p "$LB_DIR/kali-config/common/includes.chroot/etc"
mkdir -p "$LB_DIR/kali-config/common/includes.chroot/usr/lib"

cat > "$LB_DIR/kali-config/common/includes.chroot/etc/os-release" <<'EOF'
NAME="Starlight Security OS"
PRETTY_NAME="Starlight Security OS 2025.1"
ID=starlight
ID_LIKE=debian
HOME_URL="https://github.com/hparrett1951/StarlightSecurityOS"
VERSION_CODENAME=Project Arrow 1
EOF

cp "$LB_DIR/kali-config/common/includes.chroot/etc/os-release"    "$LB_DIR/kali-config/common/includes.chroot/usr/lib/os-release"

echo "Wrote:"
echo "  $LB_DIR/kali-config/common/includes.chroot/etc/os-release"
echo "  $LB_DIR/kali-config/common/includes.chroot/usr/lib/os-release"
