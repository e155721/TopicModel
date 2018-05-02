#!/bin/zsh

file=$1

<"$file" tr '"' ' ' | sed -e 's/[ ]*//' | sed -e 's/  / \& /' | sed -e 's/$/ \\\\ \\hline/' | sed -e 1,2d | pbcopy
