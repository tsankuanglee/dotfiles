#export TERM=xterm-256color
export TERM=xterm-kitty


# editor
set -o emacs
export EDITOR="nvim"
export VISUAL="nvim"

# tty
export GPG_TTY=`tty`

# LANG related
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# IME
#export IME="gcin"
#export IME="hime"
export IME="fcitx"

export XIM=${IME}
export QT4_IM_MODULE=${IME}
export QT5_IM_MODULE=${IME}
export QT_IM_MODULE=${IME}
export XMODIFIERS=@im=${IME}
export XIM_MODULE=${IME}
export SDL_IM_MODULE=${IME}
export INPUT_METHOD=${IME}
export GLFW_IM_MODULE=ibus
# If GTK2 application cannot activate fcitx5, set it to xim.
# Do not set GTK_IM_MODULE to xim globally as it affects GTK3 programs as well.
#export GTK_IM_MODULE=xim

# docker
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
export HOST_USERNAME=$(whoami)
export XSOCK=/tmp/.X11-unix
export XAUTH=/tmp/.docker.xauth

# add .local/bin
export PATH=$PATH:~/.local/bin

# Mac prefer linux coreutil (homebrew)
case "$OSTYPE" in
  darwin*)
    # Detect architecture
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
      # For x86 Mac
      export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
      export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
    elif [ "$ARCH" = "arm64" ]; then
      # For Apple Silicon Mac (M1/M2/etc.)
      export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
      export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"
    fi
    ;;
esac


# Perl
PATH="~/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="~/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="~/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"~/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=~/perl5"; export PERL_MM_OPT;

# Rust
export PATH=$PATH:~/.cargo/bin

# workaround QT icon too big bug
export QT_SCALE_FACTOR=1.01

