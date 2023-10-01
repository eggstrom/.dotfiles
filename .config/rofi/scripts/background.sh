#!/usr/bin/env bash

option=$(~/.config/rofi/scripts/menu.sh $(find ~/Pictures/backgrounds | sort | file --mime-type -f - | grep image | rev | cut -d: -f2- | rev | cut -d/ -f6-))

[[ -n "$option" ]] && ~/.config/wal/set-background.sh "$HOME/Pictures/backgrounds/$option"
