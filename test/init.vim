
" set ft=vim

" should determine which is current vim folder

if has("win32")
  let vim_config_folder=expand('~') . '/vimfiles'
else
  let vim_config_folder=expand('~') . '/.vim'
endif

exe 'set runtimepath^=' . vim_config_folder . ' runtimepath+=' . vim_config_folder . '/after'
let &packpath = &runtimepath
exe 'source ' . vim_config_folder . '/vimrc'
