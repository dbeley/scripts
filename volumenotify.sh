#!/bin/sh
[ -z "$1" ] && exit 1
case "$1" in
up)
	amixer -q sset Master 1%+
	;;
bigup)
	amixer -q sset Master 10%+
	;;
down)
	amixer -q sset Master 1%-
	;;
bigdown)
	amixer -q sset Master 10%-
	;;
mute)
	amixer -q sset Master toggle
	;;
esac

volume=`amixer -D pulse sget Master | awk -F"[][]" '/%/ { print $2 }' | head -n 1 | sed -e 's/%//g'`
mute=`amixer -D pulse sget Master | awk -F"[][]" '/%/ { print $4 }' | head -n 1`

if [ "$mute" == "on" ]; then
	# output=" $volume%"
	output="$volume%"
else
	output="mute"
fi

notify-send "$output"

exit 0
