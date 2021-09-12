let g:tex_flavor="latex"

augroup setfileype
  au!
  au! BufRead,BufNewFile *.mxx setfiletype cpp
augroup end
