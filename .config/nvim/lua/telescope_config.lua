local map = require'mappings'
local actions = require('telescope.actions')
local action_set = require('telescope.actions.set')
local action_state = require('telescope.actions.state')
local previewers = require('telescope.previewers')
local nmap = map.nmap
local vmap = map.vmap
local utils = require('telescope.utils')
local putils = require('telescope.previewers.utils')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values
local finders = require('telescope.finders')

local function do_lsp_mappings()
  nmap('gr', '<cmd>Telescope lsp_references<CR>')
  nmap('gd', '<cmd>Telescope lsp_definitions<CR>')
  nmap('gD', '<cmd>Telescope lsp_declarations<CR>')
  nmap('gi', '<cmd>Telescope lsp_implementations<CR>')
  nmap('gw', '<cmd>Telescope lsp_document_symbols<CR>')
  nmap('gW', '<cmd>Telescope lsp_workspace_symbols<CR>')
  nmap('gq', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')
  nmap('<leader>ad', '<cmd>Telescope lsp_document_diagnostics<CR>')
  nmap('<leader>aD', '<cmd>Telescope lsp_workspace_diagnostics<CR>')
  vmap('af', '<cmd>Telescope lsp_range_code_actions<CR>')
end


local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local function getManCommand(line)
  local splitTable = split(line, ' ')
  local bracket = string.find(splitTable[2], ')')
  return {splitTable[1], string.sub(splitTable[2], 2, bracket - 1)}
end

local function get_man_previewer(opts)
  local pager = utils.get_lazy_default(opts.PAGER, function()
    return vim.fn.executable('col') == 1 and 'col -bx' or ''
  end)
  return previewers.new_buffer_previewer {
    get_buffer_by_name = function(_, entry)
      return entry.value
    end,

    define_preview = function(self, entry, _)
      local win_width = vim.api.nvim_win_get_width(self.state.winid)
      local actual_entry = getManCommand(entry[1])
      putils.job_maker({'man', actual_entry[2], actual_entry[1]}, self.state.bufnr, {
        env = { ["PAGER"] = pager, ["MANWIDTH"] = win_width },
        value = entry.value,
        bufname = self.state.bufname
      })
      putils.regex_highlighter(self.state.bufnr, 'man')
    end
  }
end

local function man()
  local opts = {}
  pickers.new {
    results_title = 'Resources',
  finder = finders.new_oneshot_job({'man', '-k', "."}),
  sorter = conf.generic_sorter(opts),
  previewer = get_man_previewer(opts),
  attach_mappings = function(prompt_bufnr)
    action_set.select:replace(function(_, cmd)
      local selection = action_state.get_selected_entry()
      local args = getManCommand(selection[1])

      actions.close(prompt_bufnr)
      if cmd == 'default' or cmd == 'horizontal' then
        vim.cmd('Man ' .. args[2]..' '..args[1])
      elseif cmd == 'vertical' then
        vim.cmd('vert bo Man ' .. args)
      elseif cmd == 'tab' then
        vim.cmd('tab Man ' .. args)
      end
    end)

    return true
    end
}:find()
end

local function colorscheme()
  local opts = {}
  local colors = vim.list_extend(opts.colors or {}, vim.fn.getcompletion('', 'color'))
  pickers.new(opts,{
    prompt = 'Change Colorscheme',
    finder = finders.new_table {
      results = colors
    },
    -- TODO: better preview?
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()

        actions.close(prompt_bufnr)
        require'colorscheme_config'.colorscheme(selection.value)
      end)

      return true
    end
  }):find()
end

local function apply_config()
  require('telescope').setup{
    defaults = {
      color_devicons = true,
      set_env = { ['COLORTERM'] = 'truecolor' },
      prompt_position = "top",
      sorting_strategy = "ascending",
    }
  }
end

local function do_general_mappings()
  nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
  nmap('<leader>fl', [[<cmd>Rg<CR>]])
  nmap('<leader>fL', '<cmd>Telescope live_grep<CR>')
  nmap('<leader>fk', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
  nmap('<leader>fb', '<cmd>Telescope buffers<CR>')
  nmap('<leader>ft', '<cmd>Telescope builtin<CR>')
  nmap('<leader>fo', '<cmd>Telescope file_browser<CR>')
  nmap('<leader>fm', [[<cmd>lua require'telescope_config'.man()<CR>]])
  nmap('<C-y>', [[<cmd>lua require'telescope_config'.colorscheme()<CR>]])
  nmap('<A-y>', '<cmd>Telescope help_tags<CR>')
end

return {
  do_general_mappings = do_general_mappings,
  do_lsp_mappings = do_lsp_mappings,
  apply_config = apply_config,
  man = man,
  colorscheme = colorscheme
}
