base=$(basename $1)
ext="${base##*.}"
base="${base%.*}"

ffmpeg -i "$1" -itsoffset 0.350 -i "$1" -c:v h264 -c:a aac -map 0:0 -map 1:1 "$base"_synced."$ext" &&
notify-send "Video Sync Done" "$base"
