#!/bin/bash

echo "=================================================="
echo " Applying Custom Ubuntu 24.04 GNOME Settings      "
echo "=================================================="

# --------------------------------------------------
# 1. YOUR EXPLICIT REQUESTS
# --------------------------------------------------
echo "-> Adjusting Dock and Lock Screen preferences..."

# Move Dock to the bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

# Center dock apps: Disable edge-to-edge panel mode so the dock centers itself
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Set Dock icon size to 26px
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 26

# Set screen blank timeout to 10 minutes (600 seconds)
gsettings set org.gnome.desktop.session idle-delay 600

# Require password immediately when screen blanks
gsettings set org.gnome.desktop.screensaver lock-delay 0

# Move window controls to the left (macOS style)
echo "-> Moving window controls to the left..."
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

# Disable window animations (boosts UI responsiveness)
echo "-> Disabling window animations..."
gsettings set org.gnome.desktop.interface enable-animations false

# Hide the Home folder icon from the desktop
echo "-> Removing Home folder icon from desktop..."
gsettings set org.gnome.shell.extensions.ding show-home false

# Show hidden files by default in the file manager
echo "-> Setting file manager to show hidden files..."
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# Change default folder view to List View instead of Grid
echo "-> Setting default folder view to List View..."
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# --------------------------------------------------
# 2. RECOMMENDED QUALITY-OF-LIFE TWEAKS
# --------------------------------------------------
echo "-> Applying recommended performance and UX tweaks..."

# Minimize on click: Clicking an open app's dock icon minimizes its window
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Center new windows automatically when opened
gsettings set org.gnome.mutter center-new-windows true

# Show the battery percentage in the top panel
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Set clock format to include weekdays
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Force system dark mode preference 
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# --------------------------------------------------
# 3. PRIVACY & PERFORMANCE ADJUSTMENTS
# --------------------------------------------------
echo "-> Adjusting background privacy settings..."

# Turn off automatic problem reporting popping up
gsettings set org.gnome.desktop.privacy report-technical-problems false

# Remember file history for 30 days only (prevents bloat)
gsettings set org.gnome.desktop.privacy old-files-age 30
gsettings set org.gnome.desktop.privacy remove-old-trash-files true

echo "=================================================="
echo " Done! Settings applied successfully.              "
echo "=================================================="
