#!/usr/bin/env sh

homesick link anchor

# ubuntu check
OS=$(uname -s)
case $OS in
  Linux) 
    DISTRO=$(lsb_release -si)
    case $DISTRO in
      Ubuntu) 
        # echo "Ubuntu, great!"
        # Install all of the necessary packages for vim configuration
        PKG="sudo apt-get -q=2 install"
        ${PKG} git zsh python-pip curl fontconfig vim ruby ruby-dev
        ${PKG} python-pip python-dev python3 python3-dev python3-pip
        ;;
      *) 
        echo "Sorry, Linux distribution '$DISTRO' is not supported"
        exit 1
        ;;
    esac
    ;;
  *) 
    echo "Sorry, OS '$OS' is not supported"
    exit 1
    ;;
esac


if [ ! -d ${HOME}/.local/bin/Lokaltog/powerline ]
  then
    echo "# Installing powerline with pip"
    sudo pip install git+git://github.com/Lokaltog/powerline
  fi

echo "Installing Powerline fonts"
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo "# Installing Vundle"
git clone https://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/Vundle.vim

echo "# Installing Vim plugins using Vundle"
# Use the implicit newline from echo
echo | vim +BundleInstall +BundleClean +qall

echo "# Installing zsh"
${PKG} zsh
chsh -s /bin/zsh

echo "# Installing prezto"
zsh ./prezto.sh

echo "# Compiling YouCompleteMe"
bash ./youcompleteme.sh
