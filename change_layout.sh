#!/bin/bash

lang=$(setxkbmap -query | grep layout | sed 's/layout.* //g')

if [[ $lang = "fr" ]]
then
    setxkbmap -layout us -variant intl -option ctrl:nocaps,shift:both_capslock
    notify-send "Disposition du clavier : qwerty international"
elif [[ $lang = "us" ]]
then
    setxkbmap -layout fr -variant bepo_afnor -option ctrl:nocaps,shift:both_capslock
    notify-send "Disposition du clavier : bépo"
fi

killall xcape
xmodmap ~/.Xmodmap || true
xcape -t 200 -e "Shift_L=Escape;Shift_R=Escape;Hyper_L=Tab;Hyper_R=backslash;Control_L=Escape"
