" macOS config used for neovim-qt https://github.com/equalsraf/neovim-qt

" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
  " Use GuiFont! to ignore font errors
  " :GuiFont Fira Code:h12, or :set guifont=Hack:h12
  " GuiFont {font_name}:h{size}
  GuiFont Hack Nerd Font Mono:h20
endif

" Disable GUI Tabline
if exists(':GuiTabline')
  GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
  GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" Paste in command line
cnoremap <D-v> <c-r>"
" Paste in other modes
nnoremap <D-v> "+p
inoremap <D-v> <c-o>"+p

" Tabs
nnoremap <D-t> :tabnew<CR>
" Switching tabs
" TODO: should be using the curly bracket but that doesn't work for some
" reason
nnoremap <D-[> :<C-U>tabprevious<CR>
nnoremap <D-]> :<C-U>tabnext<CR>
" Disable switch tab command in insert mode
inoremap <D-[> <nop>
inoremap <D-]> <nop>

" Close tab
nnoremap <D-w> <C-W>q
