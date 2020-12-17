"Plugins
call plug#begin()
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix',
Plug 'RishabhRD/nvim-finder'
Plug 'RishabhRD/nvim-rdark'
Plug 'RishabhRD/nvim-gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'puremourning/vimspector'
Plug 'mbbill/undotree'
Plug 'flazz/vim-colorschemes'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mhinz/vim-startify'
Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/express_line.nvim'
Plug 'glacambre/firenvim'
Plug 'szw/vim-maximizer'
Plug 'lervag/vimtex'
Plug 'ryanoasis/vim-devicons'
Plug 'tjdevries/colorbuddy.vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()




source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/snippets.vim
source $HOME/.config/nvim/finder.vim

lua require("lsp_config")
lua require("ts_config")
lua require("statusline")
