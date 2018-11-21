# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME=af-magic
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias tap="terraform apply"

## case-insensitive (all), partial-word and thenn substring (taken from https://github.com/christoomey/dotfiles)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
      'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

unsetopt correct_all

export EDITOR=/usr/local/bin/vim