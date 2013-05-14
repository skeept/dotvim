#!/bin/zsh
emulate -L zsh

typeset -r LOGFILE=$PWD/gentests-setuptestrepos.log

function silent()
{
    echo "{{{1 Running "${(q)@} > $LOGFILE
    $@ >$LOGFILE
}

unxz hgtestrepo.tar.xz
tar xf hgtestrepo.tar
unxz svntestreposerver.tar.xz

for test in cmd-annotate-buffers cmd+maps-commit cmd-record cmd-status \
            maps-status cmd+maps-vimdiff cmd-diff cmd-update opts-remembermsg \
            opts-vimdiffusewin cmd-vimdiff-full cmdaus maps-record-undo \
            maps-commit-diff
do
    ln -s util-add-modified-repo.zsh $test.pre
done

for test in *.in ; do
    test=$test:r
    test -x $test.pre && continue
    ln -s util-add-cloned-repo.zsh $test.pre
done
# vim: fmr=▶,▲ ts=4 sts=4 sw=4 et
