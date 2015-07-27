#!/usr/bin/perl
use strict;
use warnings;
use integer;
use utf8;
use open qw(:utf8);
my @testmaps=qw(
     "aph
     "apj
     "apl
     k
     a
    oa
     Pa
    oPa
     P
     Pe
     Pd
     d
    of!
    og!
);
my $teststr="";
while(my ($i, $s)=each(@testmaps)) {
    $teststr.="$s\c\\cn:WW\n";
}
$_=<<"EOF";
:let &rtp.=",".escape(\$TESTDIR, ',\\').'/rtp'
:source mappings.vim
:let \@"='paste'
:let \@a='apaste'
:command WW if !empty(getline('.')) | call WriteFile("=".getline('.')) | endif | %d_
:W> 2
@@@
:W> 1
:wincmd w
@@@
:W> 2
:wincmd w
:W+ 2
:runtime! plugin/mappings-2.vim
@@@
:W> 1
:wincmd w
@@@
:W> 2
:wincmd w
:W* unload
:let tosource=FraworUnload(g:testfile[:-5])+FraworUnload('plugin/mappings-2')
@@@
:W> 1
:wincmd w
@@@
:W> 2
:wincmd w
:W* source
:for src in tosource | execute "source" fnameescape(src) | endfor
@@@
:W> 1
:wincmd w
@@@
:W> 2
:wincmd w
EOF
s/@@@/$teststr/g;
my $F;
open $F, ">", "mappings.in";
print $F $_;
