#!/bin/bash
exist=$(pgrep ffmpeg)
[ ! -z "$exist" ] && printf "🛑 Recording\n"
