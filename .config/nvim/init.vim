"Plugins
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
call plug#end()




source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/latex.vim
source $HOME/.config/nvim/fzf.vim
lua require("lsp_config")
