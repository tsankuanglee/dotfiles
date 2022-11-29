function! QuickUiMenuSetup()
  " general {{{
  " enable to display tips in the cmdline
  let g:quickui_show_tip = 1

  " styles
  let g:quickui_color_scheme = 'gruvbox'
  let g:quickui_border_style = 2

  " clear all the menus
  call quickui#menu#reset()
  " general }}}

  " namespace: system {{{
  " change current namespace to system
  call quickui#menu#switch('system')
  " The following will be populated into this namespace

  " reset namespace system
  call quickui#menu#reset()

  " install a 'File' menu, use [text, command] to represent an item.
  " optionally add help tips [text, command, tips]; tips show in CmdLine
  call quickui#menu#install('&File', [
    \ [ "fzf &File\t<leader>zf", 'FzfLua files' ],
    \ [ "fzf &Buffer\t<leader>zb", 'FzfLua buffers' ],
    \ [ "fzf &Old files\t<leader>zo", 'FzfLua oldfiles' ],
    \ [ "fzf &Quickfix\t<leader>zq", 'FzfLua quickfix' ],
    \ [ "fzf lo&Cation list\t<leader>zc", 'FzfLua loclist' ],
    \ [ "fzf l&Ines\t<leader>zl", 'FzfLua lines' ],
    \ [ "fzf current buffer li&Nes\t<leader>zn", 'FzfLua blines' ],
    \ [ "fzf &Tabs\t<leader>zt", 'FzfLua tabs' ],
    \ [ "fzf &Args\t<leader>za", 'FzfLua args' ],
    \ [ "--", '' ],
    \ [ "Ter&minal\t:terminal", 'terminal' ],
  \ ])

  call quickui#menu#install('&Edit', [
    \ [ "&Copy to clipboard\t\"+y", '\"+y' ],
    \ [ "&Paste below from clipboard\t\"+p", '"+p'],
    \ [ "&Paste above from clipboard\t\"+P", '"+P'],
    \ [ "--", '' ],
    \ [ "&Replace . with space", ":'<,'>s/\\./ /g"],
  \ ])

  call quickui#menu#install('&ColorScheme', [
    \ [ '&Solarized', 'colorscheme solarized'],
    \ [ '&Molokai', 'colorscheme molokai'],
    \ [ '&Jellybeans', 'colorscheme jellybeans'],
  \ ])

  call quickui#menu#install('&Plugins', [
    \ [ '&Toggle Indent lines', 'IndentBlanklineToggle'],
  \ ])

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

  call quickui#menu#install("Fo&Lding", [
    \ ['foldmethod=&Manual', 'setlocal foldmethod=manual'],
    \ ['foldmethod=&Indent', 'setlocal foldmethod=indent'],
    \ ['foldmethod=&Syntax', 'setlocal foldmethod=syntax'],
    \ ['foldmethod=marke&R', 'setlocal foldmethod=marker'],
    \ ['foldmethod=&Expr', 'setlocal foldmethod=expr'],
    \ ['foldmethod=&Diff', 'setlocal foldmethod=diff'],
    \ [ "--", '' ],
    \ ['foldcolumn=&0', 'setlocal foldcolumn=0'],
    \ ['foldcolumn=&5', 'setlocal foldcolumn=5'],
  \ ])

  call quickui#menu#install("File&Type", [
    \ ['file&Type=', 'set ft='],
    \ ['filetype=&Csv', 'set ft=csv'],
    \ ['filetype=&Text', 'set ft=text'],
  \ ])

  " register HELP menu with weight 10000
  call quickui#menu#install('&Help', [
    \ ["&Cheatsheet", 'help index', ''],
    \ ['T&ips', 'help tips', ''],
    \ ['Key &Notation', 'help key-notation', ''],
    \ ['--',''],
    \ ["&Tutorial", 'help tutor', ''],
    \ ['&Quick Reference', 'help quickref', ''],
    \ ['&Summary', 'help summary', ''],
  \ ], 10000)

  " namespace: system }}}

  " namespace: development {{{

  " change current namespace
  call quickui#menu#switch('development')
  " reset this namespace
  call quickui#menu#reset()
  " The following will be populated into this namespace

  call quickui#menu#install('&File', [
    \ [ "fzf &File\t<leader>zf", 'FzfLua files' ],
    \ [ "fzf &Buffer\t<leader>zb", 'FzfLua buffers' ],
    \ [ "fzf &Old files\t<leader>zo", 'FzfLua oldfiles' ],
    \ [ "fzf &Quickfix\t<leader>zq", 'FzfLua quickfix' ],
    \ [ "fzf lo&Cation list\t<leader>zc", 'FzfLua loclist' ],
    \ [ "fzf l&Ines\t<leader>zl", 'FzfLua lines' ],
    \ [ "fzf current buffer li&Nes\t<leader>zn", 'FzfLua blines' ],
    \ [ "fzf &Tabs\t<leader>zt", 'FzfLua tabs' ],
    \ [ "fzf &Args\t<leader>za", 'FzfLua args' ],
    \ [ "--", '' ],
    \ [ "Ter&minal\t:terminal", 'terminal' ],
  \ ])


  " namespace: development }}}
endfunc

" vim: set ft=vim foldmethod=marker sw=2 ts=2 sts=2 et :
