#!/usr/bin/env bash

options=$(find ~/Pictures/backgrounds | sort | file --mime-type -f - | grep image | rev | cut -d: -f2- | rev | cut -d/ -f6-)
width=$(echo "$options" | wc -L)

option=$(echo "$options" | rofi -dmenu -i -p '' -theme-str "window { width: $width%; }")

if [[ -n "$option" ]]; then
	image="$HOME/Pictures/backgrounds/$option"
	size=$(xrandr | grep \* | awk 'NR==1{print $1'})

	if [[ "$(identify -format '%wx%h' $image)" = "$size" ]]; then
		cp "$image" ~/.cache/background.png
	else
		convert "$image[0]" \
			-interpolate Nearest -filter point \
			-resize "$size"^ -gravity Center -extent "$size" \
			~/.cache/background.png
	fi

	wal -ni "$image"
	feh --no-fehbg --bg-fill ~/.cache/background.png
	mv ~/.cache/wal/alacritty.yml ~/.config/alacritty/alacritty.yml
fi
