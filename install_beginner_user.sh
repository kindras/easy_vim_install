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
[ -s ${HOME}/.vimrc ] && mv ${HOME}/.vimrc ${HOME}/.vimrc_before_easy_vim_install
cp .vimrc_beginner ${HOME}/.vimrc

#Run the VundleUpdate from commandline
vim -c VundleUpdate -c quitall

#Create directory to describe multiple language configuration
mkdir -p ${HOME}/.vim/indent
cp c.vim cpp.vim python.vim  ${HOME}/.vim/indent/.

#adding dictionaries
mkdir -p ${HOME}/.vim/spell
cp en.utf-8.add en.utf-8.add.spl fr.utf-8.spl ${HOME}/.vim/spell/.

#adding custom plugin for cscope
mkdir -p ${HOME}/.vim/plugins
cp cscope_maps.vim ${HOME}/.vim/plugins
