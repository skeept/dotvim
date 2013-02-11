#!/bin/zsh
local -x TZ=UTC
local -x LANG=ru_RU.UTF-8
(
    test -d gittestrepo && rm -rf gittestrepo
    git init gittestrepo
    pushd gittestrepo
    mkdir subdir
    echo 'This is a file with newlines in filename' > $'\nstrange\nfilename\n'
    echo 'This is a file with “ -> ” in filename' > $'abc -> def'
    echo 'This is a file with a colon in filename' > $'HEAD:abc:10:def'
    echo 'This is a file with backslash in filename' > $'subdir/\\abc\\def\\'
    echo 'This is a file with name starting with dashes' > $'--force'
    echo 'This is a file with asterisk in filename' > '*'
    git add -- **/*
    git commit -m $'Added files with strange filenames:\n - filename with newline\n - filename containing “->”\n - filename with a colon\n - filename with "\\\\"\n - filename that looks like a command-line option\n - filename that looks like a glob' \
        --author 'Bob <bob@example.com>' --date '1990-01-01 12:00:00'
    git mv -- $'HEAD:abc:10:def' $'abc:10:def'
    git commit -m 'Moved HEAD:abc:10:def to abc:10:def' \
        --author 'Bob <bob@example.com>' --date '1990-01-01 12:01:00'
    git checkout HEAD^
    git checkout -b next
    git mv -- $'abc -> def' $'ghi -> jkl'
    git commit -m 'Moved “abc -> def” to “ghi -> jkl”' \
        --author 'Alice <alice@example.org>' --date '1990-01-01 13:01:25'
    git merge --no-commit master
    git commit -m 'Merge of branch master' \
        --author 'C <c@example.net>' --date '1990-01-01 13:04:47'
    git checkout master
    git merge --no-commit next^
    git commit -m 'Merge of branch next (next^)' \
        --author 'C <c@example.net>' --date '1990-01-01 13:05:08'
    git checkout next^^
    git checkout -b next2
    cp -- $'abc -> def' $'mno -> pqr'
    git add $'mno -> pqr'
    git commit -m 'Copied “abc -> def” to “mno -> pqr”' \
        --author 'Bob <bob@example.org>' --date '1990-01-01 12:21:25'
    git mv $'mno -> pqr' $'\\*'
    git commit -m 'Moved “mno -> pqr” to “\*”' \
        --author 'E <e@example.na>' --date '1990-01-01 12:24:24'
    git tag erevision
    git merge --no-commit next master
    git commit -m 'Merge of branch next and master' \
        --author 'C <c@example.net>' --date '1990-01-01 13:38:44'
)
tar cJf gittestrepo.tar.xz gittestrepo
(
    test -d gittestbranchedrepo && rm -rf gittestbranchedrepo
    git init gittestbranchedrepo
    pushd gittestbranchedrepo
    function branch() {
        local -r BRANCH=$1
        git checkout master
        git checkout -b $BRANCH
        echo $BRANCH > a
        git commit -a -m "Added branch $BRANCH" \
            --date '1990-01-01 00:00' --author 'A <a@example.pl>'
    }
    echo a>a
    git checkout -b master
    git add a
    git commit -m 'Added a' \
        --date '1990-01-01 00:00' --author 'A <a@example.pl>'
    branch A
    branch B
    tar cJf ../drivers-git-first-two.tar.xz .
    branch C
    branch D
    branch E
    branch F
)
tar cJf gittestbranchedrepo.tar.xz gittestbranchedrepo
