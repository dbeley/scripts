#!/usr/bin/env bash
while true; do
	LOAD=$(cut -d " " -f1-3 /proc/loadavg)
	VOL=$(pamixer --get-volume-human)
	xsetroot -name "\
 LOAD $LOAD\
 | VOL $VOL\
 | $(date)\
"
	sleep 5
done
