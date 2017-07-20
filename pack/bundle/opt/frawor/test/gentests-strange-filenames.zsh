#!/bin/zsh
() {
    emulate -L zsh
    setopt bsdecho
    typeset -a chars
    typeset -A charnames
    if [[ ${TESTTYPE[-4,-1]} == wine ]] ; then
        set -A chars $' '
        local -xr TESTDIR='T:\test'
    else
        set -A chars $' ' $'\n'
        charnames[${chars[2]}]=newline
        local -xr TESTDIR="${PWD:A}"
    fi
    charnames[${chars[1]}]=space
    nl=$'\n'
    : ${TESTRTP:=${PWD:A}}
    for char in $chars ; do
        rtp="${TESTDIR}/rtp$char"
        rtp="${${(qqq)rtp}//$nl/\\n}"
        realrtp="${PWD:A}/rtp$char"
        mkdir -p "$realrtp/plugin"
        cp rtp/plugin/register-return-value.vim "$realrtp/plugin"
        echo > register-return-value-with-${charnames[$char]}.in "\
:let g:testfile='plugin/register-return-value.vim'
:let &rtp.=','.$rtp
:source test.vim"
    cp rtp/plugin/register-return-value.vim \
        "$realrtp/plugin/register-return-value$char.vim"
    echo > register-return-value-with-${charnames[$char]}-in-scriptname.in "\
:let g:testfile=\"plugin/register-return-value${char//$nl/\\n}.vim\"
:let &rtp.=','.$rtp
:source test.vim"
    done
}
