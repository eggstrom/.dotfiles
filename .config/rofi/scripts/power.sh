#!/usr/bin/env bash

option=$(~/.config/rofi/scripts/menu.sh 'Lock\nExit\nShut Down\nReboot\nSuspend\nHibernate')

case "$option" in
	'Lock')	i3lock -ui ~/.cache/background.png ;;
	'Exit') i3-msg exit ;;
	'Shut Down') systemctl poweroff ;;
	'Reboot') systemctl reboot ;;
	'Suspend') systemctl suspend ;;
	'Hibernate') systemctl hibernate ;;
esac
