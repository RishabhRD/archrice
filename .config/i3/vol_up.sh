#!/bin/bash

vol=$(pulsemixer --get-volume | awk '{print $1}')

if [ $vol -lt 129 ]
then 
	pactl set-sink-mute 0 0 && pactl -- set-sink-volume 0 +5%;pkill -RTMIN+10 i3blocks
fi


