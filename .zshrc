parse_git_dirty() {
	stat=`git status 2>&1 | tee`
	dirty=`echo -n "$stat" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "$stat" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "$stat" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "$stat" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "$stat" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "$stat" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "$renamed" = '0' ]; then
		bits=">${bits}"
	fi
	if [ "$ahead" = '0' ]; then
		bits="*${bits}"
	fi
	if [ "$newfile" = '0' ]; then
		bits="+${bits}"
	fi
	if [ "$untracked" = '0' ]; then
		bits="?${bits}"
	fi
	if [ "$deleted" = '0' ]; then
		bits="x${bits}"
	fi
	if [ "$dirty" = '0' ]; then
		bits="!${bits}"
	fi
	if [ ! "$bits" = '' ]; then
		echo " $bits"
	else
		echo ""
	fi
}
parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ "$BRANCH" = '' ];then
		echo ""
	else
		STAT=$(parse_git_dirty)
		echo "[$BRANCH$STAT]"
	fi
}

# get current status of git repo
autoload -Uz promptinit
promptinit
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt autocd
o(){
	find -type f | fzf | xargs -r -o vim
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
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
if [[ -o HIST_FIND_NO_DUPS ]]; then
    local -A unique_matches
    for n in $_history_substring_search_matches; do
        unique_matches[${history[$n]}]="$n"
    done
    _history_substring_search_matches=(${(@no)unique_matches})
fi
alias p='sudo pacman'
alias vi='nvim'
alias ni='nvim'
alias vim='nvim'
alias r='ranger'
alias ls='ls --color=auto'
autoload -U colors && colors
source ~/.cache/wal/colors-tty.sh
alias x="xrdb ~/.Xresources"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export EDITOR=/usr/bin/vim
cat ~/.cache/wal/sequences
setopt PROMPT_SUBST
precmd(){
	psvar[1]=$(parse_git_branch)
}
PROMPT="%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}:%{$fg[magenta]%}%1~%{$fg[red]%}]%{$fg[green]%}%1v%{$reset_color%}$%b "
# Load aliases and shortcuts if existent.
#[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
#[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
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

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}
# Load zsh-syntax-highlighting; should be last.
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
