#!/bin/bash
mkdir -p ~/.vim

echo "Downloading vimrc from Github"
git clone https://github.com/ditsing/vimrc.git ~/.vim/vimrc

cd ~/.vim/vimrc
ln vimrc ~/.vimrc
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/bundle

echo "Installing plugins"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

echo "Installing Airline fonts"
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.vim/bundle/powerline-fonts
mkdir ~/.fonts
cp ~/.vim/bundle/powerline-fonts/UbuntuMono/*.ttf ~/.fonts

echo "Copy YCM general configuration files."
ln general_ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
echo "You need to compile YouCompleteMe. Install cmake first, then run"
echo '	cd ~/.vim/bundle/YouCompleteMe'
echo '	./install.sh --clang-completer'

cd -
