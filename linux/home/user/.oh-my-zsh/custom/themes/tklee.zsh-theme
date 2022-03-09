# zsh theme

_prompt_info_chunk() {
    local info=$1
    local open_delimiter=$2
    local close_delimiter=$3
    local info_color="${4:-007}"
    local delimiter_color="${5:-025}"

    info_color_str="%{$FG[${info_color}]%}"
    delimiter_color_str="%{$FG[${delimiter_color}]%}"

    echo "${delimiter_color_str}${open_delimiter}${info_color_str}${info}${delimiter_color_str}${close_delimiter}%{$reset_color%}"
}


# LEFT PROMPT
PROMPT=$'$(_prompt_info_chunk %n "┌[" "" "034")@$(_prompt_info_chunk %m "" "]" ${ZSH_HOSTNAME_COLOR:-"036"}) $(_prompt_info_chunk %~ "[" "]") $(_prompt_info_chunk %! "[" "]") $(_prompt_info_chunk %? "(" ")")
$(_prompt_info_chunk "%(!.#.$)" "└[" "]" "013") '

# RIGHT PROMPT (cursor up to move it to the previous line, print RPROMPT, and then move down again)
RPROMPT=$'%{\e[A%}[%D{%Y-%m-%d %H:%M:%S.%.}]%{\e[B%}'

