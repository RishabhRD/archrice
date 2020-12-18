vim.cmd [[packadd packer.nvim]]

vim.g.mapleader = ' '
local  o   =  vim.o
local  bo  =  vim.bo
local  wo  =  vim.wo

-- Necessary to work
o.hidden       =  true
wo.wrap     =  true
o.autoread     =  true
bo.undofile    =  true
bo.swapfile    =  false -- They disturb too much. But I also want them
o.backup       =  false
o.completeopt  =  'menuone,longest,noselect,noinsert'

-- Tabs configuration
bo.softtabstop  =  4
bo.shiftwidth   =  4
bo.autoindent   =  true
bo.cindent      =  true

-- Search configuration
o.incsearch   =  true
o.hlsearch    =  false
o.ignorecase  =  true
o.smartcase   =  true
o.inccommand  =  'split'

-- Looks and feels
o.cmdheight        =  1
wo.number          =  true
wo.relativenumber  =  true
o.showmatch        =  true
o.splitright       =  true
o.splitbelow       =  true
o.updatetime       =  1000
o.showcmd          =  true
o.showmode         =  false
wo.colorcolumn     =  '80'

-- Text behaviour
-- o.formatoptions = o.formatoptions
--                    + 't'    -- auto-wrap text using textwidth
--                    + 'c'    -- auto-wrap comments using textwidth
--                    + 'r'    -- auto insert comment leader on pressing enter
--                    - 'o'    -- don't insert comment leader on pressing o
--                    + 'q'    -- format comments with gq
--                    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--                    + 'n'    -- autoformat numbered list
--                    - '2'    -- I am a programmer and not a writer
--                    + 'j'    -- Join comments smartly
o.formatoptions = o.formatoptions..'tcrqnj'
o.joinspaces = false


vim.g.text_flavor = "latex"

vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

require'mappings'
require'commands'
require'autocommand'
require'lsp_config'
require'ts_config'
require'statusline'
require'colorscheme_config'
require'finder_config'
