#!/bin/sh

unset GREP_OPTIONS

PROG="$(readlink -f bundle/move2_git.sh)"


(cd bundle/ ; sh "$PROG")

(cd notused_plugins/ ; sh "$PROG")

(cd notused_plugins/F ; sh "$PROG")

if test "a$1" = "a-a"; then
  (cd notused_plugins/Infrequent/ ; sh "$PROG")
fi

