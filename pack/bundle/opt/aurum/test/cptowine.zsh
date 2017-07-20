#!/bin/zsh
emulate -L zsh
typeset -gr SRC=$1.ok
typeset -gr TGT=${1:h}/wine/$SRC
cp $SRC $TGT
perl -p -i -e '
if(/aurum:\/\//) {
    s/%-/%+/g;
    s@aurum://@aurum:\\\\@;
}
if(/^(.*)(%TMPDIR%)(\S*)(.*)$/s) {
    my $pref="$1$2";
    my $suf=$4;
    $_=$3;
    s@/@\\@g;
    $_="$pref$_$suf";
}' $TGT
