if require"rd.packer_download"() then
  return
end

vim.g.mapleader = " "

-- some globals
require("rd.globals")

require("rd.plugins")
-- force astronauta to load first
vim.cmd [[runtime plugin/astronauta.vim]]

require("rd.colors")
