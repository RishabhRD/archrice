#!/bin/sh
# Give a battery name (e.g. BAT0) as an argument.

case $BLOCK_BUTTON in
    1) pgrep -x dunst >/dev/null && notify-send "Battery Status" "$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'to\ ')" -i "/home/rishabh/.config/i3/icons/battery.jpg";;
esac

capacity=$(cat /sys/class/power_supply/"$1"/capacity) || exit
status=$(cat /sys/class/power_supply/"$1"/status)
if [ "$capacity" -ge 92 ]; then
	notify-send "Battery" "Battery Charged"
elif [ "$capacity" -ge 75 ]; then
	color="#00ff00"
elif [ "$capacity" -ge 50 ]; then
	color="#ffffff"
elif [ "$capacity" -ge 10  ]; then
	color="#ffff00"
elif [ "$capacity" -l 10 ]; then
	color="#ff0000"
	warn="Low"
	notify-send "Battery" "Battery Low less than 10%"
else
	notify-send "Battery" "Battery Citically low can swith off any time"
fi

[ -z $warn ] && warn=" "

[ "$status" = "Charging" ] && color="#ffffff"

printf "<span color='%s'>%s%s%s</span>" "$color" "$(echo "$status" | sed -e "s/,//;s/Discharging/Discharging/;s/Not Charging/Not Charging/;s/Charging/Charging/;s/Unknown/Error/;s/Full/Full/;s/ 0*/ /g;s/ :/ /g")" " $warn " "$(echo "$capacity" | sed -e 's/$/%/')"
