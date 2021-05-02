#!/bin/bash
# This script will launch any scripts in the ~/dotfiles/Autres/Écrans/ directory.
# The scripts in that folder are generated with arandr.

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

script="$(ls $HOME/dotfiles/Autres/Écrans/*.sh | xargs -n1 basename | dmenu -i -l 10 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15")"
[ -z "$script" ] && exit 1

bash $HOME/dotfiles/Autres/Écrans/$script

exit 0
