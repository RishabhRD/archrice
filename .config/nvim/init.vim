"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
Plug 'frazrepo/vim-rainbow'
Plug 'rbgrouleff/bclose.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ptzz/lf.vim'
Plug 'honza/vim-snippets'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()



source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/gutentags.vim
source $HOME/.config/nvim/latex.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/tabs.vim
source $HOME/.config/nvim/tabbar.vim
source $HOME/.config/nvim/lf.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/goyo.vim
