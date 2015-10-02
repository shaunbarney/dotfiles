function topcorner {
  echo "%{$fg[blue]%}┌"
}

function botcorner {
  echo "%{$fg[blue]%}└"
}

function bracket {
  [ -n "$1" ] && echo -n "%{$fg[blue]%}[$1%{$fg[blue]%}]"
  echo " "
}

function user {
	echo "%{$fg[green]%}%n%{$fg_bold[white]%}@%b%{$fg[cyan]%}%m"
}

function directory {
  echo "%{$fg[white]%}%~"
}

function venv_prompt_info {
  [ $VIRTUAL_ENV ] && echo $(bracket %{$fg[cyan]%}`basename $VIRTUAL_ENV`)
}

function prompt_info {
  echo "%(?.%{$fg[magenta]%}.%{$fg[red]%})%(!.#.$)"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"

PROMPT=$'$(topcorner)$(bracket $(user))$(bracket $(directory))$(bracket $(git_prompt_info))$(venv_prompt_info)
$(botcorner)$(bracket $(prompt_info))%{$fg[white]%}'
