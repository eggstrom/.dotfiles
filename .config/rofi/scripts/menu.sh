#!/usr/bin/env bash

for arg in "$@"; do
	options+="$arg\n"
done

echo $(printf "$options" | rofi -dmenu -no-custom -i -p '' \
	-theme-str "window { width: $(printf "$options" | wc -L)%; }")
