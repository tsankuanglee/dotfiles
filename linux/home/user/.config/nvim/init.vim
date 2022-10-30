" This is the first configuration file nvim reads

let g:user_nvim_config_path = expand('<sfile>:p:h')
" source a script relative to caller script
" https://stackoverflow.com/a/48828172/701284
function! SourceConfig(relativePath)
  let fullPath = g:user_nvim_config_path . '/'. a:relativePath
  exec 'source ' . fullPath
endfunction

if exists('g:vscode')
  " VSCode extension
  call SourceConfig("init-vscode.vim")

else
  " regular neovim
  call SourceConfig("init-regular.vim")
endif
