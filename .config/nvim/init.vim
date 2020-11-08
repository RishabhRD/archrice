"Plugins
call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'puremourning/vimspector'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'flazz/vim-colorschemes'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground' "Just for testing purpose
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'mhinz/vim-startify'
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'tjdevries/express_line.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'mfussenegger/nvim-jdtls'
Plug 'VimDeathmatch/client'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RishabhRD/nvim-gruvbox'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()




source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/commentry.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/latex.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/snippets.vim
lua require("lsp_config")
lua require("statusline")
nnoremap <Leader>] <cmd>lua require'telescope.builtin'.find_files{}<CR>
