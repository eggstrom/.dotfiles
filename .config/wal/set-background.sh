#!/usr/bin/env bash

# Either set background to given argument, current background, or do nothing
if [[ -v 1 ]]; then
	background="$1"
elif [[ -a ~/.config/wal/background ]]; then
	background="$(readlink ~/.config/wal/background)"
else
	exit
fi

# Set background
feh --no-fehbg --bg-fill --force-aliasing "$background"
ln -sf "$background" ~/.config/wal/background

# Generate themes from image
wal -qntsei "$background"
mv ~/.cache/wal/colors ~/.config/theme/themes/wal-dark
wal -lqntsei "$background"
mv ~/.cache/wal/colors ~/.config/theme/themes/wal-light

# Reload colors if a Wal theme is currently active
theme=$(readlink ~/.config/theme/current)
[[ "$theme" == ~/.config/theme/themes/wal-dark || \
   "$theme" == ~/.config/theme/themes/wal-light ]] && \
	~/.config/theme/set-theme.sh
