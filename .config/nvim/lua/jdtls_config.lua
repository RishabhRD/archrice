local M = {}
function M.setup()
  -- vim.cmd[[set softtabstop=4]]
  -- vim.cmd[[set shiftwidth=4]]
  -- vim.cmd[[set noexpandtab]]
  require('jdtls').start_or_attach({cmd = {'launch_jdtls'}})
  -- Utility servers
  local map = function(type, key, value)
    vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
  end
  -- GOTO mappings
  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- ACTION mappings
  map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','<leader>af', '<cmd>lua require"jdtls".code_action()<CR>')
  map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
  map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
  map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n','<leader>en', [[<cmd>lua require'lsp_config'.next_diagnostic()<CR>]])
  map('n','<leader>ep', [[<cmd>lua require'lsp_config'.prev_diagnostic()<CR>]])

  map('n', [[<leader>ai]], [[<Cmd>lua require'jdtls'.organize_imports()<CR>]])
  map('n', [[<leader>av]], [[<Cmd>lua require('jdtls').extract_variable()<CR>]])
  map('v', [[<leader>av]], [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]])
  map('v', [[<leader>am]], [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]])
  map('n', [[<leader>aR]], [[<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>]])

  local jdtls_ui = require'jdtls.ui'
  function jdtls_ui.pick_one_async(items, _, _, cb)
    require'lsputil.codeAction'.code_action_handler(nil, nil, items, nil, nil, nil, cb)
  end
  vim.cmd[[command! -buffer JdtCompile lua require('jdtls').compile()]]
  vim.cmd[[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]]
  vim.cmd[[command! -buffer JdtJol lua require('jdtls').jol()]]
  vim.cmd[[command! -buffer JdtBytecode lua require('jdtls').javap()]]
  vim.cmd[[command! -buffer JdtJshell lua require('jdtls').jshell()]]
end

return M
