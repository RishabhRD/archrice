local function colorscheme(str)
    vim.cmd(string.format('colorscheme %s', str))
end
local o = vim.o
o.background = 'dark'
vim.cmd[[set termguicolors]]
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection='0'
vim.cmd[[let ayucolor="dark"]]
colorscheme 'ayu'
