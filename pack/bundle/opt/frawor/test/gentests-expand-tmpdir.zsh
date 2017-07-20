#!/bin/zsh
() {
    emulate -L zsh
    [[ ${TESTTYPE[-4,-1]} == wine ]] && local -x TMPDIR='T:'
    perl -p -i -e 's/%TMPDIR%/$ENV{"TMPDIR"}/g' *.ok
}
