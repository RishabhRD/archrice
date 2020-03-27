#!/bin/bash

# kills the ffmpeg and ffplay processes     
pkill ffmpeg && pkill mpv
sleep 1
pkill -RTMIN+22 i3blocks
