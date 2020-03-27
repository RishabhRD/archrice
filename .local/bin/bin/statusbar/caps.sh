sleep 0.25
state="$(xset q | grep "Caps" | cut -c 22-24)"
if [ "$state" != "off" ]
then
	res=$(printf "<span color='#ff0000'>CAPS LOCK ON</span>")
	echo $res
else 
	printf ""
fi
