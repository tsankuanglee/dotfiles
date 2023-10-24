local opt = vim.opt

-- General {{{
  opt.mouse:remove({"a"}) -- disable mouse so we can use X terminal to copy and paste
  opt.backspace={"indent","eol","start"} -- Allow backspace over everything in insert mode.
  opt.complete:remove({"i"})
  opt.smarttab = true

  opt.nrformats:remove({"octal"})

  opt.ttimeout = true
  opt.ttimeoutlen = 100

  -- providers
  -- turn off unnecessary providers
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_node_provider = 0
-- }}} General

-- indent {{{
  -- opt.autoindent = false
  -- opt.smartindent = true
  opt.cindent = true -- fix the bug of non-indented #

  -- if has('autocmd')
  -- filetype plugin indent on
  -- endif
  -- if has('syntax') && !exists('g:syntax_on')
  -- syntax enable
  -- endif
  --- }}} indent

-- Search {{{
  opt.hlsearch = true  -- Highlight search results.
  opt.incsearch = true -- Incremental search.
  opt.magic = true     -- Use 'magic' patterns (extended regular expressions).
-- }}} Search

-- Formatting {{{

opt.showcmd    = true           -- Show (partial) command in status line.
opt.showmatch  = true           -- Show matching brackets.
opt.showmode   = true           -- Show current mode.
opt.ruler      = true           -- Show the line and column numbers of the cursor.
opt.number     = true           -- Show the line numbers on the left side.
opt.cursorline = true           -- Highlight the current line number
opt.formatoptions:append({"o"}) -- Continue comment marker in new lines.
opt.textwidth=0                 -- Hard-wrap long lines as you type them.
opt.expandtab  = true           -- Insert spaces when TAB is pressed.
opt.tabstop=4                   -- Render TABs using this many spaces.
opt.shiftwidth=4                -- Indentation amount for < and > commands.

opt.errorbells = false          -- No beeps.
opt.modeline = true             -- Enable modeline.
opt.linespace=0                 -- Set line-spacing to minimum.
opt.joinspaces = false          -- Prevents inserting two spaces after punctuation on a join (J)

-- More natural splits
opt.splitbelow = true           -- Horizontal split below current.
opt.splitright = true           -- Vertical split to right of current.

opt.display:append({"lastline"})
opt.startofline = false         -- Do not jump to first character with page commands.

-- Tell Vim which characters to show for expanded TABs,
-- trailing whitespace, and end-of-lines. VERY useful!
opt.listchars={
  tab = "> ",
  trail = "-",
  extends = ">",
  precedes = "<",
  nbsp = "+",
}
opt.list = true                -- Show problematic characters.

-- Also highlight all tabs and trailing whitespace characters.
vim.cmd([[
  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  match ExtraWhitespace /\s\+$\|\t/
]])

-- }}} Formatting

-- Configuration {{{
vim.cmd([[

  if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
  endif

  "set autoread            " If file updates, load automatically.
  set autochdir           " Switch to current file's parent directory.

  if &history < 1000
    set history=1000      " Number of lines in command history.
  endif
  if &tabpagemax < 50
    set tabpagemax=50     " Maximum tab pages.
  endif

  if &undolevels < 200
    set undolevels=200    " Number of undo levels.
  endif

  " Path/file expansion in colon-mode.
  set wildmenu
  set wildmode=list:longest
  set wildchar=<TAB>

  if !empty(&viminfo)
    set viminfo^=!        " Write a viminfo file with registers.
  endif
  set sessionoptions-=options

  " Allow color schemes to do bright colors without forcing bold.
  if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
  endif

  "" colorscheme
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors " true color support

  "colorscheme solarized
  "set background=dark " or light

"  colorscheme jellybeans
"  let g:jellybeans_use_term_italics = 1
"  let g:jellybeans_overrides = {
"\    'Search': { 'guifg': '000000', 'guibg': 'FFE792',
"\              'ctermfg': '', 'ctermbg': '',
"\              'attr': '' },
"\}


  " Diff options
  set diffopt+=iwhite " ignore whitespaces

  " spell
  set spelllang=en,cjk " add cjk so they are excluded from spell checking
  set spellsuggest=best,9


]])
-- }}}

-- vim: set ft=lua foldmethod=marker sw=2 ts=2 sts=2 et :