#!/bin/bash

ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/vimrc ~/.vimrc

mkdir -p ~/.vim/bundle/

git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/
git clone https://github.com/klen/python-mode ~/.vim/bundle/
git clone https://github.com/scrooloose/nerdcommenter ~/.vim/bundle/
git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/
git clone https://github.com/ntpeters/vim-better-whitespace ~/.vim/bundle/
git clone https://github.com/Lokaltog/vim-powerline ~/.vim/bundle/
git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/

