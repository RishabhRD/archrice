NAME="$(echo -e "exit i3\nno" | dmenu)"
if [ "$NAME" == "exit i3" ]
then
	i3-msg exit
fi
