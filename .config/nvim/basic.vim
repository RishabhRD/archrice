map <Space> <NOP>
let mapleader =" "
syntax on
set colorcolumn=80
set noswapfile
set tabstop=4 shiftwidth=4
set number relativenumber
set nohlsearch incsearch
set autoread
set undofile
set hidden
set updatetime=50
set nobackup
set nowrap
set shortmess+=c
set smartcase
set termguicolors
set smartindent
set inccommand=nosplit
set noshowmode
let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %

vmap cp "+y
nnoremap cp "+y
nnoremap cpp "+yy
nnoremap zp "+p
nnoremap zP "+P
map <C-c> :w! \| !clear && compiler <c-r>%<CR>
map <C-p> :!clear && printVim <c-r>%<CR><CR>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
tnoremap <C-w> <C-\><C-n>
tnoremap ,, <C-\><C-n>
nnoremap <leader>un :UndotreeToggle<cr>
nmap gD <C-]>
nmap gB <C-T>
map Q :q!<CR>
map <leader>acl :set list!<CR>
nmap <leader>f :Vex<CR>
nmap <leader>ef :Ex<CR>
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>k <C-w>k
map <leader>j <C-w>j
map <C-h> :vertical resize -3<CR>
map <C-l> :vertical resize +3 <CR>
map <C-k> :resize +3<CR>
map <C-j> :resize -3<CR>

" Nightly build
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
