#!/usr/bin/env bash

wal -qntsei "$1"
feh --no-fehbg --bg-fill --force-aliasing "$1"

mv ~/.cache/wal/alacritty.yml ~/.cache/wal/rofi.rasi ~/.config/themes/Wal
cp ~/.cache/wal/colors.Xresources ~/.config/themes/Wal

[[ $(readlink ~/.config/themes/current) = ~/.config/themes/Wal ]] && ~/.config/themes/reload-colors.sh
