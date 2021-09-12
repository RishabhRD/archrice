local actions = require("telescope.actions")
local action_set = require("telescope.actions.set")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local utils = require("telescope.utils")
local putils = require("telescope.previewers.utils")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local finders = require("telescope.finders")

local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local function getManCommand(line)
  local splitTable = split(line, " ")
  local bracket = string.find(splitTable[2], ")")
  return { splitTable[1], string.sub(splitTable[2], 2, bracket - 1) }
end

local function get_man_previewer(opts)
  local pager = utils.get_lazy_default(opts.PAGER, function()
    return vim.fn.executable("col") == 1 and "col -bx" or ""
  end)
  return previewers.new_buffer_previewer({
    get_buffer_by_name = function(_, entry)
      return entry.value
    end,

    define_preview = function(self, entry, _)
      local win_width = vim.api.nvim_win_get_width(self.state.winid)
      local actual_entry = getManCommand(entry[1])
      putils.job_maker({ "man", actual_entry[2], actual_entry[1] }, self.state.bufnr, {
        env = { ["PAGER"] = pager, ["MANWIDTH"] = win_width },
        value = entry.value,
        bufname = self.state.bufname,
      })
      putils.regex_highlighter(self.state.bufnr, "man")
    end,
  })
end

local function man()
  local opts = {}
  pickers.new({
    results_title = "Resources",
    finder = finders.new_oneshot_job({ "man", "-k", "." }),
    sorter = conf.generic_sorter(opts),
    previewer = get_man_previewer(opts),
    attach_mappings = function(prompt_bufnr)
      action_set.select:replace(function(_, cmd)
        local selection = action_state.get_selected_entry()
        local args = getManCommand(selection[1])

        actions.close(prompt_bufnr)
        if cmd == "default" or cmd == "horizontal" then
          vim.cmd("Man " .. args[2] .. " " .. args[1])
        elseif cmd == "vertical" then
          vim.cmd("vert bo Man " .. args[2] .. " " .. args[1])
        elseif cmd == "tab" then
          vim.cmd("tab Man " .. args[2] .. " " .. args[1])
        end
      end)

      return true
    end,
  }):find()
end

local function colorscheme()
  local opts = {}
  local colors = vim.list_extend(opts.colors or {}, vim.fn.getcompletion("", "color"))
  pickers.new(opts, {
    prompt = "Change Colorscheme",
    finder = finders.new_table({
      results = colors,
    }),
    layout_config = {
      width = 0.3,
      height = 0.4,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()

        actions.close(prompt_bufnr)
        require("rd.colors").colorscheme(selection.value)
      end)

      return true
    end,
  }):find()
end

return {
  colorscheme = colorscheme,
  man = man,
}
