#!/usr/bin/env bash

case "$1" in
	'discord') discord --disable-smooth-scrolling ;;
	*) exec "$1" ;;
esac
