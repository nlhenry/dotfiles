#!/bin/bash
set -e

cd ..

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SRC_DIR="$SCRIPT_DIR/gnome"
DEST_DIR="$HOME/.config/gnome"

cp -a "$SRC_DIR" "$DEST_DIR"
sudo bash "$DEST_DIR/config.sh"
