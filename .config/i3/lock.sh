#!/usr/bin/env bash

background=$(xrdb -query | grep -F 'i3lock.background' | cut -f2)
foreground=$(xrdb -query | grep -F 'i3lock.foreground' | cut -f2)

i3lock -ec '00000000' \
	\
	--inside-color="$background" \
	--insidever-color="$background" \
	--insidewrong-color="$background" \
	\
	--ring-color="$foreground" \
	--ringver-color='FFFF00' \
	--ringwrong-color='FF0000' \
	\
	--separator-color="$foreground" \
	--keyhl-color='00FF00' \
	--bshl-color='FF0000' \
	\
	--line-uses-inside \
	\
	--time-str='' \
	--date-str='' \
	--verif-text='' \
	--wrong-text='' \
	--noinput-text='' \
	--lock-text='' \
	--lockfailed-text='' \
	--greeter-text='' \
	--no-modkey-text \
