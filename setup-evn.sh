#!/usr/bin/env bash

set -euo pipefail

# Configuration
REPOS_DIR="$HOME/repos"
OMARCHY_REPO="git@github.com:samzalahi/omarchy-env-setup.git" # Replace with your actual URL if different
DOTFILES_REPO="git@github.com:samzalahi/dotfiles.git"

echo "===================================================="
echo "       Omarchy: Setting Up Environments...          "
echo "===================================================="

# --------------------------------------------------
# Phase 1: Repository Checks
# --------------------------------------------------
echo -e "\n📦 Checking structural environment..."
mkdir -p "$REPOS_DIR"

# Check & Clone omarchy-env-setup
if [ ! -d "$REPOS_DIR/omarchy-env-setup" ]; then
  echo "📥 Cloning omarchy-env-setup..."
  git clone "$OMARCHY_REPO" "$REPOS_DIR/omarchy-env-setup"
else
  echo "✅ omarchy-env-setup directory detected."
fi

# Check & Clone dotfiles
if [ ! -d "$REPOS_DIR/dotfiles" ]; then
  echo "📥 Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$REPOS_DIR/dotfiles"
else
  echo "✅ dotfiles directory detected."
fi

# Move into the omarchy-env-setup folder where the sub-scripts live
cd "$REPOS_DIR/omarchy-env-setup"


# --------------------------------------------------
# Phase 2: Sequential Execution
# --------------------------------------------------
echo -e "\n🚀 Starting execution pipeline..."
echo "------------------------------------------------"

# 1. Install preferred system applications & docker DBs
if [ -f "./install-apps.sh" ]; then
  echo "🛠️ Step 2: Running core installation suite..."
  chmod +x ./install-apps.sh
  ./install-apps.sh
fi

# 2. Remove unwanted apps/bloat first
if [ -f "./remove-apps.sh" ]; then
  echo "🔥 Step 1: Removing unwanted packages..."
  chmod +x ./remove-apps.sh
  ./remove-apps.sh
fi

# 3. Link and configure dotfiles using Stow
if [ -f "./install-dotfiles.sh" ]; then
  echo "🔗 Step 3: Syncing user environment configurations..."
  chmod +x ./install-dotfiles.sh
  ./install-dotfiles.sh
fi

echo "===================================================="
echo " 🎉 System environment Setup completed successfully!"
echo "===================================================="
