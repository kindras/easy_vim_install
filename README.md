# easy_vim_install
Quick setup up for vim

This aim of this quick script is to provide an easy setup of vim for my friends who are not really comfortable with vim, but want to start to code/edit with this powerful editor.

##Content of the configuration
I embedded several existing packages such as:
- __Vundle__ to manage plugins.  [Link to the project](https://github.com/VundleVim/Vundle.vim)
- __fugitive__ in order to provide Git command inside Vim. [link to the project](https://github.com/tpope/vim-fugitive)
- __Syntastic__ plugin to allow my friend to check their code without quit and compile their code. [link to the project](https://github.com/vim-syntastic/syntastic)
- __Doxygen__ plugin to ease the documentation creation with doxygen. [link to the project](https://github.com/vim-scripts/DoxygenToolkit.vim)

Then I propose the following configuration.

- Monokai colorscheme to check diffs with vimdiffs. The config is smooth and not aggressive (compared to the default theme)
- Quick shortcut to move from a window to another one
- Display the name of the file at the bottom of the screen, and numbers
- Basic indentation style, without tabs.
- Adding the after/ftplugin folders to be able to describe specific configuration for each language
