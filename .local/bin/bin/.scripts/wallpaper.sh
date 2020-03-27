#! /bin/bash
pic=$(find ~/Pictures/background/ -type f | shuf -n 1)
echo $pic > ~/Pictures/.curwal
feh --bg-fill "$pic"
