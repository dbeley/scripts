#!/usr/bin/env bash
# This script displays a power menu with wofi

pgrep -x wofi && exit 1

OPTIONS="Reboot\nPoweroff\nSleep"

choice="$(echo -e "$OPTIONS" | wofi -i -dmenu )"

[ -z "$choice" ] && exit 1
case "$choice" in
Reboot)
	systemctl reboot
	;;
Poweroff)
	systemctl poweroff
	;;
Sleep)
	systemctl suspend
	;;
*)
	;;
esac

exit 0
