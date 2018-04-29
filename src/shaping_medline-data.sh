#!/bin/zsh

file=$1
<"$file" | sed -e 's/@//g' | sed -e 's/^/@/' | sed -e 's/^@[ ]//' | sed -e 's/^[ ]*//' | tr '\n' ' ' | tr '@' '\n' | grep \^'AB' | sed -e 's/AB  - //' >"$file:r".clean
rm "$file"
