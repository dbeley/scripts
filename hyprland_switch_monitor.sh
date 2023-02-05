#!/usr/bin/env bash
if [[ $(hyprctl monitors | grep $1) ]]; then
	hyprctl keyword monitor "$1",disable
	notify-send "Monitor $1 is now switched off"
else
	hyprctl keyword monitor "$1",preferred,auto,1
	notify-send "Monitor $1 is now switched on"
fi
