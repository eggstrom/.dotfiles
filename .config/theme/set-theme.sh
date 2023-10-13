#!/usr/bin/env bash

ln -sf "$HOME/.config/theme/themes/$1" ~/.config/theme/themes/current
~/.config/theme/reload-colors.sh
