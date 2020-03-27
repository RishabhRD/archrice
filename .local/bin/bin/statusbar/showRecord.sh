#!/bin/bash
exist=$(pgrep ffmpeg)
if [ -z "$exist" ]; then
	printf ""
else
	printf "<span color='#ff0000'>Recording</span>\n"
fi
