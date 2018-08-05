#//bin/bash
# This script will open in the default web browser the all-time rateyourmusic chart for a genre.

pgrep -x rofi && exit 1

query="$(rofi -i -dmenu -p "rym chart " -l 1 -width 30)"
[ -z "$query" ] && exit 1
query="${query// /+}"

link="https://rateyourmusic.com/customchart?page=1&chart_type=top&type=album&year=alltime&genre_include=1&genres=%s&include_child_genres=t&include=both&limit=none&countries="
link="${link/\%s/$query}"

xdg-open $link
