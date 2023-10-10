#!/usr/bin/env bash

wal -qntsei "$1"
feh --no-fehbg --bg-fill --force-aliasing "$1"

mkdir ~/.config/themes/wal
mv ~/.cache/wal/colors.Xresources ~/.cache/wal/alacritty.yml ~/.cache/wal/rofi.rasi ~/.config/themes/wal

[[ $(readlink ~/.config/themes/current) = ~/.config/themes/wal ]] && ~/.config/themes/reload-colors.sh
