o(){
	fzf | xargs -r -o nvim
}
export PATH=$PATH:$HOME/.local/bin/scripts/
export EDITOR="nvim"
export TERMINAL="st"
if [[ "$(tty)" == "/dev/tty1" ]]; then
	echo "tty found"
	startx $HOME/.config/X11/xinitrc
else
	echo "NO TTY"
fi

