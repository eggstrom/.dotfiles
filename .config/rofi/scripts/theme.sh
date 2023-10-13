#!/usr/bin/env bash

declare -A themes=(
	['Catppuccin Frappe']='catppuccin-frappe'
	['Catppuccin Latte']='catppuccin-latte'
	['Catppuccin Macchiato']='catppuccin-macchiato'
	['Catppuccin Mocha']='catppuccin-mocha'
	['Dracula']='dracula'
	['Gruvbox (Dark)']='gruvbox-dark'
	['Gruvbox (Light)']='gruvbox-light'
	['Wal (Dark)']='wal-dark'
	['Wal (Light)']='wal-light'
)

for theme in "${!themes[@]}"; do
	options+="$theme\n"
done
options=$(printf "$options" | sort)

option=$(~/.config/rofi/scripts/menu.sh "${options}")
[[ -n "$option" ]] && ~/.config/theme/set-theme.sh "${themes[$option]}"
