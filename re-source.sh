#!/bin/sh

prefix=`pwd`

cp -v ~/.bashrc $prefix
cp -v ~/.colorsrc $prefix
cp -v ~/.vimrc $prefix
cp -vr ~/.vim $prefix
rm $prefix/.vim/.netrwhist
