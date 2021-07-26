#!/bin/bash

swaymsg input type:keyboard xkb_switch_layout prev
layout=$(swaymsg -t get_inputs | jq '.[0].xkb_active_layout_name')
notify-send -t 1000 "$layout" -h string:x-canonical-private-synchronous:change_layout_wayland
