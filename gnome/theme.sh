#!/bin/bash

# Define the theme name
THEME_NAME="Catppuccin-Dark"

echo "Applying $THEME_NAME theme..."

# 1. Set the legacy application (GTK) theme
gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"

# 2. Set the global color scheme preference to dark
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# 3. Set the GNOME Shell theme
gsettings set org.gnome.shell.extensions.user-theme name "$THEME_NAME"

echo "Theme successfully updated!"

