#!/bin/bash
# This script displays a power menu with rofi

pgrep -x rofi && exit 1

OPTIONS="Lock\nReboot\nPoweroff\nSleep"

choice="$(echo -e "$OPTIONS" | rofi -p Commande -i -dmenu -lines 6 -width 30)"

[ -z "$choice" ] && exit 1
case "$choice" in
Reboot)
	systemctl reboot
	;;
Poweroff)
	systemctl poweroff
	;;
Lock)
	slock
	;;
Sleep)
	slock; systemctl suspend
	;;
*)
	;;
esac

exit 0
