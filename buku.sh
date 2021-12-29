#!/bin/bash
# This script allows searching in buku bookmarks

pgrep -x rofi && exit 1
pgrep -x buku && exit 1

link="$(buku -p -f 10 | sed '/^waiting/ d' | rofi -p "Favoris " -i -dmenu)"
[ -z "$link" ] && exit 1

xdg-open "$link"
exit 0
