#!/bin/sh

(cd bundle/ ; sh move2_git.sh)

(cd notused_plugins/ ; sh ../bundle/move2_git.sh)

(cd notused_plugins/F ; sh ../../bundle/move2_git.sh)
