"Plugins
call plug#begin()
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'puremourning/vimspector'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground' "Just for testing purpose
call plug#end()




source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/latex.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/snippets.vim
lua require("lsp_config")
lua require("ts_config")
