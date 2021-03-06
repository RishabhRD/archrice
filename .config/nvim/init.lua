vim.g.mapleader = ' '
-- local  o   =  vim.o
local function set(key, value)
    if value == true or value == nil then
	vim.cmd(string.format('set %s', key))
    elseif value == false then
	vim.cmd(string.format('set no%s', key))
    else
	vim.cmd(string.format('set %s=%s', key, value))
    end
end

-- Necessary to work
set 'hidden'
set 'wrap'
set 'autoread'
set 'undofile'
set ('swapfile', false)
set ('backup', false)
set ('completeopt', 'menu,menuone,noselect')

-- Tabs configuration
set ('softtabstop', 2)
set ('shiftwidth', 2)
set 'expandtab'
set 'autoindent'
set 'cindent'

-- Search configuration
set ('hlsearch', false)
set 'ignorecase'
set 'smartcase'
set ('inccommand', 'split')
set 'incsearch'

-- Looks and feels
set ('cmdheight', 1)
set 'number'
set 'relativenumber'
set 'splitright'
set 'splitbelow'
set ('updatetime', '1000')
set 'showcmd'
set ('showmode', false)
set ('colorcolumn', '80')
set ('signcolumn', 'yes')


-- local fo = require'table_opts':new('formatoptions')
-- fo = fo
--    + 't'    -- auto-wrap text using textwidth
--    + 'c'    -- auto-wrap comments using textwidth
--    + 'r'    -- auto insert comment leader on pressing enter
--    - 'o'    -- don't insert comment leader on pressing o
--    + 'q'    -- format comments with gq
--    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--    + 'n'    -- autoformat numbered list
--    - '2'    -- I am a programmer and not a writer
--    + 'j'    -- Join comments smartly
-- set ('joinspaces', false)

local shortmess = require'table_opts':new('shortmess')
shortmess = shortmess + 'c'



vim.g.text_flavor = "latex"

vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
vim.g.cheat_default_window_layout = 'split'

-- require'plugins'
require'vim_plug'
require'mappings'
require'commands'
require'autocommand'
require'lsp_config'
require'ts_config'
require'statusline'
require'colorscheme_config'
require'lsputils'
require'completion'
