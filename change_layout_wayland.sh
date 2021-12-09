#!/bin/bash

swaymsg input type:keyboard xkb_switch_layout next
LAYOUT=$(swaymsg -t get_inputs | jq '.[0].xkb_active_layout_name')
notify-send -t 1000 "$LAYOUT" -h string:x-canonical-private-synchronous:change_layout_wayland
