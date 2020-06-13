"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
Plug 'rbgrouleff/bclose.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ptzz/lf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'dylanaraps/wal.vim'
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
filetype plugin on
set number
set incsearch
set autoread
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let g:lf_replace_netrw = 1





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
noremap zP "+P
noremap cpp "+yy


" Other bindings
noremap <leader>z :source $HOME/.config/nvim/init.vim<Enter>
noremap <f2> :call Rename(@%)<CR>
nnoremap <leader>r :noh<CR>
map <leader>c :w! \| !clear && compiler <c-r>%<CR>
map <leader>p :!clear && printVim <c-r>%<CR><CR>
cmap <C-w> w !sudo tee > /dev/null %<CR>
" ctags mappings
nmap gd <C-]>
nmap gb <C-T>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>en :lnext<CR>
map <leader>ep :lprevious<CR>
map <leader>sf :set foldmethod=syntax<CR>


"LF bindings
map <leader>wf :tab split<CR>:LfCurrentDirectory<CR>
map <leader>sf :vsp<CR>:LfCurrentDirectory<CR>



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
map <C-h> :vertical resize -3<CR>
map <C-l> :vertical resize +3 <CR>
map <C-k> :resize +3<CR>
map <C-j> :resize -3<CR>
map <leader>th <C-w>t<C-w>K
map <leader>tv <C-w>t<C-w>H





"Java Bindings for eclim
"autocmd FileType java map <leader>i :JavaImport<CR>
"autocmd FileType java map <leader>v :JavaCorrect<CR>
"autocmd FileType java map <leader>d :JavaDocPreview<CR>
map <leader>x <C-W>j:q<CR>




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




"COC settings
"
"
"
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
"set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gD <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>nm <Plug>(coc-rename)


" Formatting selected code.
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>i  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Show all diagnostics.
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>

nmap <leader>v :CocFix<CR>
