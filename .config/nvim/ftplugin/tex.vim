autocmd VimLeave *.tex !texclear %
"Latex Snippets
imap ,, <Esc>:call search('<++>')<Enter>"_cf>
inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><++><Esc>5kf{a
inoremap ,it \textit{}<++><Esc>F{a
inoremap ,bo \textbf{}<++><Esc>F{a
inoremap ,em \emph{}<++><Esc>F{a
inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><++><Esc>2kS
inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><++><Esc>2kS
inoremap ,li \item<Space>
inoremap ,rf \ref{}<++><Esc>F{a
inoremap ,lb \label{}<++><Esc>F{a
inoremap ,sc \section{}<Enter><Enter><++><Esc>2kf{a
inoremap ,sb \subsection{}<Enter><Enter><++><Esc>2kf{a
inoremap ,ssb \subsubsection{}<Enter><Enter><++><Esc>2kf{a
inoremap ,nf \newcommand{}[<++>]{<Enter><++><Enter>}<Esc>2kf{a
inoremap ,rnf \renewcommand{}[<++>]{<Enter><++><Enter>}<Esc>2kf{a
inoremap ,tc \cite{} <++><Esc>F{a
inoremap ,ttc \textcite{} <++><Esc>F{a
inoremap ,pc \parencite{} <++><Esc>F{a
inoremap ,img \includegraphics[]{<++>}<Enter><++><Esc>kf[a
inoremap ,ct \begin{center}<Enter><Enter>\end{center}<Enter><++><Esc>2kS
inoremap ,fig \begin{figure}[]<Enter><++><Enter>\end{figure}<Enter><++><Esc>3kf[a
inoremap ,wf \begin{wrapfigure}{}{}<Enter><Enter>\end{wrapfigure}<Enter><++><Esc>3kf{a
inoremap ,mc \begin{columns}<Enter><Enter>\end{columns}<Enter><++><Esc>2kS
inoremap ,nc \column{}<Enter><++><Esc>kf{a
inoremap ,tb \begin{table}[h]<Enter>\begin{tabular}[h]{}<Enter><++><Enter>\end{tabular}<Enter>\end{table}<Enter><++><Esc>4kf{;a
inoremap ,un \underline{}<++><Esc>F{a
inoremap ,cd \begin{lstlisting}<Enter><Enter>\end{lstlisting}<Enter><++><Esc>2kS
inoremap ,mpg \begin{minipage}{}<Enter><++><Enter>\end{minipage}<Enter><++><Esc>3kf{;a
inoremap ,th \begin{theorem}<Enter><Enter>\end{theorem}<Enter><++><Esc>2kS
inoremap ,lem \begin{lemma}<Enter><Enter>\end{lemma}<Enter><++><Esc>2kS
inoremap ,co \begin{corollary}<Enter><Enter>\end{corollary}<Enter><++><Esc>2kS
inoremap ,pr \begin{proof}<Enter><Enter>\end{proof}<Enter><++><Esc>2kS
inoremap ,sum \sum_{}^{<++>}<++><Esc>2F{a
inoremap ,prod \prod_{}^{<++>}<++><Esc>2F{a
inoremap ,lm \lim_{\to <++>}<++><Esc>F{a
inoremap ,bar \bar{\mathbb{}}<++><Esc>F{a

"Latex Snippet Visual Mode
vmap <space>bo c\textbf{<C-r>"}<Esc>=%
vmap <space>it c\textit{<C-r>"}<Esc>=%
vmap <space>un c\underline{<C-r>"}<Esc>=%
vmap <space>em c\emph{<C-r>"}<Esc>=%
vmap <space>ct c\begin{center}<Enter><C-r>"\end{center}<Esc>^=%
vmap <space>ul c\begin{itemize}<Enter><C-r>"\end{itemize}<Esc>^=%
vmap <space>ol c\begin{enumerate}<Enter><C-r>"\end{enumerate}<Esc>^=%
vmap <space>li :s/\%V.*\%V./\\item &/<Enter>

"Latex Snipped Normal mode
noremap <leader>b :!clear && bibcompile <c-r>%<CR>
noremap <leader>x :w! \| !clear && xcompile <c-r>%<CR>
