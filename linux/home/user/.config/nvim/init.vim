" this file is modified from https://github.com/adibis/nvim
call plug#begin('~/.config/nvim/plugged')
" Plugins {

  " menu
  Plug 'skywind3000/vim-quickui'

  " ctrl-p is a fuzzy file finder.
  Plug 'kien/ctrlp.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " solarized colorscheme
  Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'

  " nvim's neocomplete
  Plug 'https://github.com/Shougo/deoplete.nvim.git'

  " NERDTree
  Plug 'scrooloose/nerdtree'

" }
call plug#end()


" General {
  " disable mouse so we can use X terminal to copy and paste
  set mouse-=a
  set backspace=indent,eol,start      " Allow backspace over everything in insert mode.
  set complete-=i
  set smarttab

  "set noautoindent        " I indent my code myself.
  "set nocindent           " I indent my code myself.
  "set smartindent        " Or I let the smartindent take care of it.
  set cindent             " this fixes the bug of non-indented #

  set nrformats-=octal

  set ttimeout
  set ttimeoutlen=100

  if has('autocmd')
    filetype plugin indent on
  endif
  if has('syntax') && !exists('g:syntax_on')
    syntax enable
  endif
" }

" Search {
  set hlsearch            " Highlight search results.
  "set ignorecase          " Make searching case insensitive
  "set smartcase           " ... unless the query has capital letters.
  set incsearch           " Incremental search.
  "set gdefault            " Use 'g' flag by default with :s/foo/bar/.
  set magic               " Use 'magic' patterns (extended regular expressions).

  " Use <C-L> to clear the highlighting of :set hlsearch.
  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  endif
" }

" Formatting {
  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set showmode            " Show current mode.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them.
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=4           " Render TABs using this many spaces.
  set shiftwidth=4        " Indentation amount for < and > commands.

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

  " More natural splits
  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.

  "if !&scrolloff
  "  set scrolloff=3       " Show next 3 lines while scrolling.
  "endif
  "if !&sidescrolloff
  "  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
  "endif
  set display+=lastline
  set nostartofline       " Do not jump to first character with page commands.

  if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
  endif

  " Tell Vim which characters to show for expanded TABs,
  " trailing whitespace, and end-of-lines. VERY useful!
  if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  endif
  set list                " Show problematic characters.

  " Also highlight all tabs and trailing whitespace characters.
  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  match ExtraWhitespace /\s\+$\|\t/

" }

" Configuration {
  if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
  endif

  "set autoread            " If file updates, load automatically.
  "set autochdir           " Switch to current file's parent directory.

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

  " solarized
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark " or light
  colorscheme solarized

  " Diff options
  set diffopt+=iwhite

" GUI Options {
  set guioptions-=m " Removes top menubar
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar

  "Toggle menubar
  "nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>


  " Sets a status line. If in a Git repository, shows the current branch.
  " Also shows the current file name, line and column number.
  if has('statusline')
      set laststatus=2

      " Broken down into easily includeable segments
      set statusline=%<%f\                     " Filename
      set statusline+=%w%h%m%r                 " Options
      "set statusline+=%{fugitive#statusline()} " Git Hotness
      set statusline+=\ [%{&ff}/%Y]            " Filetype
      set statusline+=\ [%{getcwd()}]          " Current dir
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif
" }

" CustomFunctions {
  " relative numbering help function
  function! RelativeNumberToggle()
    if(&relativenumber == 1)
      set nornu
      set number
    else
      set rnu
    endif
  endfunc

" }

" Keybindings {

  " config (init.vim) edit and reload
  nnoremap <silent> <leader>ce :e $MYVIMRC<CR>
  nnoremap <silent> <leader>cr :source $MYVIMRC<CR>

  " Save file
  nnoremap <Leader>w :w<CR>

  "Copy and paste from system clipboard
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P

  " Buffer switching
  nnoremap <silent> <leader>bn :bn<cr>
  nnoremap <silent> <leader>bp :bp<cr>
  nnoremap <silent> <c-tab> :bn<cr>
  nnoremap <silent> <c-s-tab> :bp<cr>

  " Tab functions
  nnoremap <silent> <leader>tn :tabnext<cr>
  nnoremap <silent> <leader>tp :tabprevious<cr>
  nnoremap <silent> <leader>tt :tabnew<cr>

  " line numbers (relative, switch), line wrap
  nnoremap <silent> <leader>lr :call RelativeNumberToggle()<cr>
  nnoremap <silent> <leader>ln :set nonumber! number?<cr>
  " linewrap
  nnoremap <silent> <leader>lw :set wrap! wrap?<CR>

  " colorscheme
  nnoremap <silent> <leader>Cs :colorscheme solarized<CR>
  nnoremap <silent> <leader>Cm :colorscheme molokai<CR>
  nnoremap <silent> <leader>Cj :colorscheme jellybeans<CR>
" }

" Plugin Settings {
  " Airline {
    let g:airline#extensions#tabline#enabled = 2
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#right_sep = ' '
    let g:airline#extensions#tabline#right_alt_sep = '|'
    let g:airline_left_sep = ' '
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ' '
    let g:airline_right_alt_sep = '|'
    "let g:airline_theme= 'serene'
    let g:airline_theme= 'serene'
  " }
  " CtrlP {
    " Open file menu
    nnoremap <Leader>o :CtrlP<CR>
    " Open buffer menu
    nnoremap <Leader>b :CtrlPBuffer<CR>
    " Open most recently used files
    nnoremap <Leader>f :CtrlPMRUFiles<CR>
  " }
  " { deoplete
    let g:deoplete#enable_at_startup = 1
  " }
  " { NERDTree
    " Auto start NERD tree when opening a directory
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
    " Let quit work as expected if after entering :q the only window left open is NERD Tree itself
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " }
" }


" quickui menu
" clear all the menus
call quickui#menu#reset()

" TODO customize this
" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'new' ],
            \ [ "&Open File\t(F3)", 'e .' ],
            \ [ "&Close", 'q' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'w'],
            \ [ "Save &As", 'saveas' ],
            \ [ "Save All", 'wa!' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'q' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&ColorScheme', [
            \ [ '&Solarized', 'colorscheme solarized'],
            \ [ '&Molokai', 'colorscheme molokai'],
            \ [ '&Jellybeans', 'colorscheme jellybeans'],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
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
noremap <silent> <space><space> :call quickui#menu#open()<cr>

" vim:set ft=vim sw=2 ts=2 sts=2 et:
