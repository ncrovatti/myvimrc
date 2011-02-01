#!/bin/sh

prefix=`pwd`

cp -v ~/.vimrc $prefix
cp -vr ~/.vim $prefix
rm $prefix/.vim/.netrwhist
