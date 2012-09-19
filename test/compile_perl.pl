#!/usr/bin/env perl

# compile vim for windows using a cross compiler in cygwing

my $python = "PYTHON=/cygdrive/c/Python27 PYTHON_VER=27 DYNAMIC_PYTHON=yes";
my $perl = "PERL=/cygdrive/c/Perl PERL_VER=512 DYNAMIC_PERL=yes";

my $makefile = "Make_cyg1.mak";

my $jflag = "-j5";

my $cmd_vim = "make -B -f $makefile GUI=no $python $perl $jflag vim.exe";
my $cmd_gvim = "make -B -f $makefile GUI=yes $python $perl $jflag gvim.exe";

print "$cmd_vim\n";
system "$cmd_vim";
print "$cmd_gvim\n";
system "$cmd_gvim"; 
