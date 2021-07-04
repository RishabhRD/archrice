local function plug(t)
  vim.cmd[[call plug#begin('~/.vim/plugged')]]
  for _,v in ipairs(t) do
    vim.cmd(string.format([[Plug '%s']], v))
  end
  vim.cmd[[Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }]]
  vim.cmd[[call plug#end()]]
end

plug {
  -- 'puremourning/vimspector',
  'folke/todo-comments.nvim',
  'hrsh7th/vim-vsnip',
  'RishabhRD/nvim-finder',
  'RishabhRD/nvim-lsputils',
  'RishabhRD/popfix',
  'RishabhRD/nvim-cheat.sh',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-compe',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',
  'mbbill/undotree',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-lua/plenary.nvim',
  'glepnir/galaxyline.nvim',
  'glacambre/firenvim',
  'szw/vim-maximizer',
  'ryanoasis/vim-devicons',
  'norcalli/nvim-colorizer.lua',
  'mfussenegger/nvim-jdtls',
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',
  'rafamadriz/friendly-snippets',
  -- 'ray-x/lsp_signature.nvim',
  'kyazdani42/nvim-web-devicons',
  'folke/lsp-colors.nvim',
  'junegunn/fzf.vim',
  'ThePrimeagen/harpoon',
  -- colorschemes
  'ayu-theme/ayu-vim',
  'marko-cerovac/material.nvim',
  'ChristianChiarulli/nvcode-color-schemes.vim',
  'folke/tokyonight.nvim',
  'gruvbox-community/gruvbox',
  'bluz71/vim-nightfly-guicolors',
  'bluz71/vim-moonfly-colors',
}

-- common plugin configuration that needs one line or two
require("todo-comments").setup {}
require('telescope').load_extension('fzy_native')
require'telescope_config'.do_general_mappings()
require'telescope_config'.apply_config()
vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
