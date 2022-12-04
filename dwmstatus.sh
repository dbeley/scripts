#!/usr/bin/env bash
while true; do
	# add 2 seconds to script runtime
	# NETWORK_UP="$(vnstat -tr 2 | grep tx | xargs | cut -d ' ' -f2-3)"
	# add 2 seconds to script runtime
	# NETWORK_DOWN="$(vnstat -tr 2 | grep rx | xargs | cut -d ' ' -f2-3)"
	FREQ="$(grep MHz /proc/cpuinfo | head -n 1 | cut -d ' ' -f3 | cut -d '.' -f1)"
	CPU="$(($(cat /sys/class/hwmon/hwmon1/device/temp) /1000))°C"
	MEM=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
	LOAD=$(cut -d " " -f1-3 /proc/loadavg)
	VOL=$(pamixer --get-volume-human)
	BAT=$(cat /sys/class/power_supply/BAT0/capacity)
	DATE="$(date +%H:%M:%S)"
 # DOWN $NETWORK_DOWN\
 # | UP $NETWORK_UP\
	OUTPUT="\
 LOAD $LOAD\
 | CPU $CPU\
 | FREQ ${FREQ}MHz\
 | MEM $MEM\
 | VOL $VOL\
 | BAT $BAT%\
 | $DATE"
 	# echo $OUTPUT
	xsetroot -name "$OUTPUT"
	sleep 4
done
