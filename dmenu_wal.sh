#!/usr/bin/env bash

MON=$1

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

dmenu_run -i -l 10 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -m "$MON"
