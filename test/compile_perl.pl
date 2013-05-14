#!/usr/bin/env perl

# compile vim for windows using a cross compiler in cygwing

sub compile_32 {
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
}

sub compile_64 {

  my $python = "PYTHON=/cygdrive/c/Python27_64 PYTHON_VER=27 DYNAMIC_PYTHON=no";
  my $perl = "PERL=/cygdrive/c/Perl64 PERL_VER=516 DYNAMIC_PERL=yes";

  my $makefile = "Make_cyg.mak";

  my $COMP="CC=x86_64-w64-mingw32-gcc RC=x86_64-w64-mingw32-windres ARCH=x86-64";

  my $jflag = "-j5";

  my $cmdargs = join " ", @ARGV;

  my $cmd_vim = "make -f $makefile $COMP $python $perl $jflag GUI=no $cmdargs";
  my $cmd_gvim = "make -f $makefile $COMP $python $perl $jflag GUI=yes $cmdargs";

  print "$cmd_vim\n";
  system "$cmd_vim";
  print "$cmd_gvim\n";
  system "$cmd_gvim"; 
}


compile_64();
