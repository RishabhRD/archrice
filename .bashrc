#
# ~/.bashrc
#

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
set -o vi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias vi='nvim'
alias ni='nvim'
alias vim='nvim'
alias r='ranger'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias p='sudo pacman'
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}



export PS1="\[\e[34m\][\[\e[m\]\[\e[35m\]\u\[\e[m\]\[\e[33m\]:\[\e[m\]\[\e[33m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[31m\]\\$\[\e[m\] "
export TERMINAL="urxvt"
shopt -s autocd
alias god_give_me='sudo'
source /usr/share/fzf/completion.bash && source /usr/share/fzf/key-bindings.bash
export HISTCONTROL=ignoreboth:erasedups
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
alias x="xrdb ~/.Xresources"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export EDITOR=/usr/bin/vim

# Coloring less command
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin/
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
