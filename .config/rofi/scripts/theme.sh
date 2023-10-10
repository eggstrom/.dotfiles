#!/usr/bin/env bash

option=$(~/.config/rofi/scripts/menu.sh "$(find ~/.config/themes -maxdepth 1 -type d | tail -n+2 | cut -d/ -f6 | sort)")

[[ -n "$option" ]] && ~/.config/themes/set-theme.sh "$option"
