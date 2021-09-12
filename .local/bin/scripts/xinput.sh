id=$(xinput list | grep Touchpad | awk '{print $6}' | sed 's/id=//')
ns=`xinput list-props $id | grep "Natural Scrolling Enabled (" | awk '{print $5}' |sed 's/)://' | sed 's/(//'`
tp=`xinput list-props $id | grep "Tapping Enabled (" | awk '{print $4}' |sed 's/)://' | sed 's/(//'`
xinput set-prop $id $ns 1
xinput set-prop $id $tp 1
