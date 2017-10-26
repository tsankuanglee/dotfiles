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

# colorify less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R -X'
#export LESS_TERMCAP_us=$(printf '\e[1;32m')

# User specific aliases and functions
alias vi='nvim'
alias ls='ls --color=auto'
eval $(dircolors -b)
alias l='ls -al --color --full-time'
# change to directory of the given filepath
cdd() {
    cd `dirname "$1"`
}
# copy the current directory path
pwdc() {
    pwd -P | xclip -selection c -r
}
#alias grep='grep --color=auto' 
alias grep='grep --color=always' 
export EDITOR="vim"

GPG_TTY=`tty` 
export GPG_TTY 
