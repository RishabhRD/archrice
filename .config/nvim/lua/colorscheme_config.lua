local mapping = require'mappings'
local transparent = true
local function colorscheme(str)
    vim.cmd(string.format('colorscheme %s', str))
    if transparent == true then
      vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
    end
end
vim.cmd[[set termguicolors]]
vim.o.background = 'dark'
vim.g.gruvbox_invert_selection='0'
vim.g.gruvbox_contrast_dark = 'hard'
colorscheme 'gruvbox'


local function toggle_transparency()
  if transparent == false then
    vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
    transparent = true
  else
    vim.o.background = 'dark'
    transparent = false
  end
end

mapping.nmap('<leader>t', [[<cmd>lua require'colorscheme_config'.toggle_transparency()<CR>]])

-- colors for LSP
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

return {
  toggle_transparency = toggle_transparency,
  colorscheme = colorscheme
}
