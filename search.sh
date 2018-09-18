#!/bin/bash
# This script allows searching on the web with engines indicated in searchengines.txt
# A search with a first word not corresponding to any search engines will do a search with the default engine (Qwant)
# An empty search will do a search with the default engine (Qwant) of the selected line in rofi

pgrep -x rofi && exit 1

query="$(cat $HOME/scripts/searchengines.txt | awk -F ';' '{print $1, "- "$2}' | rofi -p "Recherche " -i -dmenu)"
[ -z "$query" ] && exit 1

engines="$(cat $HOME/scripts/searchengines.txt | awk -F ';' '{print $2}')"

engine="$(echo $query | awk '{print $1}')"

echo "$engines" | grep -q "$engine"
# if engine is in engines
if [ $? -eq 0 ]; then
    # remove the first element of query
    query="$(echo $query | awk '{for (i=2; i<=NF; i++) printf("%s",( (i>2) ? OFS : "") $i)}')"
    link="$(cat $HOME/scripts/searchengines.txt | awk -v e="$engine" -F ';' '$2 == e {print $3}')"
else
    #link="https://www.qwant.com/?l=fr&h=0&hc=1&a=1&s=0&b=0&i=1&r=FR&sr=fr&q=%s"
    link="https://duckduckgo.com/?q=%s"
fi

query="${query// /+}"
finallink="${link/\%s/$query}"
xdg-open $finallink

exit 0
