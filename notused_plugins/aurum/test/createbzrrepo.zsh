#!/bin/zsh
emulate -L zsh
local A='A <a@example.com>'
local B='B <b@example.org>'
local C='C <c@example.gov>'
export TZ=UTC
(
    test -d bzrtestrepo && rm -rf bzrtestrepo
    mkdir bzrtestrepo
    cd bzrtestrepo
    bzr init A
    pushd A
    bzr nick A
    echo $'First line\nSecond line\nThird line\nFourth line' > lines.lst
    bzr add lines.lst
    bzr commit -m 'Added lines.lst' \
        --author $A --commit-time='1990-01-01 00:00:00 +0000'
    popd
    bzr branch A B
    pushd B
    bzr nick B
    echo Fifth line >> lines.lst
    bzr commit -m 'Added fifth line to lines.lst' \
        --author $B --commit-time='1990-01-01 01:00:00 +0000'
    popd
    bzr branch A C
    pushd C
    bzr nick C
    perl -p -i -e 's/First/1’st/' lines.lst
    bzr commit -m 'Replaced “First” with “1’st” in lines.lst' \
        --author $B --commit-time='1990-01-01 01:00:00 +0000'
    popd
    pushd A
    bzr merge ../B
    bzr merge ../C --force
    bzr commit -m 'Merged B and C' \
        --author $C --commit-time='1990-01-01 02:00:00 +0000'
    popd
    pushd B
    echo Sixth line >> lines.lst
    bzr commit -m 'Added sixth line to list.lst' \
        --author $C --commit-time='1991-01-15 02:24:32 +0000'
    popd
    pushd C
    bzr pull
    perl -p -i -e 's/Second/2’nd/' lines.lst
    bzr commit -m 'Replaced “Second” with “2’nd” in lines.lst' \
        --author $A --commit-time='1992-01-16 04:22:33 +0400'
    popd
    pushd A
    bzr merge ../B
    bzr commit -m 'Merged B' \
        --author $C --commit-time='1992-01-17 02:00:00 +0000'
    bzr merge ../C
    bzr commit -m 'Merged C' \
        --author $C --commit-time='1992-01-17 02:01:00 +0000'
    popd
    pushd B
    bzr pull
    bzr rename lines.lst bzrlines.lst
    echo 'Seventh line' >> bzrlines.lst
    bzr commit -m 'Renamed lines.lst to bzrlines.lst, added seventh line' \
        --author $C --commit-time='1993-01-01 00:00:00 +0000'
    popd
    pushd C
    bzr pull
    perl -p -i -e 's/Third/3’rd/' lines.lst
    bzr commit -m 'Replaced “Third” with “3’rd”' \
        --author $B --commit-time='1993-01-02 00:00:00 +0000'
    popd
    pushd A
    bzr merge ../B
    bzr commit -m 'Merged B' \
        --author $A --commit-time='1993-01-02 00:00:00 +0000'
    bzr merge ../C
    bzr commit -m 'Merged C' \
        --author $B --commit-time='1993-01-02 00:00:00 +0000'
    popd
    pushd A
    mkdir subdir
    bzr add subdir
    bzr commit -m 'Added subdir' \
        --author $C --commit-time='1993-01-02 00:00:00 +0000'
    echo $'line 1\nline 2\nline 3\nline 4\nline 5' > subdir/sublines.lst
    bzr add subdir/sublines.lst
    bzr commit -m 'Added subdir/sublines.lst' \
        --author $A --commit-time='1994-01-02 00:00:00 +0040'
    popd
    pushd A
    bzr tag --revision -4 rev-4
    bzr tag -- --force
    bzr config parent_location=.
    popd
    pushd A
    bzr ignore 'a*'
    bzr commit -m 'Added .bzrignore' \
        --author $A --commit-time='1994-01-02 00:00:01 +0040'
    touch a $'a\n'
    popd
    pushd B
    bzr pull
    echo 0>removed
    echo 1>deleted
    echo 2>moved
    echo 3>selfmoved
    echo 4>modified
    echo 5>forgotten
    bzr add .
    truncate --size=0 .bzrignore
    bzr ignore ignored
    bzr commit -m 'Added removed, deleted and moved' \
        --author $A --commit-time='1994-01-02 00:00:02 +0040'
    echo a>unknown
    echo b>added
    echo c>ignored
    echo d>added-removed
    echo e>modified
    bzr add added added-removed
    bzr remove removed added-removed
    bzr remove --keep forgotten
    rm deleted
    bzr mv moved moved-new
    mv selfmoved selfmoved-new
    popd
)
tar cJf bzrtestrepo.tar.xz bzrtestrepo
