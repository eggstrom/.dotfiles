#!/usr/bin/env bash

rofi -show combi -modes combi -combi-modes 'window,run' \
    -no-custom -no-sort -disable-history \
    -display-combi '' -theme 'run' \
    -run-command "$HOME/.config/rofi/scripts/run-command.sh {cmd}" \
