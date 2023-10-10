#!/usr/bin/env bash

ln -sfn "$HOME/.config/themes/$1" ~/.config/themes/current
~/.config/themes/reload-colors.sh
