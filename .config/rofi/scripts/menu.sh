#!/usr/bin/env bash

for arg in "$@"; do
	options+=$(echo "$arg" | awk '{printf "%s\\n", $0}')
done

echo $(printf "$options" | rofi -dmenu -i -p '' \
	-theme-str "window { width: $(printf \"$options\" | wc -L)%; }")
