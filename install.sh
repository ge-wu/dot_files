#!/usr/bin/env bash


# ---------- Setup Vim ----------
 # cp ./home/.vimrc ~/
 # # Install vim-plug
 # if ! [ -x "$(command -v curl)" ]; then
 #     sudo pacman -S curl
 # fi
 # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
 #    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# # Install all the plugins

 # if [ -x "$(command -v ccls)" ]; then
 #     COC_C_LAN=coc-ccls
 # else if [ -x "$(command -v clang)" ]; then
 #     COC_C_LAN=coc-clangd
 # else
 #     echo "Did not find any C/C++ language server."
 # fi

 vim +PlugInstall +qall
 vim +CocInstall coc-python $COC_C_LAN coc-vimtex +qall

# Copy the helper scripts 
 cp -R ./home/.vim/script ~/.vim/script

 echo "Vim setup completed. "

 # -------- Setup bspwm & sxhkd ----------
 # sudo pacman -S bspwm sxhkd
