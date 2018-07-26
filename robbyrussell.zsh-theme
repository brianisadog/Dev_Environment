local dollar_sign="%(?:\$:%F{196}\$)"
PROMPT='%*%f %F{green}%n@%m%f %B%F{cyan}%~%f%b%B%F{blue}$(git_prompt_info)%f%b${dollar_sign} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" git:(%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%f%F{blue})%f%F{yellow}x%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%f%F{blue})"
