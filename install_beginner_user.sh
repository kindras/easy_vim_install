#! /usr/bin/zsh

sudo apt-get update;
sudo apt-get install vim;
sudo apt-get install git;

#Create useful directory
mkdir -p ${HOME}/.vim/bundle
mkdir -p ${HOME}/.vim/colors

#Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
cp monokai.vim ${HOME}/.vim/colors/.
cp .vimrc_beginner ${HOME}/.vimrc

#Run the VundleUpdate from commandline
vim -c VundleUpdate -c quitall

#Create directory to describe multiple language configuration
mkdir -p ${HOME}/.vim/after/ftplugin/
cp c.vim ${HOME}/.vim/after/ftplugin/.
cp python.vim ${HOME}/.vim/after/ftplugin/.
