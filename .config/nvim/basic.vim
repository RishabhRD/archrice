map <Space> <NOP>
let mapleader =" "
set completeopt=menuone,noselect,longest
syntax on
set autoread
set tabstop=4 softtabstop=4 shiftwidth=4
set number relativenumber
set incsearch
set inccommand=split
set autoread undofile hidden
set shortmess+=c
set smartcase smartindent ignorecase
set noswapfile noshowmode nobackup
set splitbelow splitright
set colorcolumn=80
set wrap
" let g:netrw_banner = 0
" let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %
au FileType LuaTree set cursorline

" Navigate and resize windows easily
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <a-.> <cmd>vertical resize +3<CR>
nnoremap <a-,> <cmd>vertical resize -3<CR>
nnoremap <a-=> <cmd>resize +3<CR>
nnoremap <a--> <cmd>resize -3<CR>

" Navigate through terminal windows easily
tnoremap <C-h> <cmd>wincmd h<CR>
tnoremap <C-j> <cmd>wincmd j<CR>
tnoremap <C-k> <cmd>wincmd k<CR>
tnoremap <C-l> <cmd>wincmd l<CR>
tnoremap ,, <C-\><C-n>

nnoremap <leader>t :call TermToggle(15)<CR>

vmap <leader>p "_dP

" Clipboard operation easy
vmap cp "+y
nnoremap cp "+y
nnoremap cpp "+yy
nnoremap zp "+p
nnoremap zP "+P
vnoremap zp "+p
vnoremap zP "+P

nnoremap <leader><leader>r :ColorizerReloadAllBuffers<CR>
nnoremap <leader><leader>t :ColorizerToggle<CR>
map <C-c> :w! \| !clear && compiler <c-r>%<CR>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Dot :execute ':!dotInstall'
command So :execute ':so $HOME/.config/nvim/init.vim' | :edit!
command Col :execute 'echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")'
nnoremap <leader>un :UndotreeToggle<cr>
map Q :q!<CR>
map <leader>acl :set list!<CR>

map <leader>r <cmd>set hlsearch<CR>
nnoremap <leader>lc :<up>


" Nightly build
augroup highlight_yank
	autocmd!
	autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup cursor_moved
	autocmd!
	autocmd CursorMoved,CursorMovedI * set nohlsearch
augroup END

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

" nvim-tree
nnoremap <leader>f :LuaTreeToggle<CR>
let g:lua_tree_width = 40
let g:lua_tree_follow = 1
let g:lua_tree_git_hl = 1
let g:lua_tree_indent_markers = 1 

nnoremap <A-L> :tabnext<CR>
nnoremap <A-H> :tabprevious<CR>
nnoremap <C-w>m :MaximizerToggle<CR>
