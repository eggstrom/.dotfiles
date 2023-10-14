#!/usr/bin/env bash

# Get list of backgrounds
options=$(find ~/Pictures/backgrounds | file --mime-type -f - | grep image | rev | cut -d: -f2- | rev | cut -d/ -f6- | sort)

# Get index of current background
i=0
if [[ -a ~/.config/wal/background ]]; then
	current=$(readlink ~/.config/wal/background)
	readarray -t optionsArray <<< "$options"

	for option in "${optionsArray[@]}"; do
		[[ "$HOME/Pictures/backgrounds/$option" == "$current" ]] && break
		((i=i+1))
	done
fi

# Prompt user to pick background and set it if one was chosen
option=$(printf "$options" |
	rofi -dmenu -no-custom -i -p '' -selected-row "$i" -theme-str "
	window { width: $(($(printf "$options" | wc -L)+3))ch; }"
)
[[ -n "$option" ]] && ~/.config/wal/set-background.sh "$HOME/Pictures/backgrounds/$option"
