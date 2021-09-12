lua require'rd.telescope'.apply_config()

nnoremap <silent> <leader>ff :Telescope find_files<CR>
nnoremap <silent> <leader>fl :Rg<CR>
nnoremap <silent> <leader>fL :Telescope live_grep<CR>
nnoremap <silent> <leader>fk :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <leader>fb :Telescope buffers<CR>
nnoremap <silent> <leader>fT :Telescope builtin<CR>
nnoremap <silent> <leader>fo :Telescope file_browser<CR>
nnoremap <silent> <leader>fm :lua require'rd.telescope_custom'.man()<CR>
nnoremap <silent> <C-y> :lua require'rd.telescope_custom'.colorscheme()<CR>
nnoremap <silent> <A-y> :Telescope help_tags<CR>
nnoremap <silent> <leader>ft :TodoTelescope<CR>
nnoremap <silent> <leader>gb :Telescope git_branches<CR>
