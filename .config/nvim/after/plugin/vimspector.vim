nmap <Down> :lua require'vimspector'.executeLastCommand()<CR>
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :lua require'vimspector'.reset()<CR>
nmap <leader>de :VimspectorEval 
nmap <leader>dw :VimspectorWatch 
nmap <leader>do :VimspectorShowOutput 

nmap <leader>dl :lua require'vimspector'.stepInto()<CR>
nmap <leader>dj :lua require'vimspector'.stepOver()<CR>
nmap <leader>dk :lua require'vimspector'.stepOut()<CR>
nmap <leader>dr <Plug>VimspectorRestart
nnoremap <leader>d<space> :lua require'vimspector'.continue()<CR>
nmap <leader>dcc :lua require'vimspector'.runToCursor()<CR>
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint
