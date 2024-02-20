#!/usr/bin/env bash

# $1 - File name
# $2 - Width
# $3 - Height
# $4 - Horizontal position
# $5 - Vertical position

case "$1" in
    *) bat -p --color always "$1" ;;
esac
