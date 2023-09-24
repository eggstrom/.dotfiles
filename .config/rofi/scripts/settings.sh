#!/usr/bin/env bash

option=$(~/.config/rofi/scripts/menu.sh 'Network\nBackground')

case "$option" in
	'Network') ~/.config/rofi/scripts/network.sh ;;
	'Background') ~/.config/rofi/scripts/background.sh ;;
esac
