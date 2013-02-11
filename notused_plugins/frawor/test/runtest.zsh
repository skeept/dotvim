#!/bin/zsh
cd $0:h
typeset -gxr TESTDIR=$PWD
ct=${1%%.in}
shift
rm -f $ct.out
if [[ $1 == 1 ]] ; then
    shift
    export LANG=C
fi
vim $@ -u ../vimrc --cmd "let g:curtest=${(qqq)ct}" -s <(cat $ct.in)
