augroup xresources
  autocmd!
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb -load %
augroup END

