#!/bin/zsh
emulate -L zsh
local A='A <a@example.com>'
local B='B <b@example.org>'
local C='C <c@example.gov>'
local -x HGRCPATH=''
. virtualenvwrapper.sh
(
    test -d hgtestrepo && rm -rf hgtestrepo
    workon mercurial-1.2
    hg init hgtestrepo
    cd hgtestrepo
    deactivate
    hg cat -R ../.. ../createrepo.zsh -r 71 > createrepo.zsh
    workon mercurial-1.2
    set -e
    set -x
    # XXX Date test will work only till 2099
    hg commit -A -m 'Added «createrepo.zsh»' \
        --date '1999-01-02 5:20' --user $A
    hg mv createrepo.zsh crepo.zsh
    hg commit -A -m 'Renamed «createrepo.zsh» to «crepo.zsh»' \
        --date '2000-01-05 7:30' --user $A
    perl -p -i -e 'tr/()/{}/' crepo.zsh
    hg commit -m $'Replaced\n    (\n        ...\n    )\nwith\n    {\n        ...\n    }' \
        --date '2000-01-15 15:00' --user $B
    hg mv crepo.zsh chgrepo.zsh
    hg commit -A -m 'Renamed «crepo.zsh» to «chgrepo.zsh»' \
        --date '2000-02-01 14:00' --user $B
    cat chgrepo.zsh | perl -p -i -e 'undef $_ unless /^    hg /' > hglines.lst
    cat chgrepo.zsh | perl -p -i -e 'undef $_ unless /^    hg /' > datelines.lst
    hg commit -A -m 'Added «hglines.lst» and «datelines.lst»' \
        --date '2000-05-10 4:23' --user $A
    hg branch A
    cat chgrepo.zsh | grep 'd' > dlines.lst
    hg commit -A -m 'Added dlines.lst' \
        --date '2000-11-01 13:24' --user $B
    hg branch B
    cat chgrepo.zsh | grep 'a' > alines.lst
    hg commit -A -m 'Added alines.lst' \
        --date '2000-11-02 5:44' --user $A
    hg branch C
    cat alines.lst | grep 'b' > ablines.lst
    hg commit -A -m 'Added ablines.lst' \
        --date '2000-11-02 14:13' --user $B
    hg tag ablines \
        --date '2000-11-02 14:14' --user $B
    hg update default
    hg merge -r ablines
    hg commit -m 'Merge from C' \
        --date '2001-01-01 00:00' --user $C
    hg update C
    cat chgrepo.zsh | grep 'b' > blines.lst
    hg commit -A -m 'Added blines.lst' \
        --date '2001-02-01 05:18' --user $A
    hg tag blines \
        --date '2001-02-01 05:19' --user $A
    hg update -r -2
    cat chgrepo.zsh | sort | grep 'c' > clines.lst
    hg commit -A -m 'Added clines.lst' \
        --date '2001-02-01 14:56' --user $B
    hg tag clines \
        --date '2001-02-01 14:56:52' --user $B
    hg update A
    hg merge -r B
    hg commit -m 'Merge from B' \
        --date '2002-01-01 00:00' --user $C
    hg merge -r clines
    hg commit -m 'Merge from C:2' \
        --date '2002-01-01 00:00:15' --user $C
    hg update default
    hg merge -r blines
    hg commit -m 'Merge from C:1' \
        --date '2002-01-01 00:00:30' --user $C
    hg merge -r A
    hg commit -m 'Merge from A' \
        --date '2002-01-01 00:00:45' --user $C
    hg cp hglines.lst hglines2.lst
    hg commit -A -m 'Copied “hglines.lst” to “hglines2.lst”' \
        --date '2002-02-10 05:00' --user $A
    cat chgrepo.zsh | perl -p -i -e 'undef $_ if /^    hg /' > nohglines.lst
    hg commit -A -m 'Added nohglines.lst' \
        --date '2002-02-10 15:33' --user $B
    cat nohglines.lst | rev > nohglinesrev.lst
    hg commit -A -m 'Added nohglinesrev.lst' \
        --date '2002-02-10 16:01' --user $B
    seq 1 10 | tr ' ' $'\n' > ignored10.lst
    hg commit -A -m 'Added ignored10.lst' \
        --date '2002-02-11 03:15' --user $A
    hg tag -r clines oldtag \
        --date '2002-02-11 03:16' --user $A
    cat chgrepo.zsh | grep 'e' > elines.lst
    cat chgrepo.zsh | grep 'f' > flines.lst
    cat chgrepo.zsh | grep 'g' > glines.lst
    hg commit -A -m 'Added elines.lst, flines.lst and glines.lst' \
        --date '2002-02-11 04:15' --user $A
    hg update -r -2
    cat chgrepo.zsh | grep 'ep' > elines.lst
    cat chgrepo.zsh | grep 'fr' > flines.lst
    cat chgrepo.zsh | grep 'gr' > glines.lst
    hg commit -A -m $'Added elines.lst with eplines\nAdded flines.lst with frlines\nAdded glines.lst with grlines' \
        --date '2002-02-11 04:15' --user $A
    hg merge || true # Merge must fail
    rm *.orig
    hg mv elines.lst emerged.lst
    hg rm -f flines.lst
    hg cp glines.lst glinescopy.lst
    hg resolve --mark --all
    hg commit -m 'Merge' \
        --date '2002-02-11 05:00' --user $C
    echo $'syntax: glob\nignored*' > .hgignore
    mkdir directory
    echo $'File contents' > directory/file
    hg commit -A -m $'Added .hgignore\nAdded directory/file' \
        --date '2002-02-11 05:43' --user $A
    echo abc >> nohglinesrev.lst
    echo 'Def' > addeddef && hg add addeddef
    hg rm hglines2.lst
    rm nohglines.lst
    cat hglines.lst | rev > hglinesrev.lst
    echo 'Abc' > ignoredabc
)
tar cJf hgtestrepo.tar.xz hgtestrepo
(
    test -d hgtestbranchedrepo && rm -rf hgtestbranchedrepo
    workon mercurial-1.2
    hg init hgtestbranchedrepo
    pushd hgtestbranchedrepo
    function branch() {
        local -r BRANCH=$1
        hg update default
        hg branch $BRANCH
        echo $BRANCH > a
        hg commit -m "Added branch $BRANCH" \
            --date '1990-01-01 00:00' --user A
    }
    echo a>a
    hg commit -A -m 'Added a' \
        --date '1990-01-01 00:00' --user A
    branch A
    branch B
    branch C
    branch D
    branch E
    branch F
)
tar cJf hgtestbranchedrepo.tar.xz hgtestbranchedrepo
