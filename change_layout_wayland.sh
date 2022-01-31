#!/usr/bin/env bash

swaymsg input "1:1:AT_Translated_Set_2_keyboard" xkb_switch_layout next
LAYOUT=$(swaymsg -t get_inputs | jq '.[] | select(.identifier == "1:1:AT_Translated_Set_2_keyboard") | .xkb_active_layout_name')
notify-send -t 1000 "$LAYOUT" -h string:x-canonical-private-synchronous:change_layout_wayland
