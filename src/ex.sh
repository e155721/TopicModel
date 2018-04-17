#!/bin/zsh

file=$1
cat "$file" | sed -e 's/@//g' | sed -e 's/^[A-Z]/@/' | tr '\n' ' ' | tr '@' '\n' | grep \^'B ' | grep -v '\- IM' | sed -e 's/B  -//' >"$file:r".clean
rm "$file"
