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
alias vimrc='cd $HOME/.config/nvim;nvim $HOME/.config/nvim/init.vim'
alias myscripts='cd $HOME/.local/bin/scripts'
alias grep='grep --color=auto'
alias -g CATO='--color=always'
alias p='sudo pacman'
alias vi='nvim'
alias ni='nvim'
alias vim='nvim'
alias r='ranger'
alias xre="nvim  $HOME/.config/X11/Xresources"
alias t='tmux a'
alias td='tmux new -s default'
alias ga='git add'
alias gc='git commit'
alias w='nvim ~/.local/share/jumps/work-paths'
alias lxa='lxc-attach --clear-env'
alias sk='setupKeyboard'
alias cbuild='cmake --build ./build'
alias c='to `fzdir ~/.config`'
alias o='to `fzdir ~/personal`'
alias se='to `fzdir ~/.local/bin/scripts`'
alias n='to `fzdir ~/.vim/plugged`'
alias h='to `fzdir ~`'
alias dots='to `fzdir ~/git/dotfiles`'
alias gits='to `fzdir ~/git/`'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
to(){
  input=$1
  if [[ -z $input ]]; then
    input="$HOME"
    base_n="Home"
  else
    base_n=$(basename $input)
  fi
  if [[ -n $(pgrep tmux) ]]; then
    if [[ -z $TMUX ]]; then
      tmux a -t "default" \; neww -n $base_n -c "$input" \;
    else
      tmux rename-window $base_n \;
      cd $input
    fi
  else
    cd
    tmux new -s default \; neww -n $base_n -c $input \; kill-window -t 1 \;
  fi
}
fzdir(){
  find -L $1 -maxdepth 1 -type d | fzf --reverse --height=10
}
fzdir_deep(){
  find -L $1 -type d | fzf --reverse --height=10
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

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

autoload -U compinit && compinit

export KEYTIMEOUT=1


# install these packages to make full use of zsh:
# zsh-syntax-highlighting
# zsh-autosuggestions
# zsh-completions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
