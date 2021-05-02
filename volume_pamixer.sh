#!/bin/sh
usage() { printf "%s" "\
Usage:      ./volume_pamixer.sh [up|bigup|down|bigdown|mute]
Examples:   ./volume_pamixer.sh up
"; exit 0;
}

if [ -z "$1" ] || [ "$1" == "-h" ]; then
    usage
fi
case "$1" in
up)
	pamixer -i 1
	;;
bigup)
	pamixer -i 10
	;;
down)
	pamixer -d 1
	;;
bigdown)
	pamixer -d 10
	;;
mute)
	pamixer -t
	;;
esac

notify-send -t 300 "VOL $(pamixer --get-volume-human)"

exit 0
