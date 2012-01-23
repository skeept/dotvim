#!/usr/bin/env perl

use strict;
use warnings;

my $directory = '../colors';

opendir(DIR, $directory) or die $!;

while(my $file = readdir(DIR)) {
  next unless (-f "$directory/$file");
  my $color = $file;
  $color =~ s/.vim//;
  print "$file, $color\n";

  open(MYFILE, '>cur_color.vim');
  print MYFILE "colo $color";
  close(MYFILE);

  my $cmd = "vim -u test_color.vim -c \"colo $color\" ";
  $cmd = $cmd . "-c \"set ls=2\" -c \"set statusline=$color\" ";
  $cmd = $cmd . " --noplugins ../doSetUpProgs.py ";
  $cmd = $cmd . " -c \"silent split ~/genCosts.cpp\" ";
  system $cmd;
  #print "$cmd\n";
}


closedir(DIR);
