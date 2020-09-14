local lsp = require'nvim_lsp'

local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local on_attach_common = function(client)
	print("LSP started.");
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)

	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR><cmd>wincmd p<CR>')
	map('n','<C-k>','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','<leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>as','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	-- if diagnostic plugin is installed
	map('n','<leader>dp','<cmd>PrevDiagnostic<CR>')
	map('n','<leader>dn','<cmd>NextDiagnostic<CR>')
	map('n','<leader>dP','<cmd>PrevDiagnosticCycle<CR>')
	map('n','<leader>dN','<cmd>NextDiagnosticCycle<CR>')
	map('n','<leader>dd', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
end

local custom_attach = function(client)
	on_attach_common(client)
	map('n','<leader>i', '<cmd>lua vim.lsp.buf.code_action({ source = { organizeImports = true } })<CR>')
end

lsp.tsserver.setup{on_attach=custom_attach}

lsp.sumneko_lua.setup{
	on_attach=on_attach_common,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
			completion = { keywordSnippet = "Disable", },
			diagnostics = { enable = true, globals = {
				"vim", "describe", "it", "before_each", "after_each","vim.lsp.buf" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("~/git/neovim/src/nvim/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				}
			}
		}
	}
}

lsp.jdtls.setup{
	on_attach = custom_attach,
}

local strategy = {}
strategy[1] = 'exact'
strategy[2] = 'substring'
strategy[3] = 'fuzzy'
vim.g.completion_matching_strategy_list = strategy
