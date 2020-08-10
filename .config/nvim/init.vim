"Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
call plug#end()




source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/airline.vim
