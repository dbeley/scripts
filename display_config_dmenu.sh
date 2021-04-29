#!/bin/bash
# This script will launch any scripts in the ~/dotfiles/Autres/Écrans/ directory.
# The scripts in that folder are generated with arandr.

script="$(ls $HOME/dotfiles/Autres/Écrans/*.sh | xargs -n1 basename | dmenu -l 10)"
[ -z "$script" ] && exit 1

bash $HOME/dotfiles/Autres/Écrans/$script

exit 0
