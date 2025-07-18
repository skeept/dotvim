# My vim configuration

Bellow are some tips (things I need to look up once in a while)

"xY -- copies the current line to register x
"xP -- pastes the content of register x before the cursor

ma -- mark the current position in mark a
'a -- goto the position specified in mark a

H M L -- goto to the [H]top, [M]middle, or [L]bottom of the current screen

zz -- put the current cursor position in the middle of the screen

recording -- to record a set of keystrokes to register s do the following:
qs<keystrokes>q
then invoke the keystroke s by @s

ZQ : quit without asking for confirmation

Transposing chars: xp
transposing lines: ddp
transposing words: dawwP

`<c-o>` -- goto last visited position in the file
<c-i> -- usually goes back, but after mapping <tab> to <c-w> have defined :Jump command

Change case of current character: ~
current line <lowercase-uppercase>: uu UU
in visual mode: u and U change the case of selected text
guaw -- change current word lowercase
gUaw -- change current word uppercase

To select various lines use <shitf-v> <c-v> selects blocks

Replace ^M
:%s/<ctrl-v><enter>//g

Change to current folder of current file
cd %:p:h

perldo
'<,'>perldo $_ .= '   ' . (abs((split(/,/, $_))[2]) > 1.0e-8 ? 'YES' : 'NO')
in the specified range append to current line $_ .= ...

@: -- repeat last : command

-- some mappings I have don't always remember --
\os -- open scratch buffer
,di -- display registers (:reg or equivalently :di)
q; :
q' "
\rs -- start recording to register u
,co -- capture output from command (pastes contents at end of current buffer)
<c-e> (insert mode) -- either go to end of line or copy char bellow

Following works currently to compile without python on windows:
search x64 native (a terminal should come up)
In that terminal go to the src folder where vim source is and run:

set LUA_SETTINGS=LUA_VER=54 LUA=C:\ht\lua  DYNAMIC_LUA=yes
set PYTHON_SETTINGS=DYNAMIC_PYTHON3=no
nmake -f Make_mvc.mak %LUA_SETTINGS% %PYTHON_SETTINGS% GUI=no clean
nmake -f Make_mvc.mak %LUA_SETTINGS% %PYTHON_SETTINGS% GUI=no
nmake -f Make_mvc.mak %LUA_SETTINGS% %PYTHON_SETTINGS% GUI=yes clean
nmake -f Make_mvc.mak %LUA_SETTINGS% %PYTHON_SETTINGS% GUI=yes

To build compatible lua, assume its downloaded and unpacked in folder inside
C:/ht/lua. Run the following in x64 prompt:

set short_ver=54
set ver=5.4.0
rm _.obj_.o
cl /MD /O2 /c /DLUA_BUILD_AS_DLL _.c
ren lua.obj lua.o
ren luac.obj luac.o
link /DLL /IMPLIB:lua%ver%.lib /OUT:lua%ver%.dll_.obj
link /OUT:lua.exe lua.o lua%ver%.lib
lib /OUT:lua%ver%-static.lib *.obj
link /OUT:luac.exe luac.o lua%ver%-static.lib
mkdir ..\..\lib
mkdir ..\..\include
cp*dll _lib ..\..\lib
cp_.h ..\..\include
cp lua%ver%.lib ..\..\lib\lua%short_ver%.lib
cp lua%ver%.dll ..\..\lib\lua%short_ver%.dll
cp *.exe ..\..

Previous instructions were adapted from
<https://blog.spreendigital.de/2019/06/25/how-to-compile-lua-5-3-5-for-windows/>

----------- Replace in multiple files
-- first find text to replace
:vimgrep /pattern/ **/*.py
:cfdo %s//newnew/gc | update

git line ending settings
seems OK to do this for this repo:
git config  core.autocrlf input

simple python logging setup

-----------------
import logging

def basic_logger(name: str, output: str = "output.log", level=logging.INFO) -> logging.Logger:
    """Get a simple logger ."""
    import sys

    logger = logging.getLogger(name=name)
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(level=level)
    formatter = logging.Formatter("%(asctime)s %(name)s: %(message)s")
    console_handler.setFormatter(formatter)
    logger.addHandler(console_handler)
    if output:
        file_handler = logging.FileHandler(output)
        file_handler.setLevel(level=level)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)
    return logger
-----------------

nvim remap directly in nvim config file (~/.config/nvim/init.lua)
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

---- keep track of different ways to currently invoke vim
vi -- shim or binary
vim -- ok
n - nvim
ei - nvim with default vim conf
gvi - script to open with gvim.exe or gvim
ev - open nvim-qt or gvim (uses script gvi)
v -  open file in gvim[.exe] reusing existing instance if possible
vn - like v but open in new window. if not exact match invokes zp
vs - open file in split
vt - open file in new tab
vg - run gvim with simple configuration
vp - vim with no plugings
vuo - vim with simple config

some utility repos cloned for bash use

mkdir ~/tmp/gclones
git clone <https://github.com/lincheney/fzf-tab-completion> ~/tmp/gclones/
