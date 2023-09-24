#!/usr/bin/env bash

case "$1" in
	'discord') discord --disable-smooth-scrolling ;;
	*) exec "$1" ;;
esac

# if [[ "$1" = 'htop' ]]; then
# 	alacritty -e htop
# else
# 	exec $1
# fi
