#!/bin/bash
# This script will provide an easy way to launch all the scripts placed in the same folder

if [[ -x "$(command -v rofi)" ]]; then
	script="$(find "$HOME"/scripts/*.sh -print0 | xargs -0 -n1 basename | grep -v "launch.sh" | rofi -dmenu -p "Script " -l 10 -width 30 -no-custom -i)"
elif [[ -x "$(command -v dmenu)" ]]; then
	script="$(find "$HOME"/scripts/*.sh -print0 | xargs -0 -n1 basename | grep -v "launch.sh" | dmenu_run -i -l 10)"
elif [[ -x "$(command -v bemenu)"  ]]; then
	script="$(find "$HOME"/scripts/*.sh -print0 | xargs -0 -n1 basename | grep -v "launch.sh" | bemenu -l 15 -p "Rercherche" --nb "#282a36" --hf "#f8f82" --fn "iosevka italic 10")"
fi
[ -z "$script" ] && exit 1

bash "$HOME/scripts/$script"

exit 0
