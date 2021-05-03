#!/bin/sh
tmux new-session -d -s "popfix"
tmux neww -n "init.vim" -c "/home/rishabh/.config/nvim"
tmux neww -n "popfix" -c "/home/rishabh/.vim/plugged/popfix"
tmux neww -n "lsputils" -c "/home/rishabh/.vim/plugged/nvim-lsputils"
tmux neww -n "finder" -c "/home/rishabh/.vim/plugged/nvim-finder"
tmux neww -n "test" -c "/home/rishabh/.vim/plugged/async"
tmux neww -n "c++" -c "/home/rishabh/Documents/research/vxlan-agent/"
tmux select-window -t popfix
