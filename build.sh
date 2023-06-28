#!/bin/bash
set -e
cd "$(dirname "$(readlink -f "$0" 2>/dev/null)" 2>/dev/null)"
rm -rf pkg src
echo "= create archlinux package"
# makepkg -fsCc --noconfirm --nodeps
makepkg --noconfirm
