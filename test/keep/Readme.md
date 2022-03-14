
** some random notes

bash list commands:

compgen see: https://unix.stackexchange.com/questions/94775/list-all-commands-that-a-shell-knows

different ways that I call vim, nvim, gvim, nvim-qt
here git <=> git bash
simple <=> don't load default vimrc and plugins, load simple.vim and subset of plugins specified there

vim   
nvim

gvim     - doesn't work in wsl directly
gvim.exe - should work everwhere if in path

e - nvim, vim

v 
wsl, git => vim+simple 
win      => reuse gvim with passed argument. Remember last passed argument and open it again

vn
win     => like v but open in new window if not already opened

vo      => shortcut to open optimizer.log

ev
win      => try nvim-qt then gvim
wsl, git => try gvim.exe, nvim-qt.exe gvim if any of these is executable use remoteopen,
            otherwise falback to vim or nvim

ve
win      => if one of the args exists try gvim on it
            use fzf to pick file open with v

vv
win      => like ve but use gvim instead of v
wsl, git => same but use vim

vvo
wsl, git => :call foreground()



