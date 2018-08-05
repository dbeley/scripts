#!/bin/bash
# This script will display a notification containing the current mpd track information
# Paired with the execute_on_song_change setting of ncmpcpp

CFG_FILE="$HOME/scripts/mpdnotify.conf"

if [[ ! -f "$CFG_FILE" ]]; then
    echo "No config file."
    notify-send "No config file."
    exit 1
else
    . "$CFG_FILE"
fi

file="$MUSIC_DIR/$(mpc current -f %file%)"

songinfo="$(mpc current -f "%artist% - %title%")"

bitrate="$(file "$file" | awk -F ',' '{print $5}' | sed -e 's/^[ \t]*//')"

folder="${file%/*}"

if [[ -d $folder ]]; then
    cover="$(find "$folder/" -maxdepth 1 -type f | egrep -i -m1 "(front|cover|art)\.(jpg|jpeg|png|gif)$")"
fi

if [[ -n $cover ]]; then

    if [[ -n $COVER_SIZE ]]; then
        convert "$cover" -thumbnail $COVER_SIZE -gravity center -extent $COVER_SIZE "$TEMP_COVER"
        cover="$TEMP_COVER"
    fi
    
    notify-send "$songinfo" "$bitrate" -t 3000 -i "$cover"
else
    notify-send "$songinfo" "$bitrate" -t 3000
fi

exit 0
