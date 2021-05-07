local telescope = require'telescope_config'
local lsp = require'lspconfig'

-- Utility servers
local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

-- For snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true



-- configuring diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
}
)


-- configuring LSP servers
local on_attach_common = function(_)
  print("LSP started.");
  local cfg = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 0, -- only show one line of comment set to 0 if you do not want API comments be shown

    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ",  -- Panda for parameter
    hint_scheme = "String",

    handler_opts = {
      border = "none"   -- double, single, shadow, none
    },
    decorator = {"`", "`"}  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help

  }
  require'lsp_signature'.on_attach(cfg)

  telescope.do_lsp_mappings()
  -- GOTO mappings
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  -- ACTION mappings
  map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
  map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>aI',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n','<leader>aO',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
  map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n','<leader>en', [[<cmd>lua require'lsp_config'.next_diagnostic()<CR>]])
  map('n','<leader>ep', [[<cmd>lua require'lsp_config'.prev_diagnostic()<CR>]])

end
local on_attach_clangd = function(client)
  map('n', '<leader>sh', '<cmd>ClangdSwitchSourceHeader<CR>')
  on_attach_common(client)
end
lsp.clangd.setup{
  on_attach = on_attach_clangd,
  cmd = { "clangd", "--background-index", "--completion-style=detailed"},
}
lsp.tsserver.setup{on_attach=on_attach_common}
lsp.html.setup{
  on_attach=on_attach_common,
  capabilities = capabilities,
}
lsp.cssls.setup{
  on_attach=on_attach_common,
  capabilities = capabilities,
}
lsp.gopls.setup{on_attach=on_attach_common}
lsp.pyls.setup{
  on_attach = on_attach_common,
}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
lsp.sumneko_lua.setup({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    }
  },

  on_attach = on_attach_common
})

lsp.texlab.setup{
  on_attach = on_attach_common,
  settings = {
    latex = {
      build = {
        onSave = true;
      }
    }
  }
}

require'lspconfig'.gopls.setup{
  on_attach = on_attach_common,
}


local function lsp_reload(buffer)
  vim.lsp.stop_client(vim.lsp.get_active_clients(buffer))
  vim.cmd("edit")
end

local function lsp_stop(buffer)
  vim.lsp.diagnostic.clear(buffer)
  vim.lsp.stop_client(vim.lsp.get_active_clients(buffer))
end

local function get_pos_from_diag(diag)
  return {diag.range.start.line + 1, diag.range.start.character}
end

local function is_high(pos1, pos2)
  if pos1[1] > pos2[1] then
    return true
  end
  if pos1[1] == pos2[1] then
    if pos1[2] > pos2[2] then
      return true
    end
  end
  return false
end

local function is_less(pos1, pos2)
  if pos1[1] < pos2[1] then
    return true
  end
  if pos1[1] == pos2[1] then
    if pos1[2] < pos2[2] then
      return true
    end
  end
  return false
end

local function get_next_index(list)
  if #list == 0 then
    return
  end
  local current_pos = vim.api.nvim_win_get_cursor(0)
  for cur_index, value in ipairs(list) do
    local diag_pos = get_pos_from_diag(value)
    if is_high(diag_pos, current_pos) then
      return cur_index
    end
  end
  return 1
end

local function get_prev_index(list)
  if #list == 0 then
    return
  end
  local current_pos = vim.api.nvim_win_get_cursor(0)
  for cur_index, value in ipairs(list) do
    local diag_pos = get_pos_from_diag(value)
    if is_less(diag_pos, current_pos) then
      return cur_index
    end
  end
  return 1
end

local function reverse(tbl)
  for i=1, math.floor(#tbl / 2) do
    local tmp = tbl[i]
    tbl[i] = tbl[#tbl - i + 1]
    tbl[#tbl - i + 1] = tmp
  end
end

local function next_diagnostic()
  local diagnostic_list = vim.lsp.diagnostic.get(0)
  local next_index = get_next_index(diagnostic_list)
  if next_index == nil then
    return
  end
  vim.api.nvim_win_set_cursor(0, get_pos_from_diag(diagnostic_list[next_index]))
end

local function prev_diagnostic()
  local diagnostic_list = vim.lsp.diagnostic.get(0)
  reverse(diagnostic_list)
  local next_index = get_prev_index(diagnostic_list)
  if next_index == nil then
    return
  end
  vim.api.nvim_win_set_cursor(0, get_pos_from_diag(diagnostic_list[next_index]))
end

return{
  lsp_reload = lsp_reload,
  lsp_stop = lsp_stop,
  next_diagnostic = next_diagnostic,
  prev_diagnostic =prev_diagnostic,
}

