local function command(key, value)
    vim.cmd(string.format('command %s %s', key, value))
end
command([[W]], [[:execute ':silent w !sudo tee % > /dev/null' | :edit!]])
command([[So]], [[:execute ':luafile $HOME/.config/nvim/init.lua']])
command([[Col]], [[:execute 'echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")']])
command([[LspReload]], [[lua require'lsp_config'.lsp_reload()]])
command([[LspStop]], [[lua require'lsp_config'.lsp_stop()]])
command([[LspClearDiagnostics]], [[lua vim.lsp.diagnostics.clear()]])

return {
    command = command
}
