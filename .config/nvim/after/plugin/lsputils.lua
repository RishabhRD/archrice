local codeAction = require'lsputil.codeAction'
local location = require'lsputil.locations'
local symbols = require'lsputil.symbols'
vim.g.lsp_utils_location_opts = {
  height = 24,
  mode = 'editor',
  list = {
    border = true,
    numbering = true
  },
  preview = {
    title = 'Location Preview',
    border = true,
  },
  prompt = {}
}


vim.g.lsp_utils_symbols_opts = {
  height = 24,
  mode = 'editor',
  list = {
    border = true,
    numbering = false,
  },
  preview = {
    title = 'Symbols Preview',
    border = true,
  },
  prompt = {}
}

vim.lsp.handlers['textDocument/codeAction'] = codeAction.code_action_handler
vim.lsp.handlers['textDocument/references'] = location.references_handler
vim.lsp.handlers['textDocument/definition'] = location.definition_handler
vim.lsp.handlers['textDocument/declaration'] = location.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = location.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = location.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = symbols.document_handler
vim.lsp.handlers['workspace/symbol'] = symbols.workspace_handler
