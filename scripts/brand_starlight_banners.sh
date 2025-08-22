#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   LB_DIR=/path/to/starlight-live ./brand_starlight_banners.sh
# If LB_DIR is not set, defaults to $HOME/starlight/starlight-live

LB_DIR="${LB_DIR:-$HOME/starlight/starlight-live}"

if [[ ! -d "$LB_DIR" ]]; then
  echo "ERROR: Live-build directory not found at $LB_DIR"
  echo "Set LB_DIR to your live-build folder and try again."
  exit 1
fi

mkdir -p "$LB_DIR/kali-config/common/includes.chroot/etc"

cat > "$LB_DIR/kali-config/common/includes.chroot/etc/issue" <<'EOF'
Starlight Security OS \n \l
AUTHORIZED ACCESS ONLY
EOF

cat > "$LB_DIR/kali-config/common/includes.chroot/etc/motd" <<'EOF'
██╗   ██╗███████╗  Starlight Security OS  •  Authorized Access Only
██║   ██║██╔════╝  Monitoring and auditing may be in effect.
██║   ██║█████╗    Use only with permission.
╚██╗ ██╔╝██╔══╝
 ╚████╔╝ ███████╗  https://github.com/hparrett1951/StarlightSecurityOS
  ╚═══╝  ╚══════╝
EOF

echo "Wrote:"
echo "  $LB_DIR/kali-config/common/includes.chroot/etc/issue"
echo "  $LB_DIR/kali-config/common/includes.chroot/etc/motd"
