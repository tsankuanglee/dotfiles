" This is the first configuration file nvim reads

" source a script relative to caller script {{{
" https://stackoverflow.com/a/48828172/701284
let g:user_nvim_config_path = expand('<sfile>:p:h')
function! SourceConfig(relativePath)
  let fullPath = g:user_nvim_config_path . '/'. a:relativePath
  exec 'source ' . fullPath
endfunction
" }}}


" highlight yank{{{
au TextYankPost * silent! lua vim.highlight.on_yank()
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}
" }}}



" if exists('g:vscode')
"   " VSCode extension
"   call SourceConfig("init-vscode.vim")
" else
"   " regular neovim
"   call SourceConfig("init-regular.vim")
" endif

call SourceConfig("init-regular.vim")

if has("mac")
  call SourceConfig("init-mac.vim")
endif

" vim: set ft=vim foldmethod=marker sw=2 ts=2 sts=2 et :
