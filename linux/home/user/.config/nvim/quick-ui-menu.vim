function! QuickUiMenuSetup()
  " clear all the menus
  call quickui#menu#reset()

  " install a 'File' menu, use [text, command] to represent an item.
  " optionally add help tips [text, command, tips]; tips show in CmdLine
  call quickui#menu#install('&File', [
    \ [ "&NERDTree", 'NERDTree' ],
    \ [ "N&ERDTreeToggle", 'NERDTreeToggle %', 'show current file location' ],
    \ [ "Nvim&Tree", 'NvimTreeOpen' ],
    \ [ "--", '' ],
    \ [ "&Buffer Tree Exploror", 'Tree' ],
    \ [ "--", '' ],
    \ [ "Ter&minal", 'terminal' ],
    \ [ "--", '' ],
    \ [ "&Save", 'w'],
    \ [ "Force Save &All", 'wa!' ],
    \ [ "--", '' ],
    \ [ "Force &Quit all", 'q!' ],
    \ [ "E&xit", 'q' ],
  \ ])

  call quickui#menu#install('&Edit', [
    \ [ '&Copy to clipboard', '\"+y' ],
    \ [ '&Paste below from clipboard', '"+p'],
    \ [ '&Paste above from clipboard', '"+P'],
  \ ])

  call quickui#menu#install('&ColorScheme', [
    \ [ '&Solarized', 'colorscheme solarized'],
    \ [ '&Molokai', 'colorscheme molokai'],
    \ [ '&Jellybeans', 'colorscheme jellybeans'],
  \ ])

  call quickui#menu#install('&Plugins', [
    \ [ '&Toggle Indent lines', 'IndentBlanklineToggle'],
  \ ])
  "    \ [ '&Indent lines ()', ''],
  "    \ [ '&Indent lines %{&g:indent_blankline_enabled? "On":"Off"}', 'set g:indent_blankline_enabled!'],

  " script inside %{...} will be evaluated and expanded in the string
  call quickui#menu#install("&Option", [
    \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
    \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
    \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
    \ ['Toggle Line&Wrap', 'set wrap! wrap?'],
    \ ['Toggle Line&Number', 'set nonumber! number?'],
    \ ['Toggle LineNumber &Relative', 'call RelativeNumberToggle()'],
    \ ['Set &UTF-8', 'set fileencoding=utf8'],
    \ ['tab=&2', 'set sw=2 ts=2 sts=2 expandtab'],
    \ ['tab=&4', 'set sw=4 ts=4 sts=4 expandtab'],
  \ ])

  " register HELP menu with weight 10000
  call quickui#menu#install('&Help', [
    \ ["&Cheatsheet", 'help index', ''],
    \ ['T&ips', 'help tips', ''],
    \ ['--',''],
    \ ["&Tutorial", 'help tutor', ''],
    \ ['&Quick Reference', 'help quickref', ''],
    \ ['&Summary', 'help summary', ''],
  \ ], 10000)

  " enable to display tips in the cmdline
  let g:quickui_show_tip = 1

  " hit space twice to open quickui menu
  "noremap <silent> <leader><space> :call quickui#menu#open()<cr>
endfunc

" vim: set ft=vim sw=2 ts=2 sts=2 et:
