local function plug(t)
  vim.cmd[[call plug#begin('~/.vim/plugged')]]
  for _,v in ipairs(t) do
    vim.cmd(string.format([[Plug '%s']], v))
  end
  vim.cmd[[call plug#end()]]
end

plug {
  'hrsh7th/vim-vsnip',
  'RishabhRD/nvim-finder',
  'RishabhRD/nvim-lsputils',
  'RishabhRD/popfix',
  'RishabhRD/nvim-rdark',
  'RishabhRD/nvim-gruvbox',
  'gruvbox-community/gruvbox',
  'ayu-theme/ayu-vim',
  'RishabhRD/nvim-cheat.sh',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-compe', -- TODO: unstable but he knows what we want.
  'tjdevries/colorbuddy.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',
  -- 'puremourning/vimspector',
  'mbbill/undotree',
  'nvim-treesitter/nvim-treesitter',
  'nvim-lua/plenary.nvim',
  'glepnir/galaxyline.nvim',
  'glacambre/firenvim',
  'szw/vim-maximizer',
  'ryanoasis/vim-devicons',
  'mhinz/vim-startify',
  'norcalli/nvim-colorizer.lua',
  'honza/vim-snippets',
  'mfussenegger/nvim-jdtls',
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',
  'rafamadriz/friendly-snippets',
  'hrsh7th/vim-vsnip',
  'ray-x/lsp_signature.nvim',
  'kyazdani42/nvim-web-devicons',
  'folke/lsp-colors.nvim',
}
