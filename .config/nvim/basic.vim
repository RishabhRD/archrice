map <Space> <NOP>
let mapleader =" "
set completeopt=menuone,noselect,longest,noinsert
syntax enable
filetype indent on
set autoread
set softtabstop=4 shiftwidth=4
set number relativenumber
set nohlsearch incsearch
set inccommand=split
set autoread undofile hidden
set shortmess+=c
set smartcase ignorecase
set noswapfile noshowmode nobackup
set splitbelow splitright
" set colorcolumn=80
set wrap
set cindent autoindent
set fo+=t	
set fo+=c	
set fo+=r	
set fo-=o	
set fo+=q	
set fo-=a	
set fo+=n	
set fo-=2	
set fo+=j	
set nojoinspaces
set mouse=nc


let g:netrw_banner = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
nnoremap <leader>f :Ex<CR>

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
imap <C-b> <C-x><C-f>
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command So :execute ':so $HOME/.config/nvim/init.vim' | :edit!
command Col :execute 'echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")'
nnoremap <leader>un :UndotreeToggle<cr>
map Q :q!<CR>

map <leader>r <cmd>set hlsearch!<CR>
nnoremap <leader>lc :<up>

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
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

let g:tex_flavor = "latex"
augroup xresources
  autocmd!
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %
augroup END
nnoremap <A-L> :tabnext<CR>
nnoremap <A-H> :tabprevious<CR>
nnoremap <C-w>m :MaximizerToggle<CR>
