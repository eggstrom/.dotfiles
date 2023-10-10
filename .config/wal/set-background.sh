#!/usr/bin/env bash

wal -qntsei "$1"
feh --no-fehbg --bg-fill --force-aliasing "$1"

mkdir ~/.config/themes/Wal
mv ~/.cache/wal/colors.Xresources ~/.cache/wal/alacritty.yml ~/.cache/wal/rofi.rasi ~/.config/themes/Wal

[[ $(readlink ~/.config/themes/current) = ~/.config/themes/Wal ]] && ~/.config/themes/reload-colors.sh
