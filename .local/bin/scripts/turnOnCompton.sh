instance="$(pgrep 'compton')"
if [ -z "$instance" ]; then
	compton
else
	pkill compton
fi
