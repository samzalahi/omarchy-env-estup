#!/usr/bin/env bash

set -euo pipefail

# Define paths relative to user's HOME
DOTFILES_DIR="$HOME/repos/dotfiles"
DOTSYNC_SCRIPT="$DOTFILES_DIR/dotSync.sh"

echo "===================================================="
echo "          Omarchy: Installing Dotfiles              "
echo "===================================================="

# 1. Run dotSync to safely back up/move existing configurations
if [ -f "$DOTSYNC_SCRIPT" ]; then
  echo "🔄 Running dotSync.sh to back up current configurations..."
  chmod +x "$DOTSYNC_SCRIPT"
  (cd "$DOTFILES_DIR" && ./dotSync.sh move)
else
  echo "❌ Error: dotSync.sh not found at $DOTSYNC_SCRIPT"
  exit 1
fi

# 2. Initiating Stow configurations individually
echo "🔗 Symlinking configuration files via GNU Stow..."
cd "$DOTFILES_DIR"

# Add or remove lines below to match your exact dotfile folder names
stow -t "$HOME" bashrc
stow -t "$HOME" code
stow -t "$HOME" hyperland
stow -t "$HOME" hyperlock
stow -t "$HOME" waybar

echo "===================================================="
echo "   🎉 Dotfiles individual stow sequence complete!   "
echo "===================================================="
