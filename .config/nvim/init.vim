"Plugins
call plug#begin()
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'SirVer/ultisnips'
call plug#end()




source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/gutentags.vim
source $HOME/.config/nvim/latex.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/tabs.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/vimspector.vim
