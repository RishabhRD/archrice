local function colorscheme(str)
    vim.cmd(string.format('colorscheme %s', str))
end
local o = vim.o
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection='0'
o.termguicolors = true
o.background = 'dark'
colorscheme 'nvim-rdark'
-- colorscheme 'gruvbox'
