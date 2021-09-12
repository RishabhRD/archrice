local lsp = require("lspconfig")

-- Utility servers
local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
end

-- nvim-cmp completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- configuring diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

local custom_attach = function(_)
  map("n", "<leader>R", "<cmd>LspRestart<CR>")
  map("n", "gr", "<cmd>Telescope lsp_references<CR>")
  map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  map("n", "gD", "<cmd>Telescope lsp_declarations<CR>")
  map("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
  map("n", "gw", "<cmd>Telescope lsp_document_symbols<CR>")
  map("n", "gW", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
  map("n", "gq", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
  map("n", "<leader>ad", "<cmd>Telescope lsp_document_diagnostics<CR>")
  map("n", "<leader>aD", "<cmd>Telescope lsp_workspace_diagnostics<CR>")
  map("v", "af", "<cmd>Telescope lsp_range_code_actions<CR>")
  -- GOTO mappings
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- ACTION mappings
  map("n", "<leader>ah", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "<leader>af", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- Few language severs support these three
  map("n", "<leader>aI", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
  map("n", "<leader>aO", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")
  -- Diagnostics mapping
  map("n", "<leader>ee", [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]])
  map("n", "<leader>ec", [[<cmd>lua vim.lsp.diagnostic.show_position_diagnostics()<CR>]])
  map("n", "<leader>en", [[m'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]])
  map("n", "<leader>ep", [[m'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]])
end

local servers = {
  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--completion-style=detailed",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
    init_options = {
      fallbackFlags = { "-std=c++2a" },
    },
    on_attach = function()
      map("n", "<leader>sH", "<cmd>ClangdSwitchSourceHeader<CR>")
    end,
  },
  sumneko_lua = {
    cmd = { "/usr/bin/lua-language-server" },
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { "vim" },
        },
      },
    },
  },

  -- ccls = {},
  vimls = {},
  tsserver = {},
  html = {},
  cssls = {},
  texlab = {
    settings = {
      texlab = {
        build = {
          onSave = true,
        },
      },
    },
  },
}

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local function setup_server(server, config)
  if not config then
    return
  end
  if type(config) ~= "table" then
    config = {}
  end
  if config.on_attach then
    local func = config.on_attach
    config.on_attach = function()
      func()
      custom_attach()
    end
  else
    config.on_attach = custom_attach
  end
  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)
  lsp[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end
