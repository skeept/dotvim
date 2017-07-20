#!/bin/zsh
() {
    emulate -L zsh
    (( ISWINE )) && local -x TMPDIR='T:'
    local -x ETMPDIR=${${TMPDIR//\//%-}//:/%.}
    perl -p -i -e 's/%(E?TMPDIR)%/$ENV{$1}/g' *.ok
}
