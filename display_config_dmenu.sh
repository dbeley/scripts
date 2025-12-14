#!/bin/bash
# This script will launch any scripts in the ~/dotfiles/Autres/Écrans/ directory.
# The scripts in that folder are generated with arandr.

MON=$1

# Import the colors
# shellcheck source=/dev/null
. "${HOME}/.cache/wal/colors.sh"

# shellcheck disable=SC2154
script="$(find "$HOME"/dotfiles/Autres/Écrans/*.sh -print0 | xargs -0 -n1 basename | dmenu -i -l 10 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -m "$MON")"
[ -z "$script" ] && exit 1

bash "$HOME/dotfiles/Autres/Écrans/$script"

exit 0
