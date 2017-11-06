#!/bin/bash

home=~/.vim/

mv -f ./bundle/ $home
mv -f vimrc $home
ln -s vimrc ~/.vimrc