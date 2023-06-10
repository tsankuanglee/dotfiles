" utils.vim
" various custom functions
"
" relative numbering help function
function! RelativeNumberToggle()
  if(&relativenumber == 1)
    set number
    set nornu
  else
    set number
    set rnu
  endif
endfunc

function! DiffIngoreAllWhiteSpaceToggle()
  if(&diffopt =~ 'iwhiteall')
    set diffopt-=iwhiteall
  else
    set diffopt+=iwhiteall
  endif
endfunction

" vim: set ft=vim sw=2 ts=2 sts=2 et :
