#!/bin/sh
# This script add a song searched by its album artist and its name to the current mpd playlist.

pgrep -x rofi && exit 1

artist="$(mpc list albumartist | rofi -i -dmenu)"

song="$(mpc search albumartist $artist | rofi -i -dmenu)"

mpc listall | grep "$song" | mpc add

exit 0
