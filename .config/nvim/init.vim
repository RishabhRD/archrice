let mapleader=" "
call plug#begin('~/.vim/plugged')
  Plug 'RishabhRD/nvim-finder',
  Plug 'RishabhRD/popfix',
  Plug 'RishabhRD/nvim-rdark',
  Plug 'tjdevries/colorbuddy.nvim',
call plug#end()
set syntax=yes
set number relativenumber
set noswapfile nobackup
set inccommand=split
set nohlsearch incsearch
set colorcolumn=80
set splitright
set splitbelow
set expandtab
set autoindent
set cindent
set softtabstop=2 shiftwidth=2
lua require('colorbuddy').colorscheme('nvim-rdark')
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>ff :lua require'finder_config'.files()<CR>
nnoremap <leader>fl :lua require'finder_config'.fuzzy_grep()<CR>
nnoremap <A-y>fl :lua require'finder'.help_tags()<CR>
nnoremap Q :q!<CR>
