[[ -f  ~/.zshrc ]] && . ~/.zshrc
o(){
	fzf | xargs -r -o vim
}
export PATH=$PATH:$HOME/.scripts/
export EDITOR="vim"
export TERMINAL="urxvt"
if [[ "$(tty)" == "/dev/tty1" ]]; then
	echo "tty found"
	startx 
else
	echo "NO TTY"
fi

