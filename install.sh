#!/bin/bash

prefix=`pwd`
rm -rfv ~/.vim/
cp -vir $prefix/.vimrc ~/
cp -vir $prefix/.bashrc ~/
cp -vir $prefix/.colorsrc ~/
cp -vr $prefix/.vim ~/

. ~/.bashrc

