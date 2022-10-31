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
alias c='xclip -selection c -r'
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


eval $(dircolors -b)
alias ls='ls --color=auto'
alias l='ls -al --color --full-time'
alias lr='ls --sort=time -r'
alias lx='exa -algGB@'
#alias grep='grep --color=auto'
alias grep='grep --color=always'

eval "$(zoxide init zsh)"

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l ""'

