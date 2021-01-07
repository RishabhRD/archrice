local function plug(t)
    vim.cmd[[call plug#begin('~/.vim/plugged')]]
    for _,v in ipairs(t) do
	vim.cmd(string.format([[Plug '%s']], v))
    end
    vim.cmd[[call plug#end()]]
end

plug {
    'RishabhRD/nvim-finder',
    'RishabhRD/nvim-lsputils',
    'RishabhRD/popfix',
    'RishabhRD/nvim-rdark',
    'RishabhRD/nvim-gruvbox',
    'RishabhRD/nvim-cheat.sh',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-compe', -- TODO: unstable but he knows what we want.
    'tjdevries/colorbuddy.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-commentary',
    'puremourning/vimspector',
    'mbbill/undotree',
    'flazz/vim-colorschemes',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'tjdevries/express_line.nvim',
    'glacambre/firenvim',
    'szw/vim-maximizer',
    'lervag/vimtex',
    'ryanoasis/vim-devicons',
    'mhinz/vim-startify',
    'norcalli/nvim-colorizer.lua',
    'honza/vim-snippets',
    'SirVer/ultisnips',
}
