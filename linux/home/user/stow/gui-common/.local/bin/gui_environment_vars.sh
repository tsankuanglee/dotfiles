#!/usr/bin/bash
#
USER_ID=$(id -u "$USER")

# 1. Get the ID of the first active graphical session for your user
# This works even if the script is run by root/kanata
SESSION_ID=$(loginctl list-sessions | grep "$USER" | awk '{print $1}' | head -n 1)

# 2. Extract the variables from that specific session
# 'loginctl show-session' is usually readable without special root privileges 
# depending on your polkit rules, but if called by kanata (root), it's no problem.
XDG_SESSION_TYPE=$(loginctl show-session "$SESSION_ID" -p Type --value)
XDG_RUNTIME_DIR="/run/user/$(id -u "$USER")"
# 2. Find the Wayland socket by looking in the runtime directory
# We look for a file starting with 'wayland-' (usually wayland-0 or wayland-1)
WAYLAND_SOCKET=$(find "$XDG_RUNTIME_DIR" -maxdepth 1 -name "wayland-*" -not -name "*.lock" -printf '%f\n' | head -n 1)


# most of the time it's correct
#export WAYLAND_DISPLAY="$WAYLAND_SOCKET"
# more robust
for socket in "$XDG_RUNTIME_DIR"/wayland-*; do
    # -S checks if it's a socket
    if [ -S "$socket" ]; then
        # Use socat to see if something is actually answering on the other end
        if socat -u OPEN:/dev/null "UNIX-CONNECT:$socket" 2>/dev/null; then
            export WAYLAND_DISPLAY="${socket##*/}"
            break
        fi
    fi
done


export XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR"
export XDG_SESSION_TYPE="$XDG_SESSION_TYPE"

