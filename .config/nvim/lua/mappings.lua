local function nmap(command, value, expr)
    vim.api.nvim_set_keymap('n',command,value,{noremap = true, silent = true, expr = expr})
end

local function imap(command, value, expr)
    vim.api.nvim_set_keymap('i',command,value,{noremap = true, silent = true, expr = expr})
end

local function vmap(command, value, expr)
    vim.api.nvim_set_keymap('v',command,value,{noremap = true, silent = true, expr = expr})
end

local function tmap(command, value, expr)
    vim.api.nvim_set_keymap('t',command,value,{noremap = true, silent = true, expr = expr})
end

nmap('<A-L>', ':tabnext<CR>')
nmap('<A-H>', ':tabprevious<CR>')
nmap('<C-w>m', ':MaximizerToggle<CR>')
nmap('<leader>r', ':set hlsearch!<CR>')
nmap('<leader>un', ':UndotreeToggle<Cr>')
nmap('Q', ':q!<CR>')
imap('<C-b>', '<C-x><C-f>')
vmap('cp', '"+y')
nmap('cp', '"+y')
nmap('cpp', '"+yy')
vmap('zp', '"+p')
vmap('zP', '"+P')
nmap('zp', '"+p')
nmap('zP', '"+P')
vmap('<leader>p', '"_dP')
tmap(',,', [[<C-\><C-n>]])
nmap([[<C-h>]], [[:wincmd h<CR>]])
nmap([[<C-j>]], [[:wincmd j<CR>]])
nmap([[<C-k>]], [[:wincmd k<CR>]])
nmap([[<C-l>]], [[:wincmd l<CR>]])
nmap([[<a-.>]], [[<cmd>vertical resize +3<CR>]])
nmap([[<a-,>]], [[<cmd>vertical resize -3<CR>]])
nmap([[<a-=>]], [[<cmd>resize +3<CR>]])
nmap([[<a-->]], [[<cmd>resize -3<CR>]])
nmap('<leader>fd', ':Ex<CR>')
nmap('<leader>sC', [[:CheatWithoutComments<CR>]])
nmap('<leader>sc', [[:Cheat<CR>]])
imap('<C-Space>', [[compe#complete()]], true)
imap('<CR>', [[compe#confirm('<CR>')]], true)
imap('<C-e>',[[compe#close('<C-e>')]], true)
vmap('<C-r>', '"hy:%s/<C-r>h/')
nmap('<leader>j', [[:lua require("harpoon.ui").nav_file(1)<CR>]])
nmap('<leader>k', [[:lua require("harpoon.ui").nav_file(2)<CR>]])
nmap('<leader>l', [[:lua require("harpoon.ui").nav_file(3)<CR>]])
nmap('<leader>;', [[:lua require("harpoon.ui").nav_file(4)<CR>]])
nmap('<leader>sj',[[:lua require("harpoon.term").gotoTerminal(1)<CR>]])
nmap('<leader>sk',[[:lua require("harpoon.term").gotoTerminal(2)<CR>]])
nmap('<leader>sl',[[:lua require("harpoon.term").gotoTerminal(3)<CR>]])
nmap('<leader>s;',[[:lua require("harpoon.term").gotoTerminal(4)<CR>]])
nmap('<leader>p', [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]])
nmap('mh', [[:lua require("harpoon.mark").add_file()<CR>]])

-- TODO: Write it properly. I just got lazy and just copy pasted it. And did
-- least required adjustment
-- vim.cmd[[imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
-- vim.cmd[[smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
vim.cmd[[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
vim.cmd[[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
vim.cmd[[imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
vim.cmd[[smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
vim.cmd[[imap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]
vim.cmd[[smap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]


return {
    nmap = nmap,
    imap = imap,
    vmap = vmap,
    tmap = tmap,
}
