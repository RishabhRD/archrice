#!/bin/bash

# kills the ffmpeg and ffplay processes     
pkill ffmpeg && pkill mpv
pkill -RTMIN+22 i3blocks
