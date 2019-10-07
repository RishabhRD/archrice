#! /bin/bash
pic=$(find ~/Pictures/background/ -type f | shuf -n 1)
wal -i "$pic"
