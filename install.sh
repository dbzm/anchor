#!/usr/bin/env sh

set -ex

homesick link anchor

# ubuntu check
OS=$(uname -s)
case $OS in
  Linux) 
    DISTRO=$(lsb_release -si)
    case $DISTRO in
      Ubuntu) 
        echo "# Ubuntu, great!"

        echo "# update and upgrade"
        sudo apt-get update
        sudo apt-get upgrade

        PKG="sudo apt-get -q=2 install"
        ${PKG} landscape-common update-notifier
        AG_SEARCH=silversearcher-ag
        ;;
      *) 
        echo "Sorry, Linux distribution '$DISTRO' is not supported"
        exit 1
        ;;
    esac
    ;;
  Darwin)
    echo "# Ok, it's a mac"
    # Is brew installed?
    if [ ! -e /usr/local/bin/brew ]
      then
        echo "Brew is not installed.  Installing Brew"
        # Macs should already have ruby
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [ ! $? -eq 0 ]; then
          echo "Brew install failed.  Install brew and try again."
          return 1
        fi
        echo "# Brew install confirmed. Proceeding"
    fi
    brew update
    brew upgrade
    PKG="brew install"
    
    # Don't use mac system python
    brew install python
    ;;
  *) 
    echo "Sorry, OS '$OS' is not supported"
    exit 1
    ;;
esac

${PKG} git zsh python-pip curl fontconfig vim ruby ruby-dev tmux screen
${PKG} python-dev python3 python3-dev python3-pip python3-flake8
${PKG} ${AG_SEARCH:-the_silver_searcher}

echo "# Installing powerline"
zsh ./powerline.sh

echo "# Installing Vundle"
git clone https://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/Vundle.vim

echo "# Installing Vim plugins using Vundle"
# Use the implicit newline from echo
echo | vim +BundleInstall +BundleClean +qall

echo "# change to zsh"
chsh -s /bin/zsh

echo "# Installing prezto"
zsh ./prezto.sh

echo "# updating motd"
zsh ./motd.sh | sudo tee /etc/motd

echo "# Compiling YouCompleteMe"
bash ./youcompleteme.sh
