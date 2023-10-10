#!/usr/bin/env bash

for arg in "$@"; do
	options+="$arg\n"
done

echo $(printf "$options" | rofi -dmenu -i -p '' \
	-theme-str "window { width: $(printf "$options" | wc -L)%; }")
