" set ft=vim

" should determine which is current vim folder


let vim_config_folder='~/vimfiles'

exe 'set runtimepath^=' . vim_config_folder . ' runtimepath+=' . vim_config_folder . '/after'
let &packpath = &runtimepath
exe 'source ' . vim_config_folder . '/vimrc'
