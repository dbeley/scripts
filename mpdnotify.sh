#!/usr/bin/env bash
# This script will display a notification containing the current mpd track information
# Paired with the execute_on_song_change setting of ncmpcpp

CFG_FILE="$HOME/scripts/mpdnotify.conf"

if [[ ! -f "$CFG_FILE" ]]; then
    echo "No config file."
    notify-send "mpdnotify.sh: No config file." -h string:x-canonical-private-synchronous:mpdnotify
    exit 1
else
    . "$CFG_FILE"
fi

file="$MUSIC_DIR/$(mpc current -f %file%)"
songinfo="$(mpc current -f "%artist% - %title%")"
bitrate="$(file "$file" | awk -F ',' '{print $5}' | sed -e 's/^[ \t]*//')"
extension="${file##*.}"
folder="${file%/*}"

if [[ -d $folder ]]; then
    cover="$(find "$folder/" -maxdepth 1 -type f | grep -E -i -m1 "(front|cover|art)\.(jpg|jpeg|png|gif)$")"
fi

if [[ -n $cover ]]; then
    if [[ -n $COVER_SIZE ]]; then
        convert -quiet "$cover" -thumbnail "$COVER_SIZE" -gravity center -extent "$COVER_SIZE" "$TEMP_COVER"
        cover="$TEMP_COVER"
    fi
    if [[ -z "${bitrate}" ]]; then
    	notify-send "$songinfo" "$extension" -t 5000 -i "$cover" -h string:x-canonical-private-synchronous:mpdnotify
    else
    	notify-send "$songinfo" "$extension - $bitrate" -t 5000 -i "$cover" -h string:x-canonical-private-synchronous:mpdnotify
    fi
else
    if [[ -z "${bitrate}" ]]; then
    	notify-send "$songinfo" "$extension" -t 5000 -h string:x-canonical-private-synchronous:mpdnotify
    else
    	notify-send "$songinfo" "$extension - $bitrate" -t 5000 -h string:x-canonical-private-synchronous:mpdnotify
    fi
fi

exit 0
