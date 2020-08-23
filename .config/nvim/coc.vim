function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-marketplace',
	\ 'coc-terminal',
	\]

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call <SID>show_documentation()<CR>

imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <silent> gd <Plug>(coc-definition)
autocmd FileType java nnoremap <leader>i :CocCommand java.action.organizeImports<CR>
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <leader>af :CocFix<CR>
nmap <leader>al :CocList actions<CR>
nnoremap <f2> :CocCommand workspace.renameCurrentFile<CR>
nnoremap <leader>di :CocDiagnostics<CR>
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <leader>t :CocCommand terminal.Toggle<CR>
autocmd FileType cpp nmap <leader>gh :CocCommand clangd.switchSourceHeader<CR>
autocmd FileType c nmap <leader>gh :CocCommand clangd.switchSourceHeader<CR>
