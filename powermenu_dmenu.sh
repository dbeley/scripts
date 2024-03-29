#!/bin/bash
# This script displays a power menu with rofi

pgrep -x dmenu && exit 1

MON=$1
OPTIONS="Lock\nReboot\nPoweroff\nSleep\nSuspend"

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

choice="$(echo -e $OPTIONS | dmenu -i -l 10 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -m "$MON")"
[[ -z "$choice" ]] && exit 1
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
	systemctl suspend; slock
	;;
Suspend)
	systemctl suspend; slock
	;;
*)
	;;
esac

exit 0
