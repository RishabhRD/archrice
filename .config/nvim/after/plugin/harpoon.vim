nnoremap <silent> <leader>j :lua require("harpoon.ui").nav_file(1)<CR>zzzv
nnoremap <silent> <leader>k :lua require("harpoon.ui").nav_file(2)<CR>zzzv
nnoremap <silent> <leader>l :lua require("harpoon.ui").nav_file(3)<CR>zzzv
nnoremap <silent> <leader>; :lua require("harpoon.ui").nav_file(4)<CR>zzzv
nnoremap <silent> <leader>sj :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent> <leader>sk :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent> <leader>sl :lua require("harpoon.term").gotoTerminal(3)<CR>
nnoremap <silent> <leader>s; :lua require("harpoon.term").gotoTerminal(4)<CR>
nnoremap <silent> <leader>p :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <leader>aj :lua require("harpoon.term").sendCommand(4, 1)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>
nnoremap <silent> <leader>ak :lua require("harpoon.term").sendCommand(4, 2)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>
nnoremap <silent> <leader>al :lua require("harpoon.term").sendCommand(4, 3)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>
nnoremap <silent> <leader>a; :lua require("harpoon.term").sendCommand(4, 4)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>
nnoremap <silent> <C-p> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
nnoremap <silent> mh :lua require("harpoon.mark").add_file()<CR>
