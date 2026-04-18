#!/usr/bin/env bash
# kitty pager script for Neovim with ANSI color support

# when kitty launches a shell, it does not read .bashrc so we need to provide a full path here
NVIM_PATH=/opt/homebrew/opt/nvim/bin/nvim
BAT_PATH=/opt/homebrew/opt/bat/bin/bat

set -eu

# # Log to a file to see if the script is even being executed and what its PATH is
# exec > /tmp/kitty_pager_debug.log 2>&1
# echo "Script started at $(date)"
# echo "PATH: $PATH"
# echo "Arguments: $*"

# Determine if input is a TTY to control color output from piped commands
# For commands like `ls`, force color, e.g. `ls --color=always`

if [ "$#" -eq 3 ]; then
    INPUT_LINE_NUMBER=${1:-0}
    CURSOR_LINE=${2:-1}
    CURSOR_COLUMN=${3:-1}
    AUTOCMD_TERMCLOSE_CMD="call cursor(max([0,${INPUT_LINE_NUMBER}-1])+${CURSOR_LINE}, ${CURSOR_COLUMN})"
else
    AUTOCMD_TERMCLOSE_CMD="normal G"
fi

# Create a temporary file to store the piped input.
TEMP_FILE=$(mktemp)

# Read all piped input into a temp file
# cat - > "$TEMP_FILE"
# remove trailing whitespace (spaces, tabs, etc.) from the end of each line.
cat - | sed -e "s/[[:space:]]*$//" > "$TEMP_FILE"

# We'll use NVIM's 'terminal' buffer to run bat on the temporary file.
# (fallback 'less -R' for ANSI color codes.)

exec "$NVIM_PATH" \
   -c "set shell=bash scrollback=100000 termguicolors clipboard+=unnamedplus" \
   -c "autocmd TermEnter * stopinsert" \
   -c "autocmd TermClose * ${AUTOCMD_TERMCLOSE_CMD}" \
   -c "silent! call termopen('${BAT_PATH} --paging=never --style=plain \"${TEMP_FILE}\"')" \
   -c "autocmd TermClose * silent! call delete('${TEMP_FILE}')" # Clean up temp file on close
