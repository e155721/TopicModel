#!/bin/zsh

file=$1
cat "$file" | sed -e 's/@//g' | sed -e 's/AB  /@AB  /' | sed -e 's/CI  /@CI  /' | tr '\n' ' ' | tr '@' '\n' | grep \^'AB  ' | sed -e 's/AB *\-//' >"$file:r".clean.txt
rm "$file"
