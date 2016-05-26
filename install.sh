#!/bin/bash
# Install dot files

# just create symlinks to this dir
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/psqlrc ~/.psqlrc

mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
elif [[ "$unamestr" == 'Darwin' ]]; then
    brew install automake pkg-config pcre xz
fi
# install pathogen
curl -o ~/.vim/bundle/autoload/  https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# install other plugins
git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/
git clone https://github.com/klen/python-mode ~/.vim/bundle/
git clone https://github.com/scrooloose/nerdcommenter ~/.vim/bundle/
git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/
git clone https://github.com/ntpeters/vim-better-whitespace ~/.vim/bundle/
git clone https://github.com/Lokaltog/vim-powerline ~/.vim/bundle/
git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/
git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/
git clone https://github.com/rking/ag.vim ~/.vim/bundle/

# source personal rc-file
echo "source ~/.dotfiles/ibaguio-rc" >> ~/.bashrc
echo "source ~/.dotfiles/ibaguio-rc" >> ~/.zshrc
