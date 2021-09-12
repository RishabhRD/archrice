scrot -s ~/Pictures/.tmp.png
NAME=$(printf  "" | dmenu -p "Screenshot name: ")
if [[ -z "${NAME// }" ]]
then
	mv ~/Pictures/.tmp.png ~/Pictures/Screenshot/Screenshot$(date +%d-%m-%Y_%T).png
else
	while [ -f ~/Pictures/Screenshot/$NAME.png ]
	do
		ADD="_1"
		NAME="$NAME$ADD"
	done
	mv ~/Pictures/.tmp.png ~/Pictures/Screenshot/$NAME.png
fi
