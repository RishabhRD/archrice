local lsp = require'nvim_lsp'

local on_attach_vim = function(client)
	require'completion'.on_attach(client)
end

lsp.tsserver.setup{on_attach=on_attach_vim}

lsp.sumneko_lua.setup{
	on_attach=on_attach_vim,
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
	on_attach = on_attach_vim
}
