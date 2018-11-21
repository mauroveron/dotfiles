alias gc='git checkout'
alias gm='git merge --no-ff'
alias gs='git st'
alias gss='git sync'
alias gd='git diff'
alias gl='git l'
#alias gb='git branch'
alias gsu='git stash -u'
alias gsp='git stash pop'
alias gbc='git branch --merged | grep -v "\*" | grep -v master | grep -v dev | grep -v develop | xargs -n 1 git branch -d'

gpu() {
  git push origin `git branch | grep '^*' | cut -d ' ' -f 2`
}

gpl() {
    git pull --rebase origin `git branch | grep '^*' | cut -d ' ' -f 2`
}