#!/usr/bin/env bash

option=$(~/.config/rofi/scripts/menu.sh 'Lock\nExit\nShut Down\nReboot\nSuspend\nHibernate')

case "$option" in
	'Lock')	~/.config/rofi/scripts/lock.sh ;;
	'Exit') i3-msg exit ;;
	'Shut Down') systemctl poweroff ;;
	'Reboot') systemctl reboot ;;
	'Suspend') ~/.config/rofi/scripts/lock.sh; systemctl suspend ;;
	'Hibernate') ~/.config/rofi/scripts/lock.sh; systemctl hibernate ;;
esac
