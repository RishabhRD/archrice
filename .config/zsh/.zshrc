export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh


alias abook='abook --config "$XDG_CONFIG_HOME"/abook/abookrc --datafile "$XDG_CACHE_HOME"/abook/addressbook'
alias calcurse='calcurse -C "$XDG_CONFIG_HOME"/calcurse -D "$XDG_DATA_HOME"/calcurse '
alias gdb='gdb -nh -x "$XDG_CONFIG_HOME"/gdb/init '
alias mbsync='mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc'
alias mvn='mvn -gs "$XDG_CONFIG_HOME"/maven/settings.xml'
alias tmum='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias xbindkeys='xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config'
alias compinit='compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION'
alias startx='startx "$XDG_CONFIG_HOME"/X11/xinitrc'
alias zshrc='nvim $HOME/.config/zsh/.zshrc'
alias vimrc='nvim $HOME/.config/nvim/init.vim'
alias myscripts='cd $HOME/.local/bin/scripts'
alias grep='grep --color=auto'
alias -g CATO='--color=always'
alias p='sudo pacman'
alias vi='nvim'
alias ni='nvim'
alias vim='nvim'
alias r='lf'
alias xre="nvim  $HOME/.config/X11/Xresources"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
se(){
	find "$HOME/.local/bin/scripts/" -type f | fzf --height=30% --border=horizontal | xargs -r -o nvim
}
o(){
	cd `cat ~/.local/share/jumps/work-paths | fzf --height=20% --border=sharp `
}
cdd() {
	local dir
	dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m --height 60% --reverse --prompt='Enter Directory> ') && cd "$dir"
}
fman() {
	man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}
fins(){
	local t
	t=$(pacman -Slq | fzf -m)
	if [ ! -z "$t" ]; then
		sudo pacman -S $t
	fi
}

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		[[ $1 = 'block' ]]; then
			echo -ne '\e[1 q'

		elif [[ ${KEYMAP} == main ]] ||
			[[ ${KEYMAP} == viins ]] ||
			[[ ${KEYMAP} = '' ]] ||
			[[ $1 = 'beam' ]]; then
					echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export KEYTIMEOUT=1
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
