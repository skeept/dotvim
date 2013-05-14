#!/bin/zsh
emulate -L zsh
cat runtime.tar.xz | unxz | (cd ../rtp && tar x)
