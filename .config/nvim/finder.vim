nnoremap <Leader>] <cmd>lua require'finder'.git_files{preview_disabled = true,sorter = require'popfix.sorter':new_fzy_native_sorter()}<CR>
nnoremap <leader>p <cmd>lua require'finder'.files{sorter = require'popfix.sorter':new_fzy_native_sorter()}<CR>
nnoremap <leader>; <cmd>lua require'finder'.files{ cwd = '/home/rishabh/.config/nvim', preview_disabled = true, height = 20}<CR>
nnoremap <leader>bl <cmd>lua require'finder'.fuzzy_grep{sorter = require'popfix.sorter':new_fzy_native_sorter()}<CR>
nnoremap <leader>bb <cmd>lua require'finder'.buffers()<CR>
nnoremap <leader>bL <cmd>lua require'finder'.grep()<CR>
nnoremap <A-y> <cmd>lua require'finder'.help_tags({sorter = require'popfix.sorter':new_fzy_native_sorter(),height = 30})<CR>
nnoremap <C-y> <cmd>lua require'finder'.colorschemes({sorter = require'popfix.sorter':new_fzy_native_sorter(),height = 30})<CR>
