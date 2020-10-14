map <Space> <NOP>
let mapleader =" "
set completeopt=menuone,noselect,longest
syntax on
set colorcolumn=80
set signcolumn=yes
set tabstop=4 softtabstop=4 shiftwidth=4
set number relativenumber
set hlsearch incsearch
set inccommand=nosplit
set autoread undofile hidden
set updatetime=50
set shortmess+=c
set smartcase smartindent ignorecase
set noswapfile noshowmode nobackup nowrap
set splitbelow splitright
let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %

inoremap <C-f> <C-x><C-f>
vmap <leader>p "_dP
vmap cp "+y
nnoremap cp "+y
nnoremap cpp "+yy
nnoremap zp "+p
nnoremap zP "+P
map <C-c> :w! \| !clear && compiler <c-r>%<CR>
map <C-p> :!clear && printVim <c-r>%<CR><CR>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Dot :execute ':!dotInstall'
command So :execute ':so $HOME/.config/nvim/init.vim' | :edit!
tnoremap <C-w> <C-\><C-n>
tnoremap ,, <C-\><C-n>
nnoremap <leader>un :UndotreeToggle<cr>
map Q :q!<CR>
map <leader>acl :set list!<CR>
nmap <leader>f :Ex<CR>
nmap <leader>ef :Vex<CR>
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j
map <A-h> :vertical resize -3<CR>
map <A-l> :vertical resize +3 <CR>
map - :resize -3<CR>
map + :resize +3<CR>

" Nightly build
augroup highlight_yank
	autocmd!
	autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

autocmd CursorMoved,CursorMovedI * set nohlsearch
nnoremap <silent> n n:set hlsearch<cr>
nnoremap <silent> N n:set hlsearch<cr>


let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
	if win_gotoid(g:term_win)
		hide
	else
		botright new
		exec "resize " . a:height
		try
			exec "buffer " . g:term_buf
		catch
			call termopen($SHELL, {"detach": 0})
			let g:term_buf = bufnr("")
			set nonumber
			set norelativenumber
			set signcolumn=no
		endtry
		startinsert!
		let g:term_win = win_getid()
	endif
endfunction
nnoremap <leader>t :call TermToggle(15)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(15)<CR>


" Tabs configuration
nnoremap <A-1> <cmd>tabn 1<CR>
nnoremap <A-2> <cmd>tabn 2<CR>
nnoremap <A-3> <cmd>tabn 3<CR>
nnoremap <A-4> <cmd>tabn 4<CR>
nnoremap <A-5> <cmd>tabn 5<CR>
nnoremap <A-6> <cmd>tabn 6<CR>
nnoremap <A-7> <cmd>tabn 7<CR>
nnoremap <A-8> <cmd>tabn 8<CR>
nnoremap <A-9> <cmd>tabn 9<CR>
nnoremap <A-n> <cmd>tabprev<CR>
nnoremap <A-p> <cmd>tabprev<CR>
