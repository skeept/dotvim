" set ft=vim
"
" copy this file to one of the following locations depending Linux/windows
" ~/.config/nvim/
" ~/AppData/Local/nvim 

let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0


" determine vim config folder
if has("win32")
  let vim_config_folder=expand('~') . '/vimfiles'
else
  let vim_config_folder=expand('~') . '/.vim'
endif

exe 'set runtimepath^=' . vim_config_folder . ' runtimepath+=' . vim_config_folder . '/after'
let &packpath = &runtimepath
exe 'source ' . vim_config_folder . '/vimrc'
