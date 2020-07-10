" Functions
" function! GetFileName()
" 	let fname = system("printf '' | dmenu -p 'Enter file name'")
" 	return fname
" endfunction

" function! Rename(file)
" 	let name = GetFileName()
" 	if empty(name)
" 		return
" 	endif
" 	execute \"saveas " . name
" 	execute \"bdelete " . a:file
" 	let e = system("rm " . a:file)
" endfunction

let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
	let t:is_transparent = 1
    else
        set background=dark
	let t:is_transparent = 0
    endif
endfunction


" Basic Settings
let mapleader =" "
syntax on
set showtabline=2
set nocompatible
filetype indent on
set relativenumber
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
set completeopt-=preview
let g:usemarks=0
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
se mouse+=a
set tabstop=4
set shiftwidth=4
set splitbelow
set splitright
filetype plugin on
set number
set incsearch
set autoread
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let g:lf_replace_netrw = 1
let g:rainbow_active = 1
set listchars=tab:>-,trail:~,extends:>,precedes:<
set inccommand=nosplit
    set undofile

" Settings for specific files
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %
autocmd BufWritePost sxhkdrc !pkill sxhkd;nohup sxhkd & 2> /dev/null -load %


" Clipboard bindings

vmap cp "+y
nnoremap cp "+y
nnoremap zp "+p
nnoremap zP "+P
nnoremap cpp "+yy


" Other bindings
noremap <leader>z :source $HOME/.config/nvim/init.vim<Enter>
nnoremap <leader>r :noh<CR>
map <leader>c :w! \| !clear && compiler <c-r>%<CR>
map <leader>p :!clear && printVim <c-r>%<CR><CR>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
tnoremap <C-w> <C-\><C-n>
" ctags mappings
nmap gd <C-]>
nmap gb <C-T>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>sf :set foldmethod=syntax<CR>
map Q :q!<CR>

map <leader>acl :set list!<CR>
tnoremap ,, <C-\><C-n>
nnoremap <leader>un :UndotreeToggle<cr>
