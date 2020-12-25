local lsp = require'lspconfig'

-- Utility servers
local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end



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
	map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')
	-- Few language severs support these three
	map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
	-- Diagnostics mapping
	map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
	map('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	map('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

end
local on_attach_clangd = function(client)
	map('n', '<leader>sh', '<cmd>ClangdSwitchSourceHeader<CR>')
	on_attach_common(client)
end
lsp.clangd.setup{
	on_attach = on_attach_clangd
}
lsp.tsserver.setup{on_attach=on_attach_common}
lsp.gopls.setup{on_attach=on_attach_common}
lsp.pyls.setup{
	on_attach = on_attach_common,
}
lsp.sumneko_lua.setup({
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





-- nvim-lsputils configuration
vim.g.lsp_utils_location_opts = {
	height = 24,
	mode = 'split',
	list = {
		border = true,
		numbering = true
	},
	preview = {
		title = 'Location Preview',
		border = true,
	},
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
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler






-- completion-nvim configuration
local strategy = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_matching_strategy_list = strategy
vim.g.diagnostic_enable_virtual_text = 1
vim.g.completion_matching_ignore_case = 0
vim.g.completion_chain_complete_list = {
	{ complete_items = { 'lsp' } },
	{ complete_items = { 'buffer', 'snippet' } },
}
vim.cmd('imap  <c-j> <Plug>(completion_next_source)')
vim.cmd('imap  <c-k> <Plug>(completion_prev_source)')
vim.cmd('autocmd BufEnter * lua require\'completion\'.on_attach()')

local function lsp_reload()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
    vim.cmd("edit")
end

local function lsp_stop()
    vim.lsp.diagnostic.clear()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
end

return{
    lsp_reload = lsp_reload,
    lsp_stop = lsp_stop
}
