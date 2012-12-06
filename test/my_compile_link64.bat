
@echo off
rem To be used on MS-Windows for Visual C++ 2010 Express Edition
rem aka Microsoft Visual Studio 10.0.
rem See INSTALLpc.txt for information.
@echo on

REM call "%VS100COMNTOOLS%%bin\x86_amd64\vcvarsx86_amd64.bat"
call "c:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\x86_amd64\vcvarsx86_amd64.bat"

REM msvc2010.bat

REM nmake -f Make_mvc.mak  DYNAMIC_PYTHON=yes PYTHON="C:\Python27" PYTHON_VER=27 PERL="C:\Perl" PERL_VER=512 DYNAMIC_PERL=yes FEATURES=HUGE OLE=yes GUI=yes


REM link /RELEASE /nologo /subsystem:console /LTCG:STATUS -out:vim.exe .\ObjCOLY\blowfish.obj  .\ObjCOLY\buffer.obj  .\ObjCOLY\charset.obj  .\ObjCOLY\diff.obj  .\ObjCOLY\digraph.obj  .\ObjCOLY\edit.obj  .\ObjCOLY\eval.obj  .\ObjCOLY\ex_cmds.obj  .\ObjCOLY\ex_cmds2.obj  .\ObjCOLY\ex_docmd.obj  .\ObjCOLY\ex_eval.obj  .\ObjCOLY\ex_getln.obj  .\ObjCOLY\fileio.obj  .\ObjCOLY\fold.obj  .\ObjCOLY\getchar.obj  .\ObjCOLY\hardcopy.obj  .\ObjCOLY\hashtab.obj  .\ObjCOLY\main.obj  .\ObjCOLY\mark.obj  .\ObjCOLY\mbyte.obj  .\ObjCOLY\memfile.obj  .\ObjCOLY\memline.obj  .\ObjCOLY\menu.obj  .\ObjCOLY\message.obj  .\ObjCOLY\misc1.obj  .\ObjCOLY\misc2.obj  .\ObjCOLY\move.obj  .\ObjCOLY\normal.obj  .\ObjCOLY\ops.obj  .\ObjCOLY\option.obj  .\ObjCOLY\os_mswin.obj  .\ObjCOLY\os_win32.obj  .\ObjCOLY\pathdef.obj  .\ObjCOLY\popupmnu.obj  .\ObjCOLY\quickfix.obj  .\ObjCOLY\regexp.obj  .\ObjCOLY\screen.obj  .\ObjCOLY\search.obj  .\ObjCOLY\sha256.obj  .\ObjCOLY\spell.obj  .\ObjCOLY\syntax.obj  .\ObjCOLY\tag.obj  .\ObjCOLY\term.obj .\ObjCOLY\ui.obj  .\ObjCOLY\undo.obj  .\ObjCOLY\window.obj  .\ObjCOLY\vim.res  .\ObjCOLY\if_ole.obj  .\ObjCOLY\if_perl.obj .\ObjCOLY\if_perlsfio.obj .\ObjCOLY\if_python.obj      .\ObjCOLY/if_cscope.obj    .\ObjCOLY\version.obj oldnames.lib kernel32.lib advapi32.lib shell32.lib gdi32.lib  comdlg32.lib ole32.lib uuid.lib /machine:AMD64 /nodefaultlib  libcmt.lib oleaut32.lib  user32.lib      /nodefaultlib:python27.lib       /PDB:vim.pdb -debug


REM link /RELEASE /nologo /subsystem:windows /LTCG:STATUS -out:gvim.exe .\ObjGOLY\blowfish.obj  .\ObjGOLY\buffer.obj  .\ObjGOLY\charset.obj  .\ObjGOLY\diff.obj  .\ObjGOLY\digraph.obj  .\ObjGOLY\edit.obj  .\ObjGOLY\eval.obj  .\ObjGOLY\ex_cmds.obj  .\ObjGOLY\ex_cmds2.obj  .\ObjGOLY\ex_docmd.obj  .\ObjGOLY\ex_eval.obj  .\ObjGOLY\ex_getln.obj  .\ObjGOLY\fileio.obj  .\ObjGOLY\fold.obj  .\ObjGOLY\getchar.obj  .\ObjGOLY\hardcopy.obj  .\ObjGOLY\hashtab.obj  .\ObjGOLY\main.obj  .\ObjGOLY\mark.obj  .\ObjGOLY\mbyte.obj  .\ObjGOLY\memfile.obj  .\ObjGOLY\memline.obj  .\ObjGOLY\menu.obj  .\ObjGOLY\message.obj  .\ObjGOLY\misc1.obj  .\ObjGOLY\misc2.obj  .\ObjGOLY\move.obj  .\ObjGOLY\normal.obj  .\ObjGOLY\ops.obj  .\ObjGOLY\option.obj  .\ObjGOLY\os_mswin.obj  .\ObjGOLY\os_win32.obj  .\ObjGOLY\pathdef.obj  .\ObjGOLY\popupmnu.obj  .\ObjGOLY\quickfix.obj  .\ObjGOLY\regexp.obj  .\ObjGOLY\screen.obj  .\ObjGOLY\search.obj .\ObjGOLY\sha256.obj  .\ObjGOLY\spell.obj  .\ObjGOLY\syntax.obj  .\ObjGOLY\tag.obj  .\ObjGOLY\term.obj  .\ObjGOLY\ui.obj  .\ObjGOLY\undo.obj  .\ObjGOLY\window.obj  .\ObjGOLY\vim.res .\ObjGOLY\gui.obj  .\ObjGOLY\gui_beval.obj  .\ObjGOLY\gui_w32.obj  .\ObjGOLY\os_w32exe.obj .\ObjGOLY\if_ole.obj    .\ObjGOLY\if_perl.obj .\ObjGOLY\if_perlsfio.obj .\ObjGOLY\if_python.obj      .\ObjGOLY/if_cscope.obj .\ObjGOLY/netbeans.obj  .\ObjGOLY/xpm_w32.obj .\ObjGOLY\version.obj oldnames.lib kernel32.lib advapi32.lib shell32.lib gdi32.lib  comdlg32.lib ole32.lib uuid.lib /machine:AMD64 /nodefaultlib gdi32.lib version.lib winspool.lib comctl32.lib advapi32.lib shell32.lib  /machine:AMD64 /nodefaultlib libcmt.lib oleaut32.lib  user32.lib      /nodefaultlib:python27.lib     WSock32.lib xpm\x64\lib\libXpm.lib /PDB:gvim.pdb -debug

REM nmake -f Make_mvc.mak  DYNAMIC_PYTHON=yes PYTHON="C:\Python27_64" PYTHON_VER=27 PERL="C:\Perl64" PERL_VER=516 DYNAMIC_PERL=yes FEATURES=HUGE OLE=yes CPU=AMD64 GUI=no %*

REM nmake -f Make_mvc.mak  DYNAMIC_PYTHON=yes PYTHON="C:\Python27_64" PYTHON_VER=27 PERL="C:\Perl64" PERL_VER=516 DYNAMIC_PERL=yes FEATURES=HUGE OLE=yes CPU=AMD64 GUI=yes %*

REM nmake -f Make_mvc.mak  DYNAMIC_PYTHON=yes PYTHON="C:\Python27_64" PYTHON_VER=27 PERL="C:\Perl64" PERL_VER=516 DYNAMIC_PERL=yes FEATURES=HUGE OLE=yes CPU=AMD64 GUI=no MSVCVER=11.0 %*

REM nmake -f Make_mvc.mak  DYNAMIC_PYTHON=yes PYTHON="C:\Python27_64" PYTHON_VER=27 PERL="C:\Perl64" PERL_VER=516 DYNAMIC_PERL=yes FEATURES=HUGE OLE=yes CPU=AMD64 GUI=yes MSVCVER=11.0 %*

if not defined DID_SOURCE_VCVARS ^
call "c:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\x86_amd64\vcvarsx86_amd64.bat"
set DID_SOURCE_VCVARS

SET VIM_CONFIG_OPTIONS=^
FEATURES=HUGE OLE=yes MBYTE=yes ^
IME=yes DYNAMIC_IME=yes GIME=yes ^
DYNAMIC_PYTHON=yes PYTHON="C:\Python27_64" PYTHON_VER=27 ^
PERL="C:\Perl64" PERL_VER=516 DYNAMIC_PERL=yes ^
CPU=AMD64 MSVCVER=11.0


nmake -f Make_mvc.mak %VIM_CONFIG_OPTIONS% GUI=no %*
nmake -f Make_mvc.mak %VIM_CONFIG_OPTIONS% GUI=yes %*

