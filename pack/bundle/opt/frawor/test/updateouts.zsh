#!/bin/zsh

autoload colors && colors

typeset -xr TMPDIR=$0:A:h:h:h/repository/tmp
typeset -gr PREFIX=${PREFIX:-.}

function copyout()
{
    othername=$TMPDIR/test/$1
    cp $othername.out $PREFIX/$1.ok
    [[ ${PREFIX[-4,-1]} == wine ]] && local -x TMPDIR='T:'
    perl -p -i -e 's/\Q$ENV{"TMPDIR"}\E/%TMPDIR%/g' $PREFIX/$1.ok
}

cd $0:a:h

test -d $PREFIX || mkdir $PREFIX

if test -e $TMPDIR/failed.lst ; then
    cat $TMPDIR/failed.lst | cut -d' ' -f 2 | \
        while read l ; do
            othername=$TMPDIR/test/$l
            echo
            diff -a -y $othername.ok $othername.out
            echo -n "\n\e[${color[yellow]}mUpdate $l?\e[0m "
            read -q update || continue
            copyout $l
        done
fi

for TEST in $TMPDIR/test/*.in ; do
    TEST=$TEST:t:r
    test -e $TEST.ok && continue
    othername=$TMPDIR/test/$TEST
    test -e $othername.out || continue
    echo
    cat $othername.out
    echo -n "\n\e[${color[yellow]}mCopy $TEST?\e[0m "
    read -q copy || continue
    copyout $TEST
done
