" nnoremap <Leader>] <cmd>lua require'finder'.git_files{preview_disabled = true}<CR>
" nnoremap <leader>p <cmd>lua require'finder'.files{}<CR>
" nnoremap <leader>; <cmd>lua require'finder'.files{ cwd = '/home/rishabh/.config/nvim', preview_disabled = true, height = 20}<CR>
" nnoremap <leader>bl <cmd>lua require'finder'.fuzzy_grep{}<CR>
" nnoremap <leader>bb <cmd>lua require'finder'.buffers()<CR>
" nnoremap <leader>bL <cmd>lua require'finder'.grep()<CR>
" nnoremap <A-y> <cmd>lua require'finder'.help_tags({height = 30})<CR>
" nnoremap <C-y> <cmd>lua require'finder'.colorschemes({height = 30})<CR>
"
nnoremap <leader>p <cmd>Files<cr>
nnoremap <leader>bl <cmd>Rg<cr>
nnoremap <leader>bb <cmd>Buffers<cr>
nnoremap <C-y> <cmd>Colors<cr>
nnoremap <A-y> <cmd>Helptags<cr>
