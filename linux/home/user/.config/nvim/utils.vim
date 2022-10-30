" utils.vim
" various custom functions
"
" relative numbering help function
function! RelativeNumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc


" vim: set ft=vim sw=2 ts=2 sts=2 et :
