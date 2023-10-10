#!/usr/bin/env bash

option=$(~/.config/rofi/scripts/menu.sh $(ls -l ~/.config/themes | grep '^d' | rev | cut -d' ' -f1 | rev))

[[ -n "$option" ]] && ~/.config/themes/set-theme.sh "$option"
