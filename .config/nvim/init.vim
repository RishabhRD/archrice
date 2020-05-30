"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
Plug 'rbgrouleff/bclose.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'ptzz/lf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-fugitive'
Plug 'fcpg/vim-fahrenheit'
call plug#end()



" Functions
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



" Basic Settings
let mapleader =" "
syntax on
set showtabline=2
set nocompatible
colorscheme wal
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
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
filetype plugin on
set number
set incsearch
set autoread





" Tab Numbering
if exists("+showtabline")
	function! MyTabLine()
		let s = ''
		let wn = ''
		let t = tabpagenr()
		let i = 1
		while i <= tabpagenr('$')
			let buflist = tabpagebuflist(i)
			let winnr = tabpagewinnr(i)
			let s .= '%' . i . 'T'
			let s .= (i == t ? '%1*' : '%2*')
			let s .= ' '
			let wn = tabpagewinnr(i,'$')

			let s .= '%#TabNum#'
			let s .= i
			" let s .= '%*'
			let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
			let bufnr = buflist[winnr - 1]
			let file = bufname(bufnr)
			let buftype = getbufvar(bufnr, 'buftype')
			if buftype == 'nofile'
				if file =~ '\/.'
					let file = substitute(file, '.*\/\ze.', '', '')
				endif
			else
				let file = fnamemodify(file, ':p:t')
			endif
			if file == ''
				let file = '[No Name]'
			endif
			let s .= ' ' . file . ' '
			let i = i + 1
		endwhile
		let s .= '%T%#TabLineFill#%='
		let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
		return s
	endfunction
	set stal=2
	set tabline=%!MyTabLine()
	set showtabline=2
	highlight link TabNum Special
endif




" Settings for specific files
autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %
autocmd BufWritePost sxhkdrc !pkill sxhkd;nohup sxhkd & 2> /dev/null -load %
autocmd VimLeave *.tex !texclear %
let g:tex_flavor = "latex"




" Fuzzy finder integration
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~40%' }
"Fuzzy Finder Bindings




" Clipboard bindings
noremap cp "+y
noremap zp "+p
noremap cpp "+YY


" Other bindings
noremap <leader>z :source $HOME/.config/nvim/init.vim<Enter>
noremap <f2> :call Rename(@%)<CR>
noremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>r :noh<CR>
map <leader>c :w! \| !clear && compiler <c-r>%<CR>
map <leader>p :!clear && printVim <c-r>%<CR><CR>
cmap wsudo w !sudo tee > /dev/null %
" ctags mappings
nmap gd <C-]>
nmap gb <C-T>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>en :lnext<CR>
map <leader>ep :lprevious<CR>



" Tab bindings
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
noremap gn :tabe<CR>
noremap gc :tabclose<CR>



" Split bindings
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>k <C-w>k
map <leader>j <C-w>j




" YCM and eclim stuff
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
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_show_diagnostics_ui = 1




"Java Bindings for eclim
autocmd FileType java map <leader>i :JavaImport<CR>
autocmd FileType java map <leader>v :JavaCorrect<CR>
autocmd FileType java map <leader>d :JavaDocPreview<CR>
autocmd FileType java map <leader>x <C-W>j:q<CR>




" Status Line
set statusline=%f                           
set statusline+=\ %m      
set statusline+=\ %r      
set statusline+=\ %h      
set statusline+=\ %=                        
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, 
set statusline+=%{&ff}] 
set statusline+=%y      
set statusline+=\ %l/%L\ [%p%%]            
set statusline+=\                         
set statusline+=Col:%c            




"Latex Snippets
autocmd FileType tex imap ,, <Esc>:call search('<++>')<Enter>cf>
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
autocmd FileType tex inoremap ,tc \cite{} <++><Esc>F{a
autocmd FileType tex inoremap ,ttc \textcite{} <++><Esc>F{a
autocmd FileType tex inoremap ,pc \parencite{} <++><Esc>F{a
autocmd Filetype tex inoremap ,img \includegraphics[]{<++>}<Enter><++><Esc>kf[a
autocmd FileType tex inoremap ,ct \begin{center}<Enter><Enter>\end{center}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,fig \begin{figure}[]<Enter><++><Enter>\end{figure}<Enter><++><Esc>3kf[a
autocmd FileType tex inoremap ,wf \begin{wrapfigure}{}{}<Enter><Enter>\end{wrapfigure}<Enter><++><Esc>3kf{a
autocmd FileType tex inoremap ,mc \begin{columns}<Enter><Enter>\end{columns}<Enter><++><Esc>2kS
autocmd FileType tex inoremap ,nc \column{}<Enter><++><Esc>kf{a
autocmd FileType tex inoremap ,tb \begin{table}[h]<Enter>\begin{tabular}[h]{}<Enter><++><Enter>\end{tabular}<Enter>\end{table}<Enter><++><Esc>4kf{;a
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

"Latex Snippet Visual Mode
autocmd FileType tex vmap <space>bo c\textbf{<C-r>"}<Esc>=%
autocmd FileType tex vmap <space>it c\textit{<C-r>"}<Esc>=%
autocmd FileType tex vmap <space>un c\underline{<C-r>"}<Esc>=%
autocmd FileType tex vmap <space>em c\emph{<C-r>"}<Esc>=%
autocmd FileType tex vmap <space>ct c\begin{center}<Enter><C-r>"\end{center}<Esc>^=%
autocmd FileType tex vmap <space>ul c\begin{itemize}<Enter><C-r>"\end{itemize}<Esc>^=%
autocmd FileType tex vmap <space>ol c\begin{enumerate}<Enter><C-r>"\end{enumerate}<Esc>^=%
autocmd FileType tex vmap <space>li :s/\%V.*\%V./\\item &/<Enter>

"Latex Snipped Normal mode
autocmd FileType tex noremap <leader>b :!clear && bibcompile <c-r>%<CR>
autocmd FileType tex noremap <leader>x :w! \| !clear && xcompile <c-r>%<CR>
