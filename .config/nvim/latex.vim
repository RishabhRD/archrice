autocmd FileType tex set wrap
let g:tex_flavor = "latex"
autocmd VimLeave *.tex !texclear %
"Latex Snippets
autocmd FileType tex imap ,, <Esc>:call search('<++>')<Enter>"_cf>
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
