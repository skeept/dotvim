"file to load ultisnips
"call with vim -u load_ulti.vim --noplugins

set nocompatible

if has("win32")
  set runtimepath+=~/vimfiles/bundle/ultisnips_rep
else
  set runtimepath+=~/.vim/bundle/ultisnips_rep
endif

runtime bundle/ultisnips_rep/plugin/UltiSnips.vim


