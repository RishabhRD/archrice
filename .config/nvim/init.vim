let mapleader =","
syntax on
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'francoiscabrol/ranger.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
call plug#end()
let g:ycm_global_ycm_extra_conf = '/home/rishabh/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
filetype indent on
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_global_ycm_extra_conf = '/home/rishabh/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
set relativenumber
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
set completeopt-=preview
let g:usemarks=0
se mouse+=a
set splitbelow
set splitright
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
noremap cp "+y
noremap zp "+p
noremap cpp "+YY
" set clipboard=unnamedplus
filetype plugin on
set number
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~40%' }
nnoremap <C-p> :Files<Cr>
map <leader>i :JavaImport<CR>
map <leader>v :JavaCorrect<CR>
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
noremap gn :tabe<CR>
noremap gc :tabclose<CR>
noremap <C-b> :Buffers<Cr>
noremap zb :bnext<Cr>
map <leader>w :colorscheme wal<CR>
map <leader>d :colorscheme 256-jungle<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
map <leader>c :w! \| !clear && compiler <c-r>%<CR>
map <leader>gc :w! \| !clear && ccompile <c-r>%<CR>
map <leader>p :!clear && printVim <c-r>%<CR><CR>
colorscheme wal
let g:lightline = {
  \   'colorscheme': 'deus',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': '%3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
