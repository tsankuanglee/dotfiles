
export TERM=xterm-256color

# editor
set -o emacs
export EDITOR="nvim"
export VISUAL="nvim"

# tty
export GPG_TTY=`tty`

# LANG related
export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"
export LC_CTYPE="en_US.utf8"

# docker
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
export HOST_USERNAME=$(whoami)
export XSOCK=/tmp/.X11-unix
export XAUTH=/tmp/.docker.xauth

# IME
#export IME="gcin"
export IME="hime"
export XIM=${IME}
export QT4_IM_MODULE=${IME}
export QT5_IM_MODULE=${IME}
export QT_IM_MODULE=${IME}
export XMODIFIERS=@im=${IME}
export XIM_MODULE=${IME}
export GTK_IM_MODULE=xim


export PATH=$PATH:~/.local/bin
# remove duplicates
typeset -aU path