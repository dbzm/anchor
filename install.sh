#!/usr/bin/env sh

CONFIG_FILE=${HOME}/.config/dmconfig

# ubuntu check
OS=$(uname -s)
case $OS in
  Linux) 
    DISTRO=$(lsb_release -si)
    case $DISTRO in
      Ubuntu) 
        # echo "Ubuntu, great!"
        # Install all of the necessary packages for vim configuration
        sudo apt-get -q=2 install git zsh python-pip curl fontconfig vim ruby ruby-dev \ 
            libx11-dev libxt-dev libgtk2.0-dev libncurses5 ncurses-dev \
            python-dev python3 python3-dev python3-pip
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


if [[ ! -d ${HOME}/.local/bin/Lokaltog/powerline]]
    echo "# Installing Powerline with pip"
    pip install --user git+git://github.com/Lokaltog/powerline

echo "# Installing Powerline fonts"
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo "# Installing Vundle"
git clone https://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle

echo "# Installing Vim plugins using Vundle"
vim +BundleInstall! +BundleClean +qall
