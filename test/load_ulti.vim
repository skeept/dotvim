"file to load ultisnips
"call with vim -u load_ulti.vim --noplugins

set nocompatible

"if has("win32")
  "set runtimepath+=~/vimfiles/bundle/ultisnips_rep
"else
  "set runtimepath+=~/.vim/bundle/ultisnips_rep
"endif
"runtime bundle/ultisnips_rep/plugin/UlltiSnips.vim

if has("win32")
  set runtimepath+=~/vimfiles/bundle/vlatex
else
  set runtimepath+=~/.vim/bundle/vlatex
endif
runtime bundle/vlatex/plugin/imaps.vim
runtime bundle/vlatex/plugin/SyntaxFolds.vim
runtime bundle/vlatex/plugin/filebrowser.vim
runtime bundle/vlatex/plugin/libList.vim
runtime bundle/vlatex/plugin/remoteOpen.vim


