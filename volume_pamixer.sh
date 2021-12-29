#!/usr/bin/env bash
usage() { printf "%s" "\
Usage:      ./volume_pamixer.sh [up|bigup|down|bigdown|mute]
Examples:   ./volume_pamixer.sh up
"; exit 0;
}

if [[ -z "$1" ]] || [[ "$1" = "-h" ]]; then
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

if [[ "$1" != "mute" ]]; then
	notify-send -t 500 "VOL $(pamixer --get-volume-human)" -h string:x-canonical-private-synchronous:volume_pamixer -h int:value:"$(pamixer --get-volume-human)"
fi

exit 0
