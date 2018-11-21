#!/bin/bash
set -e
set -o pipefail

cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)
echo $DOTFILES_ROOT

brew bundle

setup_gitconfig () {
  if ! [ -f git/gitconfig.local.symlink ]
  then
    echo '-> setup gitconfig'

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    echo ' - What is your github author name?'
    read -e git_authorname
    echo ' - What is your github author email?'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.symlink.example > git/gitconfig.local.symlink

        echo 'gitconfig'
  fi
}

link_file () {
  local src=$1 dst=$2

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
      rm -rf "$dst"
      echo " ! removed $dst"
  fi

  ln -s "$1" "$2"
  echo " - linked $1 to $2"
}

install_dotfiles () {
  echo '-> installing dotfiles'

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

setup_gitconfig
install_dotfiles

echo "Done."
echo
