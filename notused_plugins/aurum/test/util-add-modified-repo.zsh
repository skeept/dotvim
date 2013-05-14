#!/bin/zsh
mkdir ${CURTEST}repo
(
    cd ${CURTEST}repo
    tar x --strip-components=1 < ../hgtestrepo.tar
)
