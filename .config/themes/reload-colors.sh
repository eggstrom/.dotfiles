#!/usr/bin/env bash

# Get colors
background=$(cat ~/.config/themes/current/colors | grep '^background: ' | cut -d' ' -f2)
foreground=$(cat ~/.config/themes/current/colors | grep '^foreground: ' | cut -d' ' -f2)

# Load colors into Xresources
echo "background: #$background"          | xrdb -merge
echo "foreground: #$foreground"          | xrdb -merge
echo "polybar.background: E6$background" | xrdb -merge

# Create Rofi file for colors
printf "* {\n\tbackground: #${background}E6;\n\tforeground: #$foreground;\n}" > ~/.config/rofi/colors.rasi

# Reload programs
i3-msg reload
touch ~/.config/polybar/config.ini
touch ~/.config/alacritty/alacritty.yml
