# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mveron"

plugins=(mveron gitfast zsh-syntax-highlighting vagrant)

source $ZSH/oh-my-zsh.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"

meldiff()
{
  git difftool  --tool=meld
}

pgrep()
{
  ps aux | grep -v grep | grep -i $1
}

alias tmux="TERM=screen-256color tmux"

alias :vst='vagrant status'
alias :vs='vagrant stop'
alias :vd='vagrant destroy'
alias :vblr='VBoxManage list runningvms'
alias :vbls='VBoxManage list vms'

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

vs() {
  if [ $# -gt 0 ]; then
    vagrant ssh $1
  else
    vagrant ssh
  fi
}

alias vss='vagrant status'
alias vr='vagrant reload'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vh='vagrant provision'

alias tn='tmux new -s '
alias tl='tmux ls'
alias ta='tmux a -t '
alias phpt="/usr/local/Cellar/ctags/5.8_1/bin/ctags -R --exclude='*.js' -f .ctags"
alias ap=ansible-playbook

## case-insensitive (all), partial-word and thenn substring (taken from https://github.com/christoomey/dotfiles)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
      'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

unsetopt correct_all

setopt auto_cd
cdpath=($HOME/code/mine)

export EDITOR=/usr/local/bin/vim

export PATH=$PATH:$HOME/.composer/vendor/bin

eval "$(pyenv init -)"

export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$HOME/code/go/bin

