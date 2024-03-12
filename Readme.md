My vim configuration.

Bellow are some tips (things I need to look up once in a while)


"xY -- copies the current line to register x
"xP -- pastes the content of register x before the cursor

ma -- mark the current position in mark a
'a -- goto the position specified in mark a

H M L -- goto to the [H]top, [M]midle, or [L]bottom of the current screen

zz -- put the current cursor position in the midle of the screen

recording -- to record a set of keystrokes to register s do the folowing:
qs<keystrokes>q
then invoke the keystroke s by @s

ZQ : quit without asking for confirmation


tranposing chars: xp
transposing lines: ddp
transposing words: dawwP

<c-o> -- goto last visited position in the file
<c-i> -- usually goes back, but after mapping <tab> to <c-w> have defined :Jump command

change case of current character: ~
current line <lowercase-uppercase>: uu UU
in visual mode: u and U change the case of selected text
guaw -- change current word lowercase
gUaw -- change current word uppercase

to select various lines use <shitf-v> <c-v> selects blocks

replace ^M
:%s/<ctrl-v><enter>//g

change to current folder of current file
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


following works currently to compile without python on windows:

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
rm *.obj *.o
cl /MD /O2 /c /DLUA_BUILD_AS_DLL *.c
ren lua.obj lua.o
ren luac.obj luac.o
link /DLL /IMPLIB:lua%ver%.lib /OUT:lua%ver%.dll *.obj
link /OUT:lua.exe lua.o lua%ver%.lib
lib /OUT:lua%ver%-static.lib *.obj
link /OUT:luac.exe luac.o lua%ver%-static.lib
mkdir ..\..\lib
mkdir ..\..\include
cp *dll *lib ..\..\lib
cp *.h ..\..\include
cp lua%ver%.lib ..\..\lib\lua%short_ver%.lib
cp lua%ver%.dll ..\..\lib\lua%short_ver%.dll
cp *.exe ..\..

previous instructions were adapted from
https://blog.spreendigital.de/2019/06/25/how-to-compile-lua-5-3-5-for-windows/


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
