#!/usr/bin/env bash
while true; do
	LOAD=$(cut -d " " -f1-3 /proc/loadavg)
	VOL=$(pamixer --get-volume-human)
	CPU="$(($(cat /sys/class/hwmon/hwmon0/device/temp) /1000))°C"
	xsetroot -name "\
 LOAD $LOAD\
 | CPU $CPU\
 | VOL $VOL\
 | $(date)\
"
	sleep 5
done
