#!/usr/bin/perl
package XXXTest;
use strict;
use warnings;
sub WriteFile($) {
    VIM::Eval("WriteFile('@_')");
}
1;
