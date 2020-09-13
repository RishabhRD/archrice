lua require("lsp_config")
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>af <cmd>lua print(vim.lsp.util.get_line_diagnostics())<CR>
nnoremap <leader>ai <cmd>lua organize_imports(300)<CR>
nnoremap <leader>as <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>af <cmd>lua quickfix(300)<CR>
