# completion, fuzzy matching, menu
zinit ice wait'0' lucid blockf
autoload -Uz compinit
zmodload zsh/complist
# substring/fuzzy Matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
# menu select
zstyle ':completion:*' menu select=2
# Initialize the Zsh Completion System
compinit

# zinit light: load plugin without debug reporting overhead
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

zinit light Aloxaf/fzf-tab
# bind it to shift-tab
bindkey "^[[Z" fzf-tab-complete
# restore tab's original bind
bindkey "^I" fzf-completion

