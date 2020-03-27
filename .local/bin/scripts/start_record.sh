#!/bin/bash
location_dir=/home/rishabh/Videos/screencast
T=$(printf -e "" | rdmenu "Screencast name: ")
T="$T".mkv
video_window_title="$T"
####  Record everything on the screen  ####
ffmpeg -y -f x11grab -s \
`xdpyinfo | grep 'dimensions:'|awk '{print $2}'` \
-i :0.0 -f pulse \
-i default $location_dir/$T &
pkill -RTMIN+22 i3blocks
