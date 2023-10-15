#!/usr/bin/env bash

# Define names and files for themes
declare -A themes=(
	['Carbonfox']='carbonfox'
	['Catppuccin Frappé']='catppuccin-frappe'
	['Catppuccin Latte']='catppuccin-latte'
	['Catppuccin Macchiato']='catppuccin-macchiato'
	['Catppuccin Mocha']='catppuccin-mocha'
	['Challenger Deep']='challenger-deep'
	['Cyberpunk Neon']='cyberpunk-neon'
	['Dawnfox']='dawnfox'
	['Dayfox']='dayfox'
	['Dracula']='dracula'
	['Duskfox']='duskfox'
	['Gruvbox (Dark)']='gruvbox-dark'
	['Gruvbox (Light)']='gruvbox-light'
	['Nightfox']='nightfox'
	['Nordfox']='nordfox'
	['Rosé Pine']='rose-pine'
	['Rosé Pine Dawn']='rose-pine-dawn'
	['Rosé Pine Moon']='rose-pine-moon'
	['Wal (Dark)']='wal-dark'
	['Wal (Light)']='wal-light'
	['Terafox']='terafox'
)

# Create sorted list of themes
for theme in "${!themes[@]}"; do
	options+="$theme\n"
done
options=$(printf "$options" | sort)

# Get index of current theme
i=0
if [[ -a ~/.config/theme/current ]]; then
	current="$(basename "$(readlink ~/.config/theme/current)")"
	readarray -t optionsArray <<< "$options"

	for theme in "${optionsArray[@]}"; do
		[[ "${themes[$theme]}" == "$current" ]] && break;
		((i=i+1))
	done
fi

# Prompt user to pick theme and set it if one was chosen
option=$(printf "$options" |
	rofi -dmenu -no-custom -i -p '' -selected-row "$i" -theme-str "
	window { width: $(($(printf "$options" | wc -L)+3))ch; }
	element-text { horizontal-align: 0.5; }"
)
[[ -n "$option" ]] && ~/.config/theme/set-theme.sh "${themes[$option]}"
