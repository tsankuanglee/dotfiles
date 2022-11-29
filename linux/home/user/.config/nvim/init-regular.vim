" ref:
" https://github.com/adibis/nvim
" https://gist.github.com/subfuzion/7d00a6c919eeffaf6d3dbf9a4eb11d64

" Plugins selection {{{
call plug#begin('~/.config/nvim/plugged')

  " Look {{{
  " Airline
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'

  " Indent Blankline
  "Plug 'lukas-reineke/indent-blankline.nvim'

  " solarized colorscheme
  "Plug 'frankier/neovim-colors-solarized-truecolor-only'
  " Look }}}

  " UI {{{
  "" quick-menu
  "Plug 'skywind3000/vim-quickui'

  "" fzf (needs fzf installed)
  "Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
  "" (fzf) optional for icon support
  "Plug 'kyazdani42/nvim-web-devicons'

  " UI }}}

  " General {{{
  "" treat Indent as object to select/operate
  "Plug 'michaeljsmith/vim-indent-object'
  "" complete/id unicode/digraphs
  "Plug 'chrisbra/unicode.vim'
  " General }}}

  " Programming {{{
  " syntax highlighting
  "Plug 'sheerun/vim-polyglot'
  " deoplete
  Plug 'Shougo/deoplete.nvim'

  "" snippets
  "Plug 'hrsh7th/vim-vsnip'
  "Plug 'hrsh7th/vim-vsnip-integ'
  "Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }

  " python
  "Plug 'deoplete-plugins/deoplete-jedi'
  " Rust
  "Plug 'sebastianmarkow/deoplete-rust'
  " TODO migrate to LSP
  Plug 'neovim/nvim-lspconfig'
  "Plug 'lspcontainers/lspcontainers.nvim'
  " Programming }}}

call plug#end()
" }}}

    lua require('plugins')

" Custom Functions {{{

  " various utils
  call SourceConfig("utils.vim")
" }}}

" Plugin Settings {{{

  " # Programming Languages

  " { deoplete
    let g:deoplete#enable_at_startup = 1
  " }

  " { LSP: Rust
    "lua require("lsprust")
  " }

" }}}

" General {{{
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
" }}}

" Search {{{
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
" }}}

" Formatting {{{
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

" }}}

" Configuration {{{
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
" }}}

" GUI Options {{{
  set guioptions-=m " Removes top menubar
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set guioptions-=L " Removes left hand scroll bar

  "Toggle menubar
  "nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

  " Sets a status line. If in a Git repository, shows the current branch.
  " Also shows the current file name, line and column number.
  "if has('statusline')
  "  set laststatus=2

  "  " Broken down into easily includeable segments
  "  set statusline=%<%f\                     " Filename
  "  set statusline+=%w%h%m%r                 " Options
  "  "set statusline+=%{fugitive#statusline()} " Git Hotness
  "  set statusline+=\ [%{&ff}/%Y]            " Filetype
  "  set statusline+=\ [%{getcwd()}]          " Current dir
  "  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  "endif
" }}}

" Keybindings {{{

  " nvim config (init.vim) edit and reload
    nnoremap <silent> <leader>ce :e $MYVIMRC<CR>
    nnoremap <silent> <leader>cr :source $MYVIMRC<CR>

  " quickui
    noremap <silent> <leader><space> :call quickui#menu#open('system')<cr>
    noremap <silent> <leader>m1 :call quickui#menu#open('system')<cr>
    noremap <silent> <leader>m2 :call quickui#menu#open('development')<cr>

  " Save file
    nnoremap <Leader>w :w<CR>

  " Copy and paste from system clipboard
    vmap <leader>y "+y
    vmap <leader>d "+d
    nmap <leader>p "+p
    nmap <leader>P "+P
    vmap <leader>p "+p
    vmap <leader>P "+P

  " Buffer switching
    nnoremap <silent> <leader>bb :new<cr>
    nnoremap <silent> <leader>bv :vnew<cr>
    nnoremap <silent> <leader>bd :bd<cr>
    nnoremap <silent> <leader>bD :bd!<cr>
    nnoremap <silent> <leader>bn :bn<cr>
    nnoremap <silent> <leader>bp :bp<cr>
    nnoremap <silent> <c-tab> :bn<cr>
    nnoremap <silent> <c-s-tab> :bp<cr>

  " Tab functions
    nnoremap <silent> <leader>tt :tabnew<cr>
    nnoremap <silent> <leader>tc :tabclose<cr>
    nnoremap <silent> <leader>to :tabonly<cr>
    nnoremap <silent> <leader>tn :tabnext<cr>
    nnoremap <silent> <leader>tp :tabprevious<cr>
    nnoremap <silent> <leader>t1 :tabfirst<cr>
    nnoremap <silent> <leader>t9 :tablast<cr>

  " line numbers (relative, switch), line wrap
    nnoremap <silent> <leader>lr :call RelativeNumberToggle()<cr>
    nnoremap <silent> <leader>ln :set nonumber! number?<cr>
  " linewrap
    nnoremap <silent> <leader>lw :set wrap! wrap?<CR>

  " colorscheme
    nnoremap <silent> <leader>Cs :colorscheme solarized<CR>
    nnoremap <silent> <leader>Cm :colorscheme molokai<CR>
    nnoremap <silent> <leader>Cj :colorscheme jellybeans<CR>

  " fzf {
    nnoremap <silent> <leader>zf :FzfLua files<cr>
    nnoremap <silent> <leader>zb :FzfLua buffers<cr>
    nnoremap <silent> <leader>zo :FzfLua oldfiles<cr>
    nnoremap <silent> <leader>zq :FzfLua quickfix<cr>
    nnoremap <silent> <leader>zc :FzfLua loclist<cr>
    nnoremap <silent> <leader>zl :FzfLua lines<cr>
    nnoremap <silent> <leader>zn :FzfLua blines<cr>
    nnoremap <silent> <leader>zt :FzfLua tabs<cr>
    nnoremap <silent> <leader>za :FzfLua args<cr>
  " }

  " filetype {
    nnoremap <silent> <leader>ft0 :set filetype=<cr>
    nnoremap <silent> <leader>ftc :set filetype=csv<cr>
  " }

  " terminal {
    " use ESC to leave terminal mode (side effect: cannot use ESC in terminal,
    " e.g. shell editing)
    "tnoremap <Esc> <C-\><C-n>
  " }
" }}}

" vim: set ft=vim foldmethod=marker sw=2 ts=2 sts=2 et :
