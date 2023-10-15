#!/usr/bin/env bash

option=$(printf 'Lock\nExit\nShut Down\nReboot\nSuspend\nHibernate' |
	rofi -dmenu -theme-str "
	mainbox { children: [listview]; }
	window { width: 12ch; }
	element-text { horizontal-align: 0.5; }"
)

case "$option" in
	'Lock')	~/.config/i3/lock.sh ;;
	'Exit') i3-msg exit ;;
	'Shut Down') systemctl poweroff ;;
	'Reboot') systemctl reboot ;;
	'Suspend') ~/.config/i3/lock.sh; systemctl suspend ;;
	'Hibernate') ~/.config/i3/lock.sh; systemctl hibernate ;;
esac