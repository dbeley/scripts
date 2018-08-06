#!/bin/bash
# This script will provide an easy way to launch all the scripts placed in the same folder

script="$(ls $HOME/scripts/*.sh | xargs -n1 basename | grep -v "launch.sh" | rofi -dmenu -p "Script
" -l 5 -width 30 -no-custom -i)"
[ -z "$script" ] && exit 1

bash $HOME/scripts/$script

exit 0
