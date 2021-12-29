#!/usr/bin/env bash
# This script will toggle gammastep via its systemd user service

STATUS="$(systemctl --user status gammastep | grep 'Active' | awk -F ' ' '{print $2}')"

if [[ $STATUS = "active" ]]; then
	systemctl --user stop gammastep
    notify-send "gammastep is now disabled."
elif [[ $STATUS = "inactive" ]]; then
	systemctl --user start gammastep
    notify-send "gammastep is now enabled."
else
    notify-send "gammastep is $STATUS."
fi

exit 0
