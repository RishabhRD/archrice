[[ -f ~/.config/zsh/.zshenv ]] && . ~/.config/zsh/.zshenv
export PROMPT_COMMAND="pwd > /tmp/whereami"
[[ -f ~/.profile ]] && . ~/.profile
