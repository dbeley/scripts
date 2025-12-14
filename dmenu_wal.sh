#!/usr/bin/env bash

MON=$1

# Import the colors
# shellcheck source=/dev/null
. "${HOME}/.cache/wal/colors.sh"

# shellcheck disable=SC2154
dmenu_run -i -l 10 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -m "$MON"
