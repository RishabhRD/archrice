nnoremap q: <nop>
nnoremap <silent> <A-L> :tabnext<CR>
nnoremap <silent> <A-H> :tabprevious<CR>
nnoremap <silent> <leader>r :set hlsearch!<CR>
nnoremap <silent> <leader>un :UndotreeToggle<CR>
nnoremap Q <nop>

vnoremap <silent> cp "+y
nnoremap <silent> cp "+y
nnoremap <silent> cpp "+yy
vnoremap <silent> zp "+p
vnoremap <silent> zP "+P
nnoremap <silent> zp "+p
nnoremap <silent> zP "+P
vnoremap <silent> <leader>p "_dP

tnoremap <silent> ,, <C-\><C-n>

nnoremap <silent> <A-l> :vertical resize +3<CR>
nnoremap <silent> <A-h> :vertical resize -3<CR>
nnoremap <silent> <A-k> :resize +3<CR>
nnoremap <silent> <A-j> :resize -3<CR>

nnoremap <silent> <leader>fd :Ex<CR>
nnoremap <silent> <leader>sC :CheatWithoutComments<CR>
nnoremap <silent> <leader>sc :Cheat<CR>

vnoremap <silent> <C-r> "hy:%s/<C-r>h/

nnoremap <silent><expr> k (v:count >= 3 ? "m'" . v:count : "") . 'k'
nnoremap <silent><expr> j (v:count >= 3 ? "m'" . v:count : "") . 'j'

nnoremap <silent> <leader>t :lua require'rd.colors'.toggle_transparency()<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
