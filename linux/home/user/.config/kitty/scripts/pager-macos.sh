#!/usr/bin/env bash
# Kitty pager script for Neovim with ANSI color support

set -eu

# Determine if input is a TTY to control color output from piped commands
# This is usually done by the command itself, but we can hint if needed.
# For commands like `ls`, you often need to force color if piping.
# Example: `ls --color=always`

if [ "$#" -eq 3 ]; then
    INPUT_LINE_NUMBER=${1:-0}
    CURSOR_LINE=${2:-1}
    CURSOR_COLUMN=${3:-1}
    AUTOCMD_TERMCLOSE_CMD="call cursor(max([0,${INPUT_LINE_NUMBER}-1])+${CURSOR_LINE}, ${CURSOR_COLUMN})"
else
    AUTOCMD_TERMCLOSE_CMD="normal G"
fi

# Create a temporary file to store the piped input.
# This allows 'less -R' or 'bat' to read from a file, which is more reliable
# than complex FD management, especially for programs that need a TTY for colors.
# Use mktemp to create a unique temporary file.
TEMP_FILE=$(mktemp)

# Read all piped input into the temporary file.
# The 'cat' command here will read from stdin (the pipe) until EOF.
cat - > "$TEMP_FILE"

# Now, launch nvim.
# We'll use a 'terminal' buffer to run 'less -R' on the temporary file.
# 'less -R' is excellent at interpreting ANSI color codes.
# 'bat' is an even better alternative if installed, as it's designed for this.

exec nvim \
    -c "set shell=bash scrollback=100000 termguicolors clipboard+=unnamedplus" \
    -c "autocmd TermEnter * stopinsert" \
    -c "autocmd TermClose * ${AUTOCMD_TERMCLOSE_CMD}" \
    -c "silent! call termopen('less -R \"${TEMP_FILE}\"')" \
    -c "autocmd TermClose * silent! call delete('${TEMP_FILE}')" # Clean up temp file on close
