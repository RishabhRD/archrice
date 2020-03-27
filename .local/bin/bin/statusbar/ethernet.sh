t=$(/sbin/ifconfig enp2s0f2 | grep 'inet ' | awk '{print $2}')
if [[ ! -z "${t// }" ]]; then
	printf "<span color='#0968b0'> </span>$t \n"
else
	printf ""
fi
