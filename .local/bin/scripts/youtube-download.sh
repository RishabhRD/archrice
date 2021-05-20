url="$(xclip -out -selection clipboard)"
echo $url
echo "Qualities...."
youtube-dl -F "$url"
if [ $? -eq 0 ]; then
	printf "Enter you choice: "
	read ans
	folder="$(cat ~/.local/share/music/directories| dmenu -p "Enter destination: ")"
	youtube-dl -c -f "$ans" -o "$folder/%(title)s.%(ext)s" "$url"
	if [ $? -eq 0 ]; then
		notify-send "download complete"
	fi
fi
