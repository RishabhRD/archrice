[ "$#" -ne 2 ] && exit
if [ "$1" == "wifi" ];then
	icon=" "
elif [ "$1" == "ethernet" ]; then
	icon="🚠"
else
	exit
fi
t=$(/sbin/ifconfig $2 | grep 'inet ' | awk '{print $2}')
[[ ! -z "${t// }" ]] && printf "$icon $t \n"
