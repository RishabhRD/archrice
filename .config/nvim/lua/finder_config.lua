local map = require'mappings'
local finder = require'finder'
local native_sorter = require'popfix.sorter':new_fzy_native_sorter()
local M = {}

local function finderMap(key, func, str)
    str = str or ''
    local cmd = string.format([[<cmd>lua require'finder_config'.%s(%s)<CR>]], func, str)
    map.nmap(key, cmd)
end

function M.git_files(str)
    finder.git_files{
	preview_disabled = true,
	sorter = native_sorter,
	init_text = str
    }
end

function M.files(str)
    finder.files{
	init_text = str,
	sorter = native_sorter,
    }
end

function M.fuzzy_grep(str)
    finder.fuzzy_grep{
	sorter = native_sorter,
	init_text = str,
    }
end

function M.buffers(str)
    finder.buffers{
	sorter = native_sorter,
	init_text = str,
    }
end

function M.grep(str)
    finder.grep{
	sorter = native_sorter,
	init_text = str,
    }
end

function M.help(str)
    finder.help_tags{
	height = 30,
	sorter = native_sorter,
	init_text = str,
    }
end

function M.colors(str)
    finder.colorschemes{
	height = 30,
	sorter = native_sorter,
	init_text = str,
    }
end

finderMap('<leader>p', 'files')
finderMap('<leader>[', 'git_files')
finderMap('<leader>bl', 'fuzzy_grep')
finderMap('<leader>bb', 'buffers')
finderMap('<leader>bL', 'grep')
finderMap('<A-y>', 'help')
finderMap('<C-y>', 'colors')

return M
