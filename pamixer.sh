#!/bin/sh
usage() { printf "%s" "\
Usage:      ./pamixer.sh [up|bigup|down|bigdown|mute]
Examples:   ./pamixer.sh up
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

exit 0
