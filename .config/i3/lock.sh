#!/usr/bin/env bash

background=$(xrdb -query | grep '^background:'   | cut -f2)
foreground=$(xrdb -query | grep '^foreground:'   | cut -f2)
green=$(     xrdb -query | grep '^i3lockGreen:'  | cut -f2)
red=$(       xrdb -query | grep '^i3lockRed:'    | cut -f2)
yellow=$(    xrdb -query | grep '^i3lockYellow:' | cut -f2)

i3lock -ec '00000000' \
	\
	--inside-color="${background}E6" \
	--insidever-color="${background}E6" \
	--insidewrong-color="${background}E6" \
	\
	--ring-color="$foreground" \
	--ringver-color="$yellow" \
	--ringwrong-color="$red" \
	\
	--separator-color="$foreground" \
	--keyhl-color="$green" \
	--bshl-color="$red" \
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
