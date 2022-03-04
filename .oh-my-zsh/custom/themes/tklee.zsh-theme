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
# original
#PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}%!%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B(%b%{\e[0;33m%}%?%{\e[0;34m%}%B)%b%{\e[0m%}
#%{\e[0;34m%}%B└%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '


PROMPT=$'$(_prompt_info_chunk %n "┌[" "" "034")@$(_prompt_info_chunk %m "" "]" "036") $(_prompt_info_chunk %~ "[" "]") $(_prompt_info_chunk %! "[" "]") $(_prompt_info_chunk %? "(" ")")
$(_prompt_info_chunk "%(!.#.$)" "└[" "]" "013") '


# RIGHT PROMPT
RPROMPT='[%D{%Y-%m-%d %H:%M:%S.%.}]'

