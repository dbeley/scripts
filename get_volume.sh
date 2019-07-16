#!/bin/sh
volume=`amixer -D pulse sget Master | awk -F"[][]" '/%/ { print $2 }' | head -n 1 | sed -e 's/%//g'`
mute=`amixer -D pulse sget Master | awk -F"[][]" '/%/ { print $4 }' | head -n 1`

if [ "$mute" == "on" ]; then
	# output=" $volume%"
	output="VOL $volume%"
else
	output="VOL mute"
fi

echo $output

exit 0

