#!/bin/bash
# Install dot files

# copy this directory to ~/.dotfiles
cp -r `pwd` ~/.dotfiles
cd ~/.dotfiles/

# just create symlinks to this dir
ln -sf `pwd`/tmux.conf ~/.tmux.conf
ln -sf `pwd`/vimrc ~/.vimrc
ln -sf `pwd`/psqlrc ~/.psqlrc

mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
elif [[ "$unamestr" == 'Darwin' ]]; then
    brew install automake pkg-config pcre xz
fi
# install pathogen
curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -o ~/.vim/autoload/pathogen.vim

# install molokai colors
mkdir -p ~/.vim/colors
curl https://github.com/tomasr/molokai.vim -o ~/.vim/colors/molokai.vim

cd ~/.vim/bundle
# install other plugins
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/klen/python-mode
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/ntpeters/vim-better-whitespace
git clone https://github.com/Lokaltog/vim-powerline
git clone https://github.com/airblade/vim-gitgutter
git clone http://github.com/sjl/gundo.vim.git
git clone https://github.com/rking/ag.vim

# source personal rc-file
echo "source ~/.dotfiles/ibaguio-rc" >> ~/.bashrc
echo "source ~/.dotfiles/ibaguio-rc" >> ~/.zshrc
