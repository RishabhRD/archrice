setxkbmap -option "caps:swapescape"
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3
