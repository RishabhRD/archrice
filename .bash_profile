#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PROMPT_COMMAND="pwd > /tmp/whereami"
[[ -f ~/.profile ]] && . ~/.profile
