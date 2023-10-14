#!/usr/bin/env bash

case "$1" in
	'discord') "$1" --disable-smooth-scrolling ;;
	*) exec "$1" ;;
esac
