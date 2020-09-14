#!/usr/bin/env bash

 cp ./home/.vimrc ~/

 # Install vim-plug
 if ! [ -x "$(command -v curl)" ]; then
     sudo pacman -S curl
 fi
 curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install all the plugins
 vim +PlugInstall +qall
# Copy the helper scripts 
 cp -R ./home/.vim/script ~/.vim/script

 echo "Vim setup completed. "








































