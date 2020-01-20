@echo off
rem Update the DLL using MSVC.
rem If the old DLL is in use, rename it to avoid compilation error.
rem current support version of Visual C compiler is 2012 or later.
rem
rem usage: update-dll-msvc
rem
rem
rem Sample .vimrc:
rem
rem NeoBundle 'Shougo/vimproc.vim', {
rem \ 'build' : {
rem \     'windows' : 'tools\\update-dll-msvc',
rem \     'cygwin' : 'make -f make_cygwin.mak',
rem \     'mac' : 'make -f make_mac.mak',
rem \     'linux' : 'make',
rem \     'unix' : 'gmake',
rem \    },
rem \ }

setlocal enabledelayedexpansion

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set vimproc_arch=64
    set msvc_arch=x86_amd64
    set cpu_arch=AMD64
) else (
    set vimproc_arch=32
    set msvc_arch=x86
    set cpu_arch=i386
)

set vimproc_dllname=vimproc_win%vimproc_arch%.dll

if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" (
    REM  found the lasted version of Visual C compiler
    for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
        set InstallDir=%%i

        if exist "!InstallDir!\VC\Auxiliary\Build\Microsoft.VCToolsVersion.default.txt" (
            set /p msvc_ver=<"!InstallDir!\VC\Auxiliary\Build\Microsoft.VCToolsVersion.default.txt"

            rem Trim
            set msvc_ver=!msvc_ver: =!
        )

        if exist "!InstallDir!\VC\Auxiliary\Build\vcvars%vimproc_arch%.bat" (
            call "!InstallDir!\VC\Auxiliary\Build\vcvars%vimproc_arch%.bat"
        )
    )
) else if defined VS140COMNTOOLS (
    REM  Microsoft Visual Studio 2015 installed
    set msvc_ver=14
    call "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" %msvc_arch%
) else if defined VS120COMNTOOLS (
    REM  Microsoft Visual Studio 2013 installed
    set msvc_ver=12
    call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" %msvc_arch%
) else if defined VS110COMNTOOLS (
    REM  Microsoft Visual Studio 2012 installed
    set msvc_ver=11
    call "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat" %msvc_arch%
)

where nmake >nul 2>&1
if errorlevel 1 (
    echo nmake not found.
    goto :eof
)

if %msvc_ver% geq 11 (
    nmake -f make_msvc.mak nodebug=1 CPU=%cpu_arch% "SDK_INCLUDE_DIR=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v7.1A\Include"
) else (
    nmake -f make_msvc.mak nodebug=1 CPU=%cpu_arch% 
)

if errorlevel 1 (
    rem Build failed.

    rem Try to delete old DLLs.
    if exist lib\%vimproc_dllname%.old del lib\%vimproc_dllname%.old
    if exist lib\%vimproc_dllname%     del lib\%vimproc_dllname%
    rem If the DLL couldn't delete (may be it is in use), rename it.
    if exist lib\%vimproc_dllname%     ren lib\%vimproc_dllname% %vimproc_dllname%.old

    if %msvc_ver% geq 11 (
        nmake -f make_msvc.mak nodebug=1 CPU=%cpu_arch% "SDK_INCLUDE_DIR=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v7.1A\Include"
    ) else (
        nmake -f make_msvc.mak nodebug=1 CPU=%cpu_arch% 
    )
)

