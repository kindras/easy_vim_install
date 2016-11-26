#! /usr/bin/zsh

sudo apt-get update;
sudo apt-get install vim;
sudo apt-get install git;

#Create useful directory
mkdir -p ${HOME}/.vim/bundle

#Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
cp .vimrc_beginner ${HOME}/.vimrc

#Run the VundleUpdate from commandline
vim -c VundleUpdate -c quitall
