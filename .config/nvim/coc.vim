let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-actions',
	\ 'coc-marketplace',
	\ 'coc-terminal',
	\]
let g:UltiSnipsExpandTrigger=",,"
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


" GoTo code navigation.

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
imap <C-j> <Plug>(coc-snippets-expand-jump)
noremap gd <Plug>(coc-definition)





"Custom keybindings for ease
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


""explicit tag stack
"let g:definition_list_coc_jumps_buffers = []
"let g:definition_list_coc_jumps_lines = []
"fun! DefinitionJump()
"	let l:cur_line = line('.')
"	let l:cur_buffer = bufnr("%")
"	execute \"normal \<Plug>(coc-definition)"
"	let l:new_line = line('.')
"	let l:new_buffer = bufnr("%")
"	" if l:new_line != l:cur_line || l:new_buffer != l:cur_buffer
"	call add(g:definition_list_coc_jumps_buffers,l:cur_buffer)
"	call add(g:definition_list_coc_jumps_lines,l:cur_line)
"	" endif
"endfun

"fun! DefinitionJumpBack()
"	let l:index = len(g:definition_list_coc_jumps_lines) - 1
"	if l:index < 0
"		echo \"Tag stack empty"
"		return
"	endif
"	let l:old_line = g:definition_list_coc_jumps_lines[index]
"	let l:old_buffer = g:definition_list_coc_jumps_buffers[index]
"	execute \"buffer " l:old_buffer
"	execute l:old_line
"	call remove(g:definition_list_coc_jumps_buffers, index)
"	call remove(g:definition_list_coc_jumps_lines, index)
"endfun
"nmap <silent> gd :call DefinitionJump()<CR>
"nmap <silent> gb :call DefinitionJumpBack()<CR>
