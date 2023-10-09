#!/usr/bin/env bash

background=$(xrdb -query | grep -F 'background' | head -n1 | cut -f2)
foreground=$(xrdb -query | grep -F 'foreground' | head -n1 | cut -f2)

i3lock -ec '00000000' \
	\
	--inside-color="${background}E6" \
	--insidever-color="${background}E6" \
	--insidewrong-color="${background}E6" \
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
