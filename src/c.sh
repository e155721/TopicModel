#!/bin/zsh

file=$1
nkf --overwrite -wLu $file
cat $1 | sed -e 's/\[.*\]//g' | sed -e 's/{.*}//g' | grep -v jpg | grep -v png | grep -v svg | sed -e 's/(.*)//g'  | sed -e 's/[0-9]//g' | tr '\n' ' ' >${file:r}.txt
rm -f $file:r
