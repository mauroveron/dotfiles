autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $(git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_branch)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_branch)%{$reset_color%}"
    fi
  fi
}

git_email() {
  if $(! git status -s &> /dev/null)
  then
    echo ""
  else
    local email=$(git config user.email)
    if [[ $email == "" ]]
    then
      echo "[no-user]"
    else
      echo "[%{$fg_bold[red]%}$email%{$reset_color%}]"
    fi
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

set_prompt () {
  export PROMPT="$(directory_name) $(git_dirty) $(git_email) $ "
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
#   title "zsh" "%m" "%55<...<%~"
  set_prompt
}
