#!/usr/bin/env bash

# Set background
feh --no-fehbg --bg-fill --force-aliasing "$1"

# Generate themes from image
wal -qntsei "$1"
mv ~/.cache/wal/colors ~/.config/theme/themes/wal-dark
wal -lqntsei "$1"
mv ~/.cache/wal/colors ~/.config/theme/themes/wal-light

# Reload colors if a Wal theme is currently active
theme=$(readlink ~/.config/theme/themes/current)
[[ "$theme" = ~/.config/theme/themes/wal-dark || \
   "$theme" = ~/.config/theme/themes/wal-light ]] && \
	~/.config/theme/reload-colors.sh
