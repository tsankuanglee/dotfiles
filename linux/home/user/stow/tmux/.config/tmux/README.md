# Install tpack

tpack is a drop-in replacement for the legacy tpm. To install,

```
git clone https://github.com/tmuxpack/tpack ~/.local/share/tmux/plugins/tpm

```

Then in ~/.config/tmux/tmux.conf:

```
# List of plugins
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Initialize tpack (keep this line at the very bottom of tmux.conf)
run '~/.local/share/tmux/plugins/tpm/tpm'
```

To reload tmux:
```
tmux source ~/.config/tmux/tmux.conf
```

Then Ctrl-A Shift-I to install.


# sorted keybinds (for finding available keys)
* C-a     custom: last-window
* C-o     built-in: Rotate through the panes
* C-z     built-in: Suspend the current client
* Space   built-in: Select next layout
* !       built-in: Break pane to a new window
* \#       built-in: List all paste buffers
* $       built-in: Rename current session
* &       built-in: Kill current window
* '       built-in: Prompt for window index to select
* (       built-in: Switch to previous client
* )       built-in: Switch to next client
* ,       built-in: Rename current window
* .       built-in: Move the current window
* /       built-in: Describe key binding
* 0       built-in: Select window 0
* 1       built-in: Select window 1
* 2       built-in: Select window 2
* 3       built-in: Select window 3
* 4       built-in: Select window 4
* 5       built-in: Select window 5
* 6       built-in: Select window 6
* 7       built-in: Select window 7
* 8       built-in: Select window 8
* 9       built-in: Select window 9
* :       built-in: Prompt for a command
* ;       built-in: Move to the previously active pane
* =       built-in: Choose a paste buffer from a list
* ?       built-in: List key bindings
* C       built-in: Customize options
* D       built-in: Choose and detach a client from a list
* E       built-in: Spread panes out evenly
* F       custom: grab panel from window as horizontal
* H       pain-control: resize narrower
* J       pain-control: resize shorter
* K       pain-control: resize higher
* L       pain-control: resize wider
* M       built-in: Clear the marked pane
* O       custom: toggle mouse
* P       tome: scratch book
* T       custom: send panel to window as horizontal
* [       built-in: Enter copy mode
* ]       built-in: Paste the most recent paste buffer
* a       custom: Detach the current client
* d       built-in: Detach the current client
* f       custom: grab panel from window as vertical
* h       pain-control: move left
* i       built-in: Display window information
* j       pain-control: move down
* k       pain-control: move up
* l       pain-control: move right
* m       built-in: Toggle the marked pane
* n       built-in: Select the next window
* o       built-in: Select the next pane
* p       built-in: Select the previous window
* q       built-in: Display pane numbers
* r       custom: reload config
* s       built-in: Choose a session from a list
* t       custom: send panel to window as vertical
* u       built-in: Jump to pane location in copy mode
* w       built-in: Choose a window from a list
* x       built-in: Kill the active pane
* z       built-in: Zoom the active pane
* <       pain-control: move window left
* >       pain-control: move window right
*
* \       menus: open popup menu
* |       pain-control: split pane right
* \       (overwritten) pain-control: spli pane right (full)
* -       pain-control: split pane bottom
* _       pain-control: split pane bottom (full height)
*
* {       built-in: Swap the active pane with the pane above
* }       built-in: Swap the active pane with the pane below
* ~       built-in: Show messages
* DC      built-in: Reset so the visible part of the window follows the cursor
* PPage   built-in: Enter copy mode and scroll up
* Up      built-in: Select the pane above the active pane
* Down    built-in: Select the pane below the active pane
* Left    built-in: Select the pane to the left of the active pane
* Right   built-in: Select the pane to the right of the active pane
* M-1     built-in: Set the even-horizontal layout
* M-2     built-in: Set the even-vertical layout
* M-3     built-in: Set the main-horizontal layout
* M-4     built-in: Set the main-vertical layout
* M-5     built-in: Select the tiled layout
* M-n     built-in: Select the next window with an alert
* M-o     built-in: Rotate through the panes in reverse
* M-p     built-in: Select the previous window with an alert
* M-Up    built-in: Resize the pane up by 5
* M-Down  built-in: Resize the pane down by 5
* M-Left  built-in: Resize the pane left by 5
* M-Right built-in: Resize the pane right by 5
* C-p     tome: playbook book
* C-Up    built-in: Resize the pane up
* C-Down  built-in: Resize the pane down
* C-Left  built-in: Resize the pane left
* C-Right built-in: Resize the pane right
* S-Up    built-in: Move the visible part of the window up
* S-Down  built-in: Move the visible part of the window down
* S-Left  built-in: Move the visible part of the window left
* S-Right built-in: Move the visible part of the window right
*
