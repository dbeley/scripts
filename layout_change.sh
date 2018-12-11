#!/bin/bash

lang=$(setxkbmap -query | grep layout | sed 's/layout.* //g')

if [[ $lang == "fr" ]]
then
    setxkbmap -layout us -variant intl -option ctrl:nocaps,shift:both_capslock
    notify-send "Disposition du clavier : qwerty international"
elif [[ $lang == "us" ]]
then
    setxkbmap -layout fr -variant bepo -option ctrl:nocaps,shift:both_capslock
    notify-send "Disposition du clavier : bépo"
fi 
