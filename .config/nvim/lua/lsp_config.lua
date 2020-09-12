function organize_imports(timeout_ms)
	local context = { source = { organizeImports = true } }
	vim.validate { context = { context, 't', true } }
	local params = vim.lsp.util.make_range_params()
	params.context = context

	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
	if not result then return end
	result = result[1].result
	if not result then return end
	edit = result[1].edit
	vim.lsp.util.apply_workspace_edit(edit)
end

function quickfix(timeout_ms)
	local context = { source = { quickfix = true } }
	vim.validate { context = { context, 't', true } }
	local params = vim.lsp.util.make_range_params()
	params.context = context

	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
	if not result then return end
	result = result[1].result
	if not result then return end
	edit = result[1].edit
	vim.lsp.util.apply_workspace_edit(edit)
end

local on_attach_vim = function(client)
	require'completion'.on_attach(client)
end

require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
