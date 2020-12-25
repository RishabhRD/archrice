local o = vim.o
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection='0'
o.termguicolors = true
o.background = 'dark'
require('colorbuddy').colorscheme('nvim-rdark')
-- vim.cmd[[colorscheme gruvbox]]
