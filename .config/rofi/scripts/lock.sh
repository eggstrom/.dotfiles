#!/usr/bin/env bash

backgroundColor=$(xrdb -query | grep -F 'i3lock.backgroundColor' | cut -f2)
textColor=$(xrdb -query | grep -F 'i3lock.textColor' | cut -f2)

i3lock --force-clock \
	--time-font='Jet Brains Mono Nerd Font' \
	--date-font='Jet Brains Mono Nerd Font' \
	\
	--time-str='%T' \
	--date-str='%a %b %d/%m/%Y' \
	--verif-text='' \
	--wrong-text='' \
	--noinput-text='' \
	--lock-text='' \
	--lockfailed-text='' \
	--greeter-text='' \
	--no-modkey-text \
	\
	--time-color="$textColor" \
	--date-color="$textColor" \
	\
	--inside-color="$backgroundColor" \
	--insidever-color="$backgroundColor" \
	--insidewrong-color="$backgroundColor" \
	--ring-color="$textColor" \
	--ringver-color='FFFF00' \
	--ringwrong-color='FF0000' \
	\
	--separator-color="$textColor" \
	--keyhl-color='00FF00' \
	--bshl-color='FF0000' \
	--line-uses-inside \
	\
	-ei ~/.cache/background.png
