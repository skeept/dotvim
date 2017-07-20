#!/bin/zsh
function copostproc()
{
    [[ ${PREFIX[-4,-1]} == wine ]] && local -x TMPDIR='T:'
    perl -p -i -e 's/\Q$ENV{"TMPDIR"}\E/%TMPDIR%/g' $1
}
copostproc $@
