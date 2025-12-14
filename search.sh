#!/bin/bash
# This script allows searching on the web with engines indicated in searchengines.txt
# A search with a first word not corresponding to any search engines will do a search with the default engine (Qwant)
# An empty search will do a search with the default engine (Duckduckgo) of the selected line in rofi

if [[ -x "$(command -v rofi)" ]]; then
	query="$(awk -F ';' '{print $1, "- "$2}' "$HOME"/scripts/searchengines.txt | rofi -p "Recherche " -i -dmenu)"
elif [[ -x "$(command -v dmenu)" ]]; then
	query="$(awk -F ';' '{print $1, "- "$2}' "$HOME"/scripts/searchengines.txt | dmenu_run -i -l 10)"
elif [[ -x "$(command -v bemenu)"  ]]; then
	query="$(awk -F ';' '{print $1, "- "$2}' "$HOME"/scripts/searchengines.txt | bemenu -l 15 -p "Rercherche" --nb "#282a36" --hf "#f8f82" --fn "iosevka italic 10")"
elif [[ -x "$(command -v wofi)" ]]; then
	query="$(awk -F ';' '{print $1, "- "$2}' "$HOME"/scripts/searchengines.txt | wofi --dmenu)"
fi

[ -z "$query" ] && exit 1
engines="$(awk -F ';' '{print $2}' "$HOME"/scripts/searchengines.txt)"
engine="$(echo "$query" | awk '{print $1}')"

# if engine is in engines
if echo "$engines" | grep -q "$engine"; then
    # remove the first element of query
    query="$(echo "$query" | awk '{for (i=2; i<=NF; i++) printf("%s",( (i>2) ? OFS : "") $i)}')"
    link="$(awk -v e="$engine" -F ';' '$2 == e {print $3}' "$HOME"/scripts/searchengines.txt)"
else
	if [[ $query = *.* ]]; then
		link="%s"
	else
		link="https://duckduckgo.com/?q=%s"
	fi
fi

query="${query// /+}"
finallink="${link/\%s/$query}"
# xdg-open $finallink
firefox "$finallink"

exit 0
