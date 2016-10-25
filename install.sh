
# Install dot files
# Includes installation & configuration for:
#   tmux, vim, and other command line necesseties
#  TMUX
#    - tmux-plugin-manager (tpm)
#    - tmux-yank

# GENERAL INSTALLATIONS
# copy this directory to ~/.dotfiles
cp -r `pwd` ~/.dotfiles
cd ~/.dotfiles/

# just create symlinks to this dir
ln -sf `pwd`/tmux.conf ~/.tmux.conf
ln -sf `pwd`/vimrc ~/.vimrc
ln -sf `pwd`/psqlrc ~/.psqlrc
ln -sf `pwd`/my.cnf ~/.my.cnf

mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/autoload/

# OS Specific installations
echo "Installing OS specific packages"
unamestr=`uname`
# DEBIAN LINUX
if [[ "$unamestr" == 'Linux' ]]; then
    sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev xclip
    echo "alias pbcopy='xclip -selection clipboard'" > ~/.bashrc
    echo "alias pbpaste='xclip -selection clipboard -o'" > ~/.zshrc
# OSX
elif [[ "$unamestr" == 'Darwin' ]]; then
    brew install automake pkg-config pcre xz
fi

# VIM INSTALLATION
echo "Installing VIM"
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

# TMUX INSTALLATIONS
echo "Installing tmux"
# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm tmux/plugins/tpm

# source personal rc-file
echo "for f in ~/.dotfiles/ibaguio-rc/*; do source $f; done > ~/.bashrc
echo "for f in ~/.dotfiles/ibaguio-rc/*; do source $f; done > ~/.zshrc

echo "Instalation completed!"
