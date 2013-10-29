#!/bin/bash
mkdir -p ~/.vim

mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.swap
mkdir -p ~/.vim/.undo
mkdir -p ~/.vim/bundle

echo "Downloading vimfiles of ditsing from Github"
git clone https://github.com/ditsing/vimfiles.git ~/.vim/ditsing
cp ~/.vim/ditsing/vimrc ~/.vimrc

echo "Installing plugins"
git clone https://github.com/gmarik/vundle.git
vim -u ~/.vim/ditsing/bundles.vim +BundleInstall +qall

echo "Installing Airline fonts"
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.vim/powerline-fonts
mkdir -p ~/.fonts
cp powerline-fonts/UbuntuMono/*.ttf ~/.fonts

echo "Copy YCM general configuration files."
cp ~/.vim/ditsing/general_ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
echo "You need to compile YouCompleteMe. Install cmake first, then run"
echo '	cd ~/.vim/bundle/YouCompleteMe'
echo '	./install.sh --clang-completer'
