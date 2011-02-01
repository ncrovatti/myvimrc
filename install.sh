#!/bin/sh

prefix=`pwd`

rm -rfv ~/.vim/
cp -vir $prefix/.vimrc ~/
cp -vir $prefix/.bashrc ~/
cp -vr $prefix/.vim ~/



