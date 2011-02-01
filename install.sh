#!/bin/sh

prefix=`pwd`

rm -rfv ~/.vim/
cp -vir $prefix/.vimrc ~/
cp -vr $prefix/.vim ~/



