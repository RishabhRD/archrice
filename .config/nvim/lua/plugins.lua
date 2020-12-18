vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
return packer.startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use {
	'RishabhRD/nvim-finder',
	'RishabhRD/nvim-lsputils',
	requires = {
	    'RishabhRD/popfix'
	},
    }
    use {
	'RishabhRD/nvim-rdark',
	'RishabhRD/nvim-gruvbox',
	requires = {
	    'tjdevries/colorbuddy.nvim'
	}
    }
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'honza/vim-snippets'
    use 'SirVer/ultisnips'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'puremourning/vimspector'
    use 'mbbill/undotree'
    use 'flazz/vim-colorschemes'
    use 'nvim-treesitter/nvim-treesitter'
    use 'mhinz/vim-startify'
    use 'nvim-lua/plenary.nvim'
    use 'tjdevries/express_line.nvim'
    use 'glacambre/firenvim'
    use 'szw/vim-maximizer'
    use 'lervag/vimtex'
    use 'ryanoasis/vim-devicons'
    use 'gruvbox-community/gruvbox'
end)
