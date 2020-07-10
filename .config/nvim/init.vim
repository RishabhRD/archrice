"Plugins
call plug#begin()
Plug 'frazrepo/vim-rainbow'
Plug 'rbgrouleff/bclose.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ptzz/lf.vim'
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
call plug#end()




source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/gutentags.vim
source $HOME/.config/nvim/latex.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/tabs.vim
source $HOME/.config/nvim/lf.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/goyo.vim
source $HOME/.config/nvim/rooter.vim
source $HOME/.config/nvim/vimspector.vim
