if [ "$1" == "up" ];then
	vol=$(pulsemixer --get-volume | awk '{print $1}')
	[ $vol -lt 129 ] && pactl set-sink-mute 0 0 && pactl -- set-sink-volume 0 +5%
elif [ "$1" == "down" ];then
	vol=$(pulsemixer --get-volume | awk '{print $1}')
	[ $vol -gt 0 ] && pactl set-sink-mute 0 0 && pactl -- set-sink-volume 0 -5%
elif [ "$1" == "mute" ];then
	pactl set-sink-mute 0 toggle
fi
