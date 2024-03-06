#!/usr/bin/env bash

file="$1"
# width="$2"
# height="$3"
# horiz_pos="$4"
# vert_pos="$5"

case "$file" in
    *) bat -p --color always "$file" ;;
esac
