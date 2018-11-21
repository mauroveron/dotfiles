alias :vs='vagrant stop'
alias :vd='vagrant destroy'

alias vss='vagrant status'
alias vr='vagrant reload'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vp='vagrant provision'

vs() {
  if [ $# -gt 0 ]; then
    vagrant ssh $1
  else
    vagrant ssh
  fi
}