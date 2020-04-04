let mapleader =","
syntax on
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'fcpg/vim-fahrenheit'

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
let g:tex_flavor = "latex"
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
noremap <leader>z :source $HOME/.config/nvim/init.vim<Enter>
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
map <leader>d :colorscheme 256-jungle<CR>
colorscheme base16-railscasts
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
hi Error guibg=NONE ctermbg=NONE guifg=red cterm=bold gui=bold
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>k <C-w>k
map <leader>j <C-w>j
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %
autocmd BufWritePost sxhkdrc !pkill sxhkd;nohup sxhkd & 2> /dev/null -load %
map <leader>c :w! \| !clear && compiler <c-r>%<CR>
map <leader>gc :w! \| !clear && ccompile <c-r>%<CR>
map <leader>p :!clear && printVim <c-r>%<CR><CR>
cmap w!! w !sudo tee > /dev/null %
let g:lightline = {
  \   'colorscheme': 'wombat',
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
set incsearch
nnoremap <A-1> :tabn 1<CR>
nnoremap <A-2> :tabn 2<CR>
nnoremap <A-3> :tabn 3<CR>
nnoremap <A-4> :tabn 4<CR>
nnoremap <A-5> :tabn 5<CR>
nnoremap <A-6> :tabn 6<CR>
nnoremap <A-7> :tabn 7<CR>
nnoremap <A-8> :tabn 8<CR>
nnoremap <A-9> :tabn 9<CR>
nnoremap <A-h> gT
nnoremap <A-l> gt
nnoremap <A-H> :tabmove -1<CR>
nnoremap <A-L> :tabmove +1<CR>
nmap gd <C-]>
nmap gb <C-T>
function! GetFileName()
	let fname = system("printf '' | dmenu -p 'Enter file name'")
	return fname
endfunction

function! Rename(file)
	let name = GetFileName()
	if empty(name)
		return
	endif
	execute "saveas " . name
	execute "bdelete " . a:file
	let e = system("rm " . a:file)
endfunction
noremap <f2> :call Rename(@%)<CR>
noremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>r :noh<CR>
nnoremap <leader><space> :colorscheme delek<CR>
set autoread
autocmd VimLeave *.tex !texclear %

"Snippets
autocmd FileType tex noremap cm cf>
autocmd FileType tex noremap ,, /<++><Enter>:noh<Enter>
autocmd FileType tex imap ,, <Esc>/<++><Enter>:noh<Enter><Esc>cm
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><++><Esc>5kf{a
autocmd FileType tex inoremap ,it \textit{}<++><Esc>F{a
autocmd FileType tex inoremap ,bo \textbf{}<++><Esc>F{a
autocmd FileType tex inoremap ,em \emph{}<++><Esc>F{a
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,li \item<Space>
autocmd Filetype tex inoremap ,rf \ref{}<++><Esc>F{a
autocmd Filetype tex inoremap ,lb \label{}<++><Esc>F{a
autocmd Filetype tex inoremap ,sc \section{}<Enter><Enter><++><Esc>2kf{a
autocmd Filetype tex inoremap ,sb \subsection{}<Enter><Enter><++><Esc>2kf{a
autocmd Filetype tex inoremap ,ssb \subsubsection{}<Enter><Enter><++><Esc>2kf{a
autocmd FileType tex inoremap ,nf \newcommand{}[<++>]{<Enter><++><Enter>}<Esc>2kf{a
autocmd FileType tex inoremap ,rnf \renewcommand{}[<++>]{<Enter><++><Enter>}<Esc>2kf{a
autocmd FileType tex inoremap ,tc \textcite{} <++><Esc>F{a
autocmd FileType tex inoremap ,pc \parencite{} <++><Esc>F{a
autocmd Filetype tex inoremap ,img \includegraphics[]{<++>}<Enter><++><Esc>kf[a
autocmd FileType tex inoremap ,ct \begin{center}<Enter><Enter>\end{center}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,fig \begin{figure}[]<Enter><++><Enter>\end{figure}<Enter><++><Esc>3kf[a
autocmd FileType tex inoremap ,wf \begin{wrapfigure}{}{}<Enter><Enter>\end{wrapfigure}<Enter><++><Esc>3kf{a
autocmd FileType tex inoremap ,mc \begin{columns}<Enter><Enter>\end{columns}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,nc \column{}<Enter><++><Esc>kf{a
autocmd FileType tex inoremap ,tb \begin{tabular}[h]{}<Enter><++><Enter>\end{tabular}<Enter><++><Esc>3kf{;a
autocmd FileType tex noremap ,xc :w! \| !clear && xcompile <c-r>%<CR>
autocmd FileType tex inoremap ,un \underline{}<++><Esc>F{a
autocmd FileType tex inoremap ,cd \begin{lstlisting}<Enter><Enter>\end{lstlisting}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,mpg \begin{minipage}{}<Enter><++><Enter>\end{minipage}<Enter><++><Esc>3kf{;a
autocmd FileType tex inoremap ,th \begin{theorem}<Enter><Enter>\end{theorem}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,lem \begin{lemma}<Enter><Enter>\end{lemma}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,co \begin{corollary}<Enter><Enter>\end{corollary}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,pr \begin{proof}<Enter><Enter>\end{proof}<Enter><++><Esc>2kS
autocmd Filetype tex inoremap ,sum \sum_{}^{<++>}<++><Esc>2F{a
autocmd Filetype tex inoremap ,prod \prod_{}^{<++>}<++><Esc>2F{a
autocmd Filetype tex inoremap ,lm \lim_{\to <++>}<++><Esc>F{a
autocmd Filetype tex inoremap ,bar \bar{\mathbb{}}<++><Esc>F{a
