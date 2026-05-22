#!/usr/bin/env bash

set -euo pipefail

echo "===================================================="
echo "       Omarchy: Removing Web Apps & Packages        "
echo "===================================================="

# --------------------------------------------------
# 1. Removing Webapps
# --------------------------------------------------
echo -e "\nExecuting: Removing Webapps..."

omarchy webapp remove \
  Basecamp \
  ChatGPT \
  Discord \
  Figma \
  Fizzy \
  "Google Contacts" \
  "Google Maps" \
  "Google Messages" \
  HEY \
  X \
  YouTube

# Skipped webapps: GitHub, Google Photos, WhatsApp, Zoom


# --------------------------------------------------
# 2. Removing Packages
# --------------------------------------------------
echo -e "\nExecuting: Removing Packages..."

omarchy pkg drop \
  typora \
  spotify \
  libreoffice-fresh \
  1password-beta \
  1password-cli \
  signal-desktop \
  pinta \
  obsidian \
  obs-studio \
  kdenlive \
  claude-code \
  chromium

# Skipped packages: xournalpp, lazydocker, opencode

omarchy remove security fido2
omarchy remove security fingerprint


# --------------------------------------------------
# Completion
# --------------------------------------------------
echo "===================================================="
echo "         🎉 All apps removed successfully           "
echo "===================================================="
