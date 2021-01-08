local function command(key, value)
    vim.cmd(string.format('command %s %s', key, value))
end
command([[W]], [[:execute ':silent w !sudo tee % > /dev/null' | :edit!]])
command([[So]], [[:execute ':luafile $HOME/.config/nvim/lua/vim_plug.lua']])
command([[Col]], [[:execute 'echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")']])
command([[LspReload]], [[lua require'lsp_config'.lsp_reload(0)]])
command([[LspStop]], [[lua require'lsp_config'.lsp_stop(0)]])
command([[LspClearDiagnostics]], [[lua vim.lsp.diagnostic.clear(0)]])
command([[LspPrint]], [[lua print(vim.inspect(vim.lsp.buf_get_clients()))]])

return {
    command = command
}
