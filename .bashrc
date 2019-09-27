# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TERM=xterm-256color

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
# IME
export IME="gcin"
export GTK_IM_MODULE=${IME}
export XMODIFIERS=@im=${IME}
export QT_IM_MODULE=${IME}



# colorify less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R -X'
#export LESS_TERMCAP_us=$(printf '\e[1;32m')

# User specific aliases and functions
alias vi='nvim'

# change to directory of the given filepath
cdd() {
    cd `dirname "$1"`
}
# copy to clipboard
alias c='xclip -selection c -r'
# copy the current directory path
pwdc() {
    pwd -P | c
}
# copy the full path of the file to clipboard; default is current (.)
rl() {
    readlink -f "${1:-.}"
}
fdc() {
    rl | c
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


eval $(dircolors -b)
alias ls='ls --color=auto'
alias l='ls -al --color --full-time'
alias lx='exa -algGB@'
#alias grep='grep --color=auto'
alias grep='grep --color=always'



PATH=$PATH:~/bin:~/.local/bin
