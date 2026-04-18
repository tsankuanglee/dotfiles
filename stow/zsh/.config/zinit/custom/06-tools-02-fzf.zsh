
# fzf {{{
# ~/.fzf.zsh will source /usr/share/fzf/key-bindings.zsh and /usr/share/fzf/completion.zsh
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
#export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l --color=always ""'
#export FZF_DEFAULT_COMMAND='fd --type f --color=always'
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# _fzf_compgen is to configure **TAB
_fzf_compgen_path() {
  # Use fd (https://github.com/sharkdp/fd) instead of the default find
  # command for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  fd --color=always --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  # Use fd to generate the list for directory completion
  fd --color=always --type d --hidden --follow --exclude ".git" . "$1"
}
# add hotkeys
export FZF_DEFAULT_OPTS="--multi --ansi --bind 'alt-g:toggle-all' --bind 'alt-v:preview(cat {})' --bind 'alt-V:toggle-preview' --bind 'alt-up:preview-page-up,alt-down:preview-page-down' --preview-window hidden"
alias fzfp='fzf --ansi --preview "bat --style=numbers --color=always --line-range :500 {}"'
# }}} fzf

# vim: set foldmethod=marker :
