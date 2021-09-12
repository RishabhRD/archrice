nmap <C-j> <Plug>(qf_qf_next)
nmap <C-k> <Plug>(qf_qf_previous)
nmap <C-l> <Plug>(qf_loc_next)
nmap <C-h> <Plug>(qf_loc_previous)
nmap <leader>q <Plug>(qf_qf_toggle)
nmap Q <Plug>(qf_loc_toggle)
nmap <buffer> [[  <Plug>(qf_older)
nmap <buffer> ]] <Plug>(qf_newer)
nmap <buffer> { <Plug>(qf_previous_file)
nmap <buffer> } <Plug>(qf_next_file)

let g:qf_mapping_ack_style = 1
