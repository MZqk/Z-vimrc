#!/bin/bash
mv -f ./bundle/ ~/.vim/bundle
mv -f vimrc ~/.vim/vimrc
cd ~/.vim/
ln -s vimrc ~/.vimrc
