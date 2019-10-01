NAME="$1"
cmd="$(cat "$NAME" | dmenu -p "Select Text: " -fn 'Awesome-12' -nb '#000000' -nf '#A9D3DE' -sb '#3255f1' -sf '#000000' -l 10)"
printf "$cmd" | xclip -sel clipboard
