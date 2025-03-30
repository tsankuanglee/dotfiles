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

# use nvim as man pager
export MANPAGER='nvim +Man!'

# change to directory of the given filepath
cdd() {
    cd "$(dirname $1)"
}
# copy to clipboard
case "$OSTYPE" in
  linux*)
    SESSION_TYPE=$(loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type | sed 's/Type=//g')
    if [[ ${SESSION_TYPE} =~ wayland ]]; then
      alias c='wl-copy -n'
    else
      alias c='xclip -selection c -r'
    fi
    ;;
  darwin*)
    alias c='pbcopy'
    ;;
  *)
    alias c='xclip -selection c -r'
    ;;
esac


# copy the current directory path
pwdc() {
    pwd -P | c
}
# copy the full path of the file to clipboard; default is current (.)
_rl() {
  case "$OSTYPE" in
    linux*)
      readlink -f "${1:-.}"
      ;;
    darwin*)
      OURPWD=$PWD
      cd "$(dirname "$1")"
      LINK=$(readlink "$(basename "$1")")
      while [ "$LINK" ]; do
        cd "$(dirname "$LINK")"
        LINK=$(readlink "$(basename "$1")")
      done
      REALPATH="$PWD/$(basename "$1")"
      cd "$OURPWD"
      echo "$REALPATH"
      ;;
    *)
      readlink -f "${1:-.}"
      ;;

    esac
}
# just view it
fdv() {
    _rl ${*} | sed -E 's/^(.*)$/\"\1\"/g'
}
# copy to clipboard
fdc() {
    _rl ${*} | sed -E 's/^(.*)$/\"\1\"/g' | c
}

# make a directory and cd to it
mcd() {
    mkdir -p ${*};
    # cd to the last directory
    cd "${@: -1}"
}

function color_test_256 ()
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

# fzf {{{
# ~/.fzf.zsh will source /usr/share/fzf/key-bindings.zsh and /usr/share/fzf/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l --color=always ""'
export FZF_DEFAULT_COMMAND='fd --type f --color=always'
export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}
_fzf_compgen_path() {
  # Use fd (https://github.com/sharkdp/fd) instead of the default find
  # command for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  fd --color=always --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  # Use fd to generate the list for directory completion
  fd --color=always --type d --hidden --follow --exclude ".git" . "$1"
}
# add hotkeys
export FZF_DEFAULT_OPTS="--multi --ansi --bind 'alt-g:toggle-all' --bind 'alt-v:preview(cat {})' --bind 'alt-V:toggle-preview' --bind 'alt-up:preview-page-up,alt-down:preview-page-down' --preview-window hidden"
alias fzfp='fzf --ansi --preview "bat --style=numbers --color=always --line-range :500 {}"'
# }}} fzf

# User specific aliases and functions
alias gksu='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'
alias vi='nvim'
alias vimdiff='nvim -d'

eval $(dircolors -b)
alias ls='ls --color=auto --time-style=long-iso'
alias l='ls -al --color'
alias lt='ls -al --sort=time'
alias lr='lt -r'
alias lx='eza -algGB@'
alias lz='eza -l --icons=always --hyperlink --bytes --git --time-style=long-iso'
alias lzr='lz --sort=time -r'
# columnized ls
alias cmn='awk '"'"'{print "⯀ " $0}'"'"' | fold -w 30 -s | column -c $(tput cols)'
alias lsc='ls -1 | cmn'

#alias grep='grep --color=auto'
alias grep='grep --color=always'

alias docker_address="docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)"

eval "$(zoxide init zsh)"

# vim: set foldmethod=marker :
