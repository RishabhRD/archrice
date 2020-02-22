[[ -f ~/.zshrc ]] && . ~/.zshrc
export PROMPT_COMMAND="pwd > /tmp/whereami"
[[ -f ~/.profile ]] && . ~/.profile
