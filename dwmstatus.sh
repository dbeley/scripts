#!/usr/bin/env bash
while true; do
	LOAD=$(cut -d " " -f1-3 /proc/loadavg)
	VOL=$(pamixer --get-volume-human)
	CPU="$(($(cat /sys/class/hwmon/hwmon0/device/temp) /1000))°C"
	FREQ="$(cat /proc/cpuinfo | grep MHz | head -n 1 | cut -d ' ' -f3 | cut -d '.' -f1)"
	DATE="$(date)"
	OUTPUT="\
 LOAD $LOAD\
 | CPU $CPU\
 | FREQ ${FREQ}MHz\
 | VOL $VOL\
 | $DATE"
 	# echo $OUTPUT
	xsetroot -name "$OUTPUT"
	sleep 5
done
