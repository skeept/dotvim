#!/bin/sh

unset GREP_OPTIONS

PROG="$(readlink -f pack/bundle/opt/move2_git.sh)"


(cd pack/bundle/start/ ; sh "$PROG")

(cd pack/bundle/opt/ ; sh "$PROG")

git status
