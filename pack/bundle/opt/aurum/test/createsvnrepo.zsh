#!/bin/zsh
export TZ=UTC
svnadmin create svntestreposerver
# tar -xJf svntestreposerver.tar.xz
svn checkout file://$PWD/svntestreposerver svntestrepo
cd svntestrepo

> file-under-svn-control << EOF
First line
Second line
Third line
Fourth line
Fifth line
Sixth line
EOF
svn add file-under-svn-control
svn commit --message 'Added file-under-svn-control'
mkdir subdir
svn add subdir
svn commit --message 'Commit where only a directory added'
echo File that looks like a “svn add” key > --force
svn add -- --force
svn commit --message 'Added --force'
echo Seventh line >> file-under-svn-control
echo Abc > def
echo Def > ghi
echo Ghi > mno
mkdir subdir2
echo Mno > subdir/pqr
echo Pqr > subdir2/stu
svn add -- def ghi mno subdir2 subdir/pqr
svn commit --message "\
Added seventh line to file-under-svn-control
Added def, ghi, mno
Added subdir/pqr
Added subdir2, subdir2/stu"
perl -p -i -e 's/Fourth/4’th/' file-under-svn-control
svn commit -m 'Replaced “Fourth” with “4’th”'
cd subdir
> file-2 << EOF
Line 1
First line
Seventh line
Second line
EOF
svn add file-2
svn commit --message 'Added file-2'
perl -p -i -e 's/Line 1/Zero line/; s/Second line/Third line/;' file-2
svn commit --message 'Replace “Line 1” with “Zero line”'
cd ..
echo '9’th line' >> file-under-svn-control
svn commit --message 'Added 9’th line to file-under-svn-control'
cd subdir
perl -p -i -e 's/Seventh line/Second line/' file-2
svn commit --message 'Fix: s/Seventh/Second/'
cd ..

cd ..
tar -cJvf svntestreposerver.tar.xz svntestreposerver
