#!/usr/bin/env bash

options=$(printf "Lock\nExit\nShut Down\nReboot\nSuspend\nHibernate")
width=$(echo "$options" | wc -L)

option=$(echo "$options" | rofi -dmenu -i -p "" -theme-str "window { width: $width%; }")
case "$option" in
	"Lock")	i3lock -ui ~/.cache/background.png ;;
	"Exit") i3-msg exit ;;
	"Shut Down") systemctl poweroff ;;
	"Reboot") systemctl reboot ;;
	"Suspend") systemctl suspend ;;
	"Hibernate") systemctl hibernate ;;
esac
