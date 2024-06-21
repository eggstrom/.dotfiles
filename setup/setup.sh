#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

sudo pacman -Syu $(sed 's/#.*//g' <pacman.txt)
