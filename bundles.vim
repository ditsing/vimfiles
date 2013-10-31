set nocompatible
filetype off        " Don't know why this is required.

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ditsing/vimfiles'
Bundle 'ditsing/vim-quickrunner'

Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'

Bundle 'a.vim'
Bundle 'taglist.vim'
Bundle 'altercation/vim-colors-solarized'

Bundle 'ervandew/supertab'
Bundle 'airblade/vim-gitgutter'
"Bundle 'tpope/pathogen'
Bundle 'tpope/vim-surround'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'bling/vim-airline'

Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'

Bundle 'majutsushi/tagbar'
Bundle 'bufexplorer.zip'
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

filetype plugin indent on
