#!/usr/bin/env bash

rofi -show combi -modes combi -combi-modes 'window,run' \
	-no-custom \
	-display-combi '' \
	-no-sort -disable-history \
	-run-command "$HOME/.config/rofi/scripts/run-command.sh {cmd}"
