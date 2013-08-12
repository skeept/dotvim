" is_windows, evim? {{{

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" This must be first, because it changes other options as a side effect.
set nocompatible

let g:is_vimrc_simple = 1 "so we can do something specific in gvimrc

"default path for runtime files
"let g:p0 = split(&runtimepath, ',')[0]
if has("unix")
  let g:p0 = "~/.vim"
else
  let g:p0 = "~/vimfiles"
endif

let g:is_win = has('win32') || has('win64')
"}}}

" decide on pathogen or vam (pathogen: 1, vam: 2)
let s:addon_manager = 2

"================== vim-addon-manager========================================{{{
if s:addon_manager == 2
function! SetupVAM()
  let g:vim_addon_manager = {}
  let vam_install_path = escape(expand(g:p0 . '/bundle'), ' \')
  exec 'set rtp+='.vam_install_path.'/vam'
  " let g:vim_addon_manager = { your config here see "commented version" example and help

  let g:active_addons = ['supertab']

  let g:vim_addon_manager.additional_addon_dirs = [escape(expand(g:p0 . '/notused_plugins'), ' \')]

  call vam#ActivateAddons(g:active_addons, {'auto_install' : 0, 'force_loading_plugins_now': 1})

  command! -nargs=* -bar -complete=customlist,vam#install#InstalledAddonCompletion AA
        \ :call vam#ActivateAddons([<f-args>], {'auto_install' : 0, 'force_loading_plugins_now': 1})
endfunction
call SetupVAM()
endif
"==============================================================================}}}

"this is where all vimrc and simple settings go
execute "source " . g:p0 . "/common.vim"


"================== Statusline ================================================{{{
"set statusline=%-3.3n%t\ \ \ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%-3.3n%t\ \ %h%m%r\ %y%=%l/%L\ %3c\ \ \ %P
"set statusline=%-3.3n%t\ \ \ %h%m%r\ %y%=%{strftime(\"[%H:%M%p]\")}\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
"set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]
"set statusline+=\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]
"set statusline+=\ %=\ Line:%l\/%L\ Column:%c%V\ %P
"
"set statusline=%-3.3n%t\ \ \ %h%m%r%=[%{&ft}\,
"set statusline+=%{&ff}]\ \ \ %{strftime(\"[%H:%M%p]\")}
"set statusline+=\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
function! CondDispFtFf()
  if v:version < 702
    return ''
  endif
  if winwidth(0) < 70 || &filetype == 'help'
    let val = ''
  else
    let xft = &filetype
    let xff = &fileformat
    let val =  '[' . xft . ( xft == '' ? '' : ',' ) . xff . ']'
  endif
  return val
endfunction

"set statusline=%2.2n\ %t\ %h%m%r%=[%{&ft}\,%{&ff}]
set statusline=%2.2n\ %t\ %h%m%r%=
set statusline+=%{GetNumTabsStr()}
set statusline+=%{CondDispFtFf()}
"set statusline+=\ %{strftime(\"[%H:%M%p]\")} "do we want to show time?
set statusline+=%{GetNumTabsStr()}
set statusline+=\ %l/%L\ %2c\ %P

"" SmartusLine
"hi Modified guifg=black guibg=#FFA500
"set statusline=%2.2n\ %t\ %h%#Modified#%m%r%*%=%{CondDispFtFf()}\ %l/%L\ %2c\ %P
"let g:smartusline_string_to_highlight = '%2.2n %t %h'
"call vam#ActivateAddons(['SmartusLine'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
"==============================================================================}}}

"=================== Plugin Loading ==========================================={{{
" always load {{{
runtime plugin/NERD_commenter.vim
runtime plugin/unimpaired.vim
runtime plugin/scratch.vim
"}}}

function! LoadTagbar() "{{{
  call vam#ActivateAddons(['Tagbar'],
        \ {'auto_install' : 0, 'force_loading_plugins_now': 1})
  nnoremap <F3> :<C-U>call ToggleTBarListNT() <CR>
  inoremap <F3> <ESC>:<C-U>call ToggleTBarListNT() <CR>
endf
nnoremap <F3> :<C-U>call LoadTagbar()<CR>:<C-U>call ToggleTBarListNT()<CR>
inoremap <F3> :<C-U>call LoadTagbar()<CR>:<C-U>call ToggleTBarListNT()<CR>
"}}}

function! LoadCtrlP() "{{{
  call vam#ActivateAddons(['ctrlp'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
  nnoremap <silent> <C-P> :<C-U>call CtrlpShowArrFun(v:count)
        \ \| silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
  nnoremap <silent> ,b :<C-U>CtrlPBuffer<CR>
endf
nnoremap <C-P> :<C-U>let curr_vcount=v:count
      \ \| call LoadCtrlP()<CR>:<C-U>call CtrlpShowArrFun(curr_vcount)
      \ \| silent! exe 'CtrlP' . g:ctrlp_comm[curr_vcount]<CR>
nnoremap ,b :<C-U>call LoadCtrlP()<CR>:<C-U>CtrlPBuffer<CR>
"}}}

function! LoadLycosa() "{{{
  call vam#ActivateAddons(['LycosaExplorer'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
  call SetupLycosa()
endfunction
nnoremap ,e :call LoadLycosa()<CR>:<c-u>LycosaFilesystemExplorer<CR>
"}}}

"for filetype tex we need imap.vim
if has("autocmd")
  autocmd FileType tex exec "source " . g:p0 . "/bundle/vlatex/plugin/imaps.vim"
endif
"==============================================================================}}}

" vim: foldmethod=marker
