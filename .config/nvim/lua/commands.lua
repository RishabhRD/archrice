local function command(key, value)
    vim.cmd(string.format('command %s %s', key, value))
end
command([[W]], [[:execute ':silent w !sudo tee % > /dev/null' | :edit!]])
command([[So]], [[:execute ':luafile $HOME/.config/nvim/init.lua']])
command([[Col]], [[:execute 'echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")']])

return {
    command = command
}
