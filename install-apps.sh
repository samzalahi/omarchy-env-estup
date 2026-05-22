#!/usr/bin/env bash

set -euo pipefail

echo "===================================================="
echo "    Omarchy: Installing Apps in an Explicit Order   "
echo "===================================================="

# Define the exact order of installation scripts
installers=(
  "./install-brave-origin.sh"
  "./install-vscode.sh"
  "./install-node.sh"
  "./install-mongodb.sh"
  "./install-stow.sh"
  # "./install-mpv.sh"  # Skipped for now
  "./install-qbittorrent.sh"
  "./install-qpwgraph.sh"
  "./install-steam.sh"
  "./install-proton-env.sh"
)

echo -e "\nRunning individual application modules..."
echo "------------------------------------------------"

# Loop through and execute each script in order
for script in "${installers[@]}"; do
  if [[ -f "$script" ]]; then
    echo "Executing: $(basename "$script")"
    source "$script"
  else
    echo "⚠️ Warning: $script not found, skipping."
  fi
done

echo "===================================================="
echo "       🎉 All apps installed successfully!          "
echo "===================================================="
