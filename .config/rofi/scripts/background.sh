#!/usr/bin/env bash

option=$(~/.config/rofi/scripts/menu.sh $(find ~/Pictures/backgrounds | sort | file --mime-type -f - | grep image | rev | cut -d: -f2- | rev | cut -d/ -f6-))

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

	wal -nqti "$image"
	feh --no-fehbg --bg-fill ~/.cache/background.png

	mv ~/.cache/wal/alacritty.yml ~/.config/alacritty/alacritty.yml
	sed -i "s/\$fontsize/$(xrdb -query | grep -F 'i3.fontsize' | cut -f2)/" ~/.config/alacritty/alacritty.yml

	mv ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/theme.rasi
	sed -i "s/\$fontsize/$(xrdb -query | grep -F 'rofi.fontsize' | cut -f2)/" ~/.config/rofi/theme.rasi
fi
