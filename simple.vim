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

"================== Latex ====================================================={{{
"latex options
"let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'
" in case we get errors when using compiling because of python set to 0
let g:Tex_UsePython=1
let g:Tex_MultipleCompileFormats='dvi,pdf'
"make vim load .tex files as latex files
"let g:tex_flavor='latex'
let g:tex_flavor='pdflatex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'pdflatex  --synctex=1 -interaction=nonstopmode $*'
let g:Tex_IgnoreLevel = 3
let g:tex_comment_nospell= 1 "don't do spelling in comments
if has("autocmd") && g:is_win
  autocmd BufRead,BufNewFile *.tex compiler tex
        \ | setlocal textwidth=90
endif

if g:is_win
  let g:SumatraPdfLoc = expand("$HOME" .
        \ "/Programs/PApps/PortableApps/SumatraPDFPortable/SumatraPDFPortable")
  let g:Tex_ViewRule_pdf = g:SumatraPdfLoc . " -reuse-instance"
endif

"for plugin in ftplugin/tex/tex_pdf.vim
let g:tex_pdf_map_keys = 0
"==============================================================================}}}

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
set statusline=%2.2n\ %t\ %h%m%r%=%{CondDispFtFf()}
"set statusline+=\ %{strftime(\"[%H:%M%p]\")} "do we want to show time?
set statusline+=\ %l/%L\ %2c\ %P

"" SmartusLine
"hi Modified guifg=black guibg=#FFA500
"set statusline=%2.2n\ %t\ %h%#Modified#%m%r%*%=%{CondDispFtFf()}\ %l/%L\ %2c\ %P
"let g:smartusline_string_to_highlight = '%2.2n %t %h'
"call vam#ActivateAddons(['SmartusLine'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
"==============================================================================}}}

"================== python settings ==========================================={{{
"================== PyLint Compiler ==========================================={{{
"autocmd FileType python compiler pylint
autocmd FileType python setlocal errorformat=%f:%l:\ %m
autocmd FileType python setlocal makeprg=epylint\ %
"==============================================================================}}}

"================== pep8 ======================================================{{{
"let g:pep8_map = '<leader>p8' "not used anymore
"let g:pep8_cmd  = 'pep8.py'
"let g:pep8_ignore = "E111,E221,E225"
"
" this is a different plugin, the one I used now doesn't work the same way
" E221 multiple spaces before operator -- aligning equals breaks this
" E111 indentation is not a multiple of four -- I use two spaces
" E225 missing whitespace around operator -- I like * without space
" E501 line too long   -- allow more than 80 characters
let g:pep8_args = " --ignore=E111,E221,E225,E501"
"==============================================================================}}}

"pysmell
function! LoadPysmell()
  if exists("s:loadedPysmell")
    return ''
  endif
  if has("python")
    silent python << EOF
import vim
try:
  import pysmell
  vim.command('let s:has_pysmell = 1')
except:
  vim.command('let s:has_pysmell = 0')
EOF

    if s:has_pysmell == 1
        ActivateAddons pysmell
      setlocal completefunc=pysmell#Complete
      autocmd filetype python setlocal completefunc=pysmell#Complete
    else
      echom "No Pysmell installed!"
    endif
  else
    echom "Cannot Load PySmell: No Python!"
  endif
  let s:loadedPysmell = 1
endfunction
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
