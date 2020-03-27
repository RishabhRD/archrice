#!/bin/bash
OPTION=$(echo -e "power-off\nrestart\nsuspend\nlock\nlog-out" | rdmenu )
if [ "$OPTION" == "power-off" ]
then
	sudo systemctl poweroff
elif [ "$OPTION" == "restart" ]
then
	sudo systemctl reboot
elif [ "$OPTION" == "suspend" ]
then
	~/.config/i3/lock.sh && sudo systemctl suspend
elif [ "$OPTION" == "lock" ]
then
	~/.config/i3/lock.sh
elif [ "$OPTION" == "log-out" ]
then
	i3-msg exit
fi
