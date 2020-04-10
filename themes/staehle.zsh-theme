# ZSH Theme w/ Fish collapsed path and pretty colors.
# Based off of Sorin and inspiration from others.

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

local user_color='yellow'; [ $UID -eq 0 ] && user_color='red'

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"

  PROMPT='%{$fg[$user_color]%}%n%{$reset_color%}@%F{202}%m%{$reset_color%} %{$fg[cyan]%}$(_fishy_collapsed_wd)%{$reset_color%}$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%(?.%{$fg[green]%}.%{$fg[red]%})❯)%{$reset_color%} '

  ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='$(git_prompt_status)%{$reset_color%}'

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$reset_color%} ▪"
  ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[cyan]%} ✭"
else
  MODE_INDICATOR="❮❮❮"

  PROMPT='%n@%m $(_fishy_collapsed_wd)$(git_prompt_info) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=""
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ▪"
  ZSH_THEME_GIT_PROMPT_STASHED=" ✭"
fi
