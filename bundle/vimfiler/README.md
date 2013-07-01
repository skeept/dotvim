# Vimfiler
Powerful file explorer implemented by Vim script

## Introduction
vimfiler is a powerful file explorer(filer) written by Vim script.

## Usage
To run vimfiler, execute this command.

	:VimFiler

If you set `g:vimfiler_as_default_explorer` to 1, vimfiler behaves as default
explorer like netrw.

	:let g:vimfiler_as_default_explorer = 1

vimfiler needs unite.vim
http://github.com/Shougo/unite.vim

Please install unite.vim Ver.3.0(or later) before use vimfiler.

Note: To use 4GB(>) files in vimfiler, vimfiler require +python interface.

## Screen shots

vimfiler standard operations
----------------------------
![Vimfiler standard operations](https://f.cloud.github.com/assets/214488/657681/c40265e6-d56f-11e2-96fd-03d01f10cc4e.gif)

vimfiler explorer feature(like NERDTree)
----------------------------------------
![Vimfiler explorer](https://f.cloud.github.com/assets/214488/657685/95011fc4-d571-11e2-9934-159196cf9e59.gif)
