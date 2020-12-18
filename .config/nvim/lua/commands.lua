local function command(key, value)
    vim.cmd(string.format('command %s %s', key, value))
end
command([[W]], [[:execute ':silent w !sudo tee % > /dev/null' | :edit!]])
command([[So]], [[:execute ':so $HOME/.config/nvim/init.lua' | :edit!]])
command([[Col]], [[:execute 'echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")']])

return {
    command = command
}
