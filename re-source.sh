#!/bin/sh

prefix=`pwd`

cp -v ~/.bashrc $prefix
cp -v ~/.colorsrc $prefix
cp -v ~/.vimrc $prefix
cp -vr ~/.vim $prefix
cp -v ~/.gitconfig $prefix
cp -vr ~/.xmonad $prefix


# xcompmgr -cfF -I-.015 -O-.03 -D1.5 -t-5 -l-5 -r4.2 -o.75
rm $prefix/.vim/.netrwhist
