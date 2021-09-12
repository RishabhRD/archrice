vim.cmd([[packadd packer.nvim]])
vim.cmd([[packadd vimball]])

local function colorscheme_plugins(use)
  use("ayu-theme/ayu-vim")
  use("folke/tokyonight.nvim")
  use("gruvbox-community/gruvbox")
  use("bluz71/vim-nightfly-guicolors")
  use("bluz71/vim-moonfly-colors")
  use("marko-cerovac/material.nvim")
  use("mangeshrex/uwu.vim")
  use("sainnhe/gruvbox-material")
end

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("folke/todo-comments.nvim")

    use("hrsh7th/vim-vsnip")
    use("RishabhRD/nvim-lsputils")
    use("RishabhRD/popfix")
    use("RishabhRD/nvim-cheat.sh")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-vsnip")
    use("tpope/vim-fugitive")
    use("tpope/vim-commentary")
    use("mbbill/undotree")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-lua/plenary.nvim")
    use("glepnir/galaxyline.nvim")
    use("ryanoasis/vim-devicons")
    use("norcalli/nvim-colorizer.lua")
    use("mfussenegger/nvim-jdtls")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("folke/lsp-colors.nvim")
    use("ThePrimeagen/harpoon")
    use("editorconfig/editorconfig-vim")
    use("pwntester/octo.nvim") -- gh from telescope
    use("tpope/vim-scriptease") -- commands like Messages
    use("RishabhRD/nvim-qf") -- better quickfix
    use("lambdalisue/vim-protocol") -- :e https://... works now
    use("folke/zen-mode.nvim") -- distraction free
    use("folke/twilight.nvim") -- contextual
    use("windwp/nvim-spectre") -- use for complex regex search and replace
    use("sindrets/diffview.nvim")
    use("tpope/vim-surround")
    use("tpope/vim-repeat")
    use("godlygeek/tabular")
    use("tjdevries/astronauta.nvim")

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "junegunn/fzf", run = "./install --all" })
    use({ "junegunn/fzf.vim" })

    colorscheme_plugins(use)
  end,
})
