pid=$(ps -ax | grep "[t]rayer ")
if [ -z "$pid" ]; then
	trayer --widthtype request --heighttype request  --align right --edge top --transparent true --alpha 50 --tint 0x000000 --padding 10
else
	pkill trayer
fi
