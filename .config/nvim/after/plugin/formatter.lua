local nnoremap = vim.keymap.nnoremap
local formatter = require("rd.formatter")

nnoremap {'<leader>=', function()
  formatter.format(vim.bo.filetype)
end}
