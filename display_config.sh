#!/bin/bash
# This script will launch any scripts in the ~/dotfiles/Autres/Écrans/ directory.
# The scripts in that folder are generated with arandr.

script="$(find "$HOME"/dotfiles/Autres/Écrans/*.sh -print0 | xargs -0 -n1 basename | rofi -dmenu -p "Script " -l 5 -width 30 -no-custom -i)"
[ -z "$script" ] && exit 1

bash "$HOME/dotfiles/Autres/Écrans/$script"

exit 0
