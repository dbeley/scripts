#!/bin/bash
# This script will toggle the touchpad (wayland version).

TOUCHPAD_IDENTIFIER="$(swaymsg -t get_inputs | jq -r '.[] | select (.type == "touchpad") | .identifier')"
TOUCHPAD_STATUS="$(swaymsg -t get_inputs | jq -r '.[] | select (.type == "touchpad") | .libinput.send_events')"

if [[ "$TOUCHPAD_STATUS" == "enabled" ]]; then
	swaymsg input "$TOUCHPAD_IDENTIFIER" events disabled
    notify-send -a 'Touchpad' 'Touchpad disabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
else
	swaymsg input "$TOUCHPAD_IDENTIFIER" events enabled
    notify-send -a 'Touchpad' 'Touchpad enabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
fi
