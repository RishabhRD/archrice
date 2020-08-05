let g:airline#extensions#coc#enabled ='0'
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-marketplace',
	\ 'coc-terminal',
	\]

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

imap ,, <Plug>(coc-snippets-expand-jump)
nmap <silent> gd <Plug>(coc-definition)
autocmd FileType java nnoremap <leader>i :CocCommand java.action.organizeImports<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>af :CocFix<CR>
nmap <leader>al :CocList actions<CR>
nnoremap <f2> :CocCommand workspace.renameCurrentFile<CR>
nnoremap <leader>di :CocDiagnostics<CR>
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <leader>t :CocCommand terminal.Toggle<CR>
autocmd FileType java nmap <leader>ajl :CocCommand java.open.serverlog<CR>
autocmd FileType cpp nmap <leader>gh :CocCommand clangd.switchSourceHeader<CR>
autocmd FileType c nmap <leader>gh :CocCommand clangd.switchSourceHeader<CR>
