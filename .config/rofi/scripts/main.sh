#!/usr/bin/env bash

options=$(printf "Firefox\nDiscord\nSteam\nMinecraft\nTerminal\nNetwork\nBackground")
width=$(echo "$options" | wc -L)

option=$(echo "$options" | rofi -dmenu -i -p "" -theme-str "window { width: $width%; }")
case "$option" in
	"Firefox") firefox ;;
	"Discord") discord --disable-smooth-scrolling ;;
	"Steam") steam ;;
	"Minecraft") prismlauncher ;;
	"Terminal") alacritty ;;
	"Network") ~/.config/rofi/scripts/network.sh ;;
	"Background") ~/.config/rofi/scripts/background.sh ;;
esac
