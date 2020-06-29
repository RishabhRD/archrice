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

let t:is_listed=0
function! Toggle_list()
	if t:is_listed == 0
		set list
		let t:is_listed = 1
	else
		set nolist
		let t:is_listed = 0
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


if &term =~ "xterm\\|rxvt\\|st"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif



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
tnoremap <C-w> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>
" ctags mappings
nmap gd <C-]>
nmap gb <C-T>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>en :lnext<CR>
map <leader>ep :lprevious<CR>
map <leader>sf :set foldmethod=syntax<CR>

map <leader>tr :call Toggle_transparent()<CR>
map <leader>lc :call Toggle_list()<CR>
