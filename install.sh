#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BACKUP_DIR"

install_file() {
  local source="$DOTFILES_DIR/$1"
  local target="$HOME/$2"

  mkdir -p "$(dirname "$target")"

  if [ -e "$target" ]; then
    echo "Backing up $target"
    cp -p "$target" "$BACKUP_DIR/$(basename "$target")"
  fi

  echo "Installing $target"
  cp -p "$source" "$target"
}

install_file "bash/bashrc" ".bashrc"
install_file "bash/bash_aliases" ".bash_aliases"
install_file "bash/bash_functions" ".bash_functions"
install_file "tmux/tmux.conf" ".tmux.conf"

echo "Done. Backups are in: $BACKUP_DIR"
