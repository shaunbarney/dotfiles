PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;00m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} $(git_prompt_info)
%{\e[0;34m%}%B└─%B[%(?.%{\e[1;35m%}.%{$fg[white]%})$%{\e[0;34m%}%B]%{\e[0m%}%b '
RPROMPT=$'%{\e[0;34m%}%B[%b%{\e[0;33m%}'%D{"%I:%M%P, %Y-%m-%d"}%b$'%{\e[0;34m%}%B%{]%}%b%{\e[0m%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{\e[0;34m%}%B["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{\e[0;34m%}%B]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
