#!/usr/bin/env bash

# Get list of backgrounds
options=$(find ~/Pictures/backgrounds | file --mime-type -f - | grep image | rev | cut -d: -f2- | rev | cut -d/ -f6- | sort)

# Prompt user to pick background and set it if one was chosen
option=$(printf "$options" |
	rofi -dmenu -no-custom -i -p '' -selected-row "$i" -theme-str "
	window { width: $(($(printf "$options" | wc -L)+3))ch; }"
)
[[ -n "$option" ]] && feh --bg-fill --force-aliasing "$HOME/Pictures/backgrounds/$option"
