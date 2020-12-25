vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd [[packadd packer.nvim]]


local packer = require('packer')
return packer.startup(function()
    local use = use
    use {'wbthomason/packer.nvim', opt = true}
    use 'RishabhRD/nvim-finder'
    use 'RishabhRD/nvim-lsputils'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-rdark'
    use 'RishabhRD/nvim-gruvbox'
    use 'tjdevries/colorbuddy.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'honza/vim-snippets'
    use 'SirVer/ultisnips'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'puremourning/vimspector'
    use 'mbbill/undotree'
    use 'flazz/vim-colorschemes'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/plenary.nvim'
    use 'tjdevries/express_line.nvim'
    use 'glacambre/firenvim'
    use 'szw/vim-maximizer'
    use 'lervag/vimtex'
    use 'ryanoasis/vim-devicons'
    use 'glepnir/dashboard-nvim'
end)
