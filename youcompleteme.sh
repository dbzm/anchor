#!/bin/bash

set -ex

YCM=${HOME}/.vim/bundle/YouCompleteMe

if [ ! -d ${YCM} ]; then
    echo "YouCompleteMe not installed!"
    return 1
fi

sudo apt-get install -q=2 python-dev build-essential cmake 
    
cd ${YCM}
./install.sh --clang-completer
