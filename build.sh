#!/bin/bash
set -e
cd "$(dirname "$(readlink -f "$0" 2>/dev/null)" 2>/dev/null)"
echo "= git lfs pull"
git lfs pull
echo "= create archlinux package"
rm -rf pkg src
makepkg -fsCc --noconfirm --nodeps
