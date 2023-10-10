#!/usr/bin/env bash

xrdb -merge ~/.config/themes/current/colors.Xresources

i3-msg reload
touch ~/.config/polybar/config.ini
touch ~/.config/alacritty/alacritty.yml
