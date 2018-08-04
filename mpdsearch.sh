#!/bin/sh
# This script add a song searched by its album artist and its name to the current mpd playlist.

pgrep -x rofi && exit 1

artist="$(mpc list albumartist | rofi -p "Artiste " -no-custom -i -dmenu)"
[ -z "$artist" ] && exit 1

song="$(mpc search albumartist "$artist" | rofi -p "Titre " -no-custom -i -dmenu)"
[ -z "$song" ] && exit 1

mpc listall | grep "$song" | mpc add

exit 0
