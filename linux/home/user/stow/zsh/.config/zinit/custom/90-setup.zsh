# unlimited history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
unsetopt SHARE_HISTORY             # don't Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
#setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
#setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.


# auto correct is super annoying!
#setopt CORRECT
#setopt CORRECT_ALL
unsetopt CORRECT
unsetopt CORRECT_ALL

# Enable the ability to change directory just by typing the name
setopt auto_cd
# Enable flexible globbing (filename expansion)
# setopt extended_glob # For `**/*` style matching
setopt glob_subst    # For flexible substring replacement
unsetopt extended_glob

# launch nvim to edit cmd line
# enable Zsh Vi mode
autoload -U edit-command-line
zle -N edit-command-line
# use ESC-v to launch it (this seems to affect auto_complete)
# bindkey -v
# bindkey -M vicmd v edit-command-line
# The above binding affects the autocomplete, so we use alternative keys
bindkey '^Xe' edit-command-line
bindkey '^X^E' edit-command-line

# common keybinds
# ctrl-U erases from cursor to line beginning (instead of the whole line)
bindkey "^U" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
# ctrl-left, ctrl-right, home, end
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# delete
bindkey "^[[3~" delete-char
# ctrl-delete
zle-line-init() {
  # This command is usually 'delete-word' in Zsh, but we can ensure
  # it targets the word under the cursor (forward delete).
  zle -N delete-word-under-cursor delete-word
}
bindkey '^[[3;5~' delete-word

