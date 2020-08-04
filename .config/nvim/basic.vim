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
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %



let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
vmap cp "+y
nnoremap cp "+y
nnoremap cpp "+yy
nnoremap zp "+p
nnoremap zP "+P


map <leader>c :w! \| !clear && compiler <c-r>%<CR>
map <C-p> :!clear && printVim <c-r>%<CR><CR>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
tnoremap <C-w> <C-\><C-n>
nnoremap <leader>un :UndotreeToggle<cr>
nmap gD <C-]>
nmap gb <C-T>
map Q :q!<CR>
map <leader>acl :set list!<CR>
nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

tnoremap ,, <C-\><C-n>
function! Toggle_transparent()
    if g:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
	let g:is_transparent = 1
    else
        set background=dark
	let g:is_transparent = 0
    endif
endfunction
