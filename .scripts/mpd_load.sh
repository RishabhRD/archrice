mpc clear
pl=`mpc lsplaylists | dmenu -p "Enter playlist name: "`
mpc load $pl
