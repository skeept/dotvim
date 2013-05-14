
@echo off
rem To be used on MS-Windows for Visual C++ 2010 Express Edition
rem aka Microsoft Visual Studio 10.0.
rem See INSTALLpc.txt for information.
REM inspired in https://bitbucket.org/rko/vim/src/5e5285bfe982bfc5dbf5dce3a3541b0d3b8f22e7/src/_msvc.bat?at=default
REM
REM to compile GvimExt/... should specify CPU=AMD64 after calling this file once
@echo on

SET SDK_INCLUDE_DIR=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include

if not defined DID_SOURCE_VCVARS ^
call "c:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\x86_amd64\vcvarsx86_amd64.bat"
set DID_SOURCE_VCVARS=1

SET VIM_CONFIG_OPTIONS=^
FEATURES=HUGE OLE=yes MBYTE=yes ^
IME=yes DYNAMIC_IME=yes GIME=yes ^
DYNAMIC_PYTHON=yes PYTHON="C:\Python27_64" PYTHON_VER=27 ^
PERL="C:\Perl64" PERL_VER=516 DYNAMIC_PERL=yes ^
CPU=AMD64 WINVER=0x0601


nmake -f Make_mvc.mak %VIM_CONFIG_OPTIONS% GUI=no %*
nmake -f Make_mvc.mak %VIM_CONFIG_OPTIONS% GUI=yes %*

