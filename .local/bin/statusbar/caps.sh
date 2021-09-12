sleep 0.25
state="$(xset q | grep "Caps" | cut -c 22-24)"
[ "$state" != "off" ] && printf "🔠 CAPS LOCK ON\n"
