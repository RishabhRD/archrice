[[ -f  ~/.bashrc ]] && . ~/.bashrc
o(){
	fzf | xargs -r -o vim
}
export EDITOR="vim"
export TERMINAL="urxvt"
if [[ "$(tty)" == "/dev/tty1" ]]; then
	echo "tty found"
	startx 
else
	echo "NO TTY"
fi

