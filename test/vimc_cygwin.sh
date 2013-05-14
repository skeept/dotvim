#!/bin/bash

home0=/home/scratch/hinacio/cx
home1=$HOME/temp/MyInstalls/linux
home2=$HOME/temp/MyInstalls/linux64
home3=$HOME/temp/MyInstalls/unix
#home=/opt/hinacio/usr/local/Packages

homebase=$home1
home=$homebase/Packages

e="" ; o=""

function a2e() { if [ -z "$e" ] ; then e="$@ "; else e="$@ $e "; fi ; }
function a2o() { if [ -z "$o" ] ; then o="$@ "; else o="$@ $o "; fi ; }
function a2v() { vn=$1 ; shift ; s="export $vn=\"\$$vn:$@\""; eval "$s"; }

function vim_related() {

a2o --with-features=huge
#a2o --disable-xsmp
#a2o --disable-xsmp-interact
a2o --enable-perlinterp=yes
a2o --enable-pythoninterp=yes
#a2o --enable-tclinterp
a2o --enable-rubyinterp=yes
a2o --enable-cscope
#a2o --enable-sniff
#a2o --enable-multibyte
#a2o --enable-xim
#a2o --enable-fontset
a2o --enable-luainterp=yes

a2o --with-tlib=ncursesw

a2e CC=
a2e CXX=
#a2e CFLAGS='"-O3 -D_FORTIFY_SOURCE=1"'

}

vim_related




echo  " "
echo "$e ./configure $o"
echo  " "
echo -n "Continue? [y]"
read

eval $e  ./configure $o

exit
