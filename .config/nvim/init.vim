packadd packer.nvim
lua require("plugins")
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
