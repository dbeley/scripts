#!/bin/sh
usage() { printf "%s" "\
Usage:      ./pulseaudiocontrol.sh [up|bigup|down|bigdown|mute]
Examples:   ./pulseaudiocontrol.sh up
"; exit 0;
}

if [ -z "$1" ] || [ "$1" == "-h" ]; then
    usage
fi
case "$1" in
up)
	pactl set-sink-volume @DEFAULT_SINK@ +1%
	;;
bigup)
	pactl set-sink-volume @DEFAULT_SINK@ +10%
	;;
down)
	pactl set-sink-volume @DEFAULT_SINK@ -1%
	;;
bigdown)
	pactl set-sink-volume @DEFAULT_SINK@ -10%
	;;
mute)
	amixer -q sset Master toggle
	;;
esac

volume=`amixer -D pulse sget Master | awk -F"[][]" '/%/ { print $2 }' | head -n 1 | sed -e 's/%//g'`
# mute=`amixer -D pulse sget Master | awk -F"[][]" '/%/ { print $4 }' | head -n 1`

if [ "$volume" -gt 100 ]; then
	pactl set-sink-volume @DEFAULT_SINK@ 100%
fi

exit 0
