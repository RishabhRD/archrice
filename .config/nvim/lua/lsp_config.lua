local lsp = require'nvim_lsp'

local popup_buffer = {}

Reference_handler = function()
	local params = vim.lsp.util.make_position_params()
	params.context = { includeDeclaration = true }

	local results_lsp = vim.lsp.buf_request_sync(0,'textDocument/references',params,1000)
	local locations = {}
	for _, server_results in pairs(results_lsp) do
		vim.list_extend(locations,vim.lsp.util.locations_to_items(server_results.result) or {})
	end

	if vim.tbl_isempty(locations) then
		print("no references found.")
		return
	end

	vim.lsp.util.set_qflist(locations)
	vim.api.nvim_command("copen")
	vim.api.nvim_command("wincmd p")
end

local popup_closed = function(buffer,line,selected)
	if selected then
		local actions = popup_buffer[buffer]
		local action = actions[line]
		if action.edit or type(action.command) == "table" then
			if action.edit then
				vim.lsp.util.apply_workspace_edit(action.edit)
			end
			if type(action.command) == "table" then
				vim.lsp.buf.execute_command(action.command)
			end
		else
			vim.lsp.buf.execute_command(action)
		end
	end
	popup_buffer[buffer] = nil
end

local code_action_handler = function(_,_,actions)
	if actions == nil or vim.tbl_isempty(actions) then
		print("No code actions available")
		return
	end
	local data = {}
	for i, action in ipairs(actions) do
		local title = action.title:gsub('\r\n', '\\r\\n')
		title = title:gsub('\n','\\n')
		data[i] = title
	end
	local buf = require'popfix'.popup_window(data,popup_closed)
	popup_buffer[buf] = actions
end

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
	map('n','gr','<cmd>lua require\'lsp_config\'Reference_handler()<CR><cmd>wincmd p<CR>')
	map('n','<leader>i','<cmd>lua require\'lsp_config\'.Organize_imports()')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','<leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>as','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	-- if diagnostic plugin is installed
	map('n','<leader>ep','<cmd>PrevDiagnostic<CR>')
	map('n','<leader>en','<cmd>NextDiagnostic<CR>')
	map('n','<leader>eP','<cmd>PrevDiagnosticCycle<CR>')
	map('n','<leader>eN','<cmd>NextDiagnosticCycle<CR>')
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

vim.lsp.callbacks['textDocument/codeAction'] = code_action_handler

local strategy = {}
strategy[1] = 'exact'
strategy[2] = 'substring'
strategy[3] = 'fuzzy'
vim.g.completion_matching_strategy_list = strategy
vim.g.diagnostic_enable_virtual_text = 1
vim.g.space_before_virtual_text = 5
