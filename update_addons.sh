#!/bin/sh

unset GREP_OPTIONS

PROG="$(readlink -f bundle/move2_git.sh)"


(cd bundle/ ; sh "$PROG")

(cd pack/bundle/start/ ; sh "$PROG")

(cd pack/bundle/opt/ ; sh "$PROG")

git status
