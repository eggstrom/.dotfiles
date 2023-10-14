#!/usr/bin/env bash

# Define names and files for themes
declare -A themes=(
	['Catppuccin Frappé']='catppuccin-frappe'
	['Catppuccin Latte']='catppuccin-latte'
	['Catppuccin Macchiato']='catppuccin-macchiato'
	['Catppuccin Mocha']='catppuccin-mocha'
	['Dracula']='dracula'
	['Gruvbox (Dark)']='gruvbox-dark'
	['Gruvbox (Light)']='gruvbox-light'
	['Rosé Pine']='rose-pine'
	['Rosé Pine Dawn']='rose-pine-dawn'
	['Rosé Pine Moon']='rose-pine-moon'
	['Wal (Dark)']='wal-dark'
	['Wal (Light)']='wal-light'
)

# Create sorted list of themes
for theme in "${!themes[@]}"; do
	options+="$theme\n"
done
options=$(printf "$options" | sort)

# Get index of current theme
readarray -t optionsArray <<< "$options"
current="$(basename "$(readlink ~/.config/theme/current)")"
i=0
for theme in "${optionsArray[@]}"; do
	[[ "${themes[$theme]}" == "$current" ]] && break;
	((i=i+1))
done
echo "$i"

# Prompt user to pick theme and set it if one was chosen
option=$(printf "$options" | rofi -dmenu -no-custom -i -p '' -selected-row "$i")
[[ -n "$option" ]] && ~/.config/theme/set-theme.sh "${themes[$option]}"
