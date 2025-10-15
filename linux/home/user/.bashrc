# .bashrc

# Source global definitions

# only set/override it if we are not within tmux
if [[ -z "$TMUX" ]]; then
  #export TERM=xterm-256color
  export TERM='xterm-kitty'
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# AMD ACO compiler https://wiki.archlinux.org/index.php/AMDGPU#ACO_compiler
export RADV_PERFTEST=aco

#export TERM=xterm-256color
export TERM=xterm-kitty

# quote the color codes (see http://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly )
PS1="\[\033[1;34m\]\u@\h \[\033[1;32m\]\W\[\033[1;34m\]\\$\[\033[0m\] "

# unlimited history
export HISTFILESIZE= HISTSIZE=
export HISTCONTROL=ignoreboth:erasedups

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
#export IME="hime"
export IME="fcitx"

export XIM=${IME}
export QT4_IM_MODULE=${IME}
export QT5_IM_MODULE=${IME}
export QT_IM_MODULE=${IME}
export XMODIFIERS=@im=${IME}
export XIM_MODULE=${IME}
export SDL_IM_MODULE=${IME}
# If GTK2 application cannot activate fcitx5, set it to xim.
# Do not set GTK_IM_MODULE to xim globally as it affects GTK3 programs as well.
#export GTK_IM_MODULE=xim

# colors
export LS_COLORS="$(vivid generate solarized-dark)"
lscd() {
    export LS_COLORS="$(vivid generate solarized-dark)"
}
lscs() {
    export LS_COLORS="$(vivid generate snazzy)"
}

# colorify less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R -X'
#export LESS_TERMCAP_us=$(printf '\e[1;32m')

alias gksu='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'

# User specific aliases and functions
alias vi='nvim'

# change to directory of the given filepath
cdd() {
    cd "$(dirname $1)"
}
# copy to clipboard
if [[ ${XDG_SESSION_TYPE} =~ wayland ]]; then
    alias c='wl-copy -n'
else
    alias c='xclip -selection c -r'
fi

# copy the current directory path
pwdc() {
    pwd -P | c
}
# copy the full path of the file to clipboard; default is current (.)
_rl() {
    readlink -f "${1:-.}"
}
fdc() {
    _rl ${*} | c
}

# make a directory and cd to it
mcd() {
    mkdir -p ${*};
    # cd to the last directory
    cd "${@: -1}"
}

# colors
## test
function aa_256 ()
{
    local o= i= x=`tput op` cols=`tput cols` y= oo= yy=;
    y=`printf %$(($cols-6))s`;
    yy=${y// /=};
    for i in {0..256};
    do
        o=00${i};
        oo=`echo -en "setaf ${i}\nsetab ${i}\n"|tput -S`;
        echo -e "${o:${#o}-3:3} ${oo}${yy}${x}";
    done
}

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


eval $(dircolors -b)
alias ls='ls --color=auto'
alias l='ls -al --color --full-time'
alias lr='ls --sort=time -r'
alias lx='exa -algGB@'
#alias grep='grep --color=auto'
alias grep='grep --color=always'
alias docker_address="docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)"


# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l ""'
alias fzfp='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'

PATH=$PATH:~/.local/bin:~/.cargo/bin
