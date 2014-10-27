function venv_prompt_info {
    [ $VIRTUAL_ENV ] && echo $(bracket %{$fg_bold[cyan]%}`basename $VIRTUAL_ENV`)
}

function user {
	echo %{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m
}

function path {
	echo %{$fg_bold[white]%}%~
}

function bracket {
	echo %{$fg_bold[blue]%}'['$1%{$fg_bold[blue]%}']'
}

PROMPT=$'%{$fg_bold[blue]%}┌$(bracket $(user)) $(bracket $(path))$(git_prompt_info) $(venv_prompt_info)
%{$fg_bold[blue]%}└%{$fg_bold[blue]%}[%(?.%{$fg_bold[magenta]%}.%{$fg[red]%})%(!.#.$)%{$fg_bold[blue]%}]%{$reset_color%}%b'

RPROMPT=$'%{$fg[blue]%}%B[%b%{\e[0;33m%}'%D{"%I:%M%P, %Y-%m-%d"}%b$'%{$fg[blue]%}%B%{]%}%b%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %B%{$fg[blue]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
