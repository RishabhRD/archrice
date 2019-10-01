t=$(/sbin/ifconfig wlp3s0 | grep 'inet ' | awk '{print $2}')
if [[ ! -z "${t// }" ]]; then
	printf "<span color='#0968b0'> </span>$t \n"
else
	printf ""
fi
