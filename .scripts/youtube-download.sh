url=$(xsel --clipboard)
echo "Qualities...."
youtube-dl -F "$url"
if [ $? -eq 0 ]; then
	printf "Enter you choice: "
	read ans
	folder="$(echo -e "~/Music/new\n~/Music/old\n~/Music/bhajan\n~/Music/bhojpuri\n~/Videos/youtube" | dmenu -p "Enter destination: ")"
	youtube-dl -c -f "$ans" -o "$folder/%(title)s.%(ext)s" "$url"
	if [ $? -eq 0 ]; then
		notify-send "download complete"
	fi
fi
