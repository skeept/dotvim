" Author: liuchengxu <xuliuchengxlc@gmail.com>
" Description: Helper for the cmdline completion and building extension.

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:path_sep = has('win32') ? '\' : '/'

function! s:relativize(ArgLead, abs_dirs) abort
  if a:ArgLead =~# '^\~'
    return map(a:abs_dirs, 'fnamemodify(v:val, ":~")')
  elseif a:ArgLead =~# '^\.'
    if empty(a:abs_dirs)
      return []
    endif
    if fnamemodify(a:abs_dirs[0], ':.') =~# '^\.'
      return map(a:abs_dirs, 'fnamemodify(v:val, ":.")')
    " Don't prepend . if it's absolute path.
    elseif a:abs_dirs[0][0] ==# s:path_sep
      return a:abs_dirs
    else
      return map(a:abs_dirs, '".".s:path_sep.fnamemodify(v:val, ":.")')
    endif
  else
    return a:abs_dirs
  endif
endfunction

function! clap#helper#complete(ArgLead, CmdLine, P) abort
  " TODO: Proper completion help
  if a:CmdLine =~# '^Clap \(files\|grep\|filer\)'
    if a:ArgLead =~# '\(/\|\\\)$' || isdirectory(expand(a:ArgLead))
      let parent_dir = fnamemodify(resolve(expand(a:ArgLead)), ':p')
      if isdirectory(parent_dir)
        let abs_dirs = filter(globpath(parent_dir, '*', 0, 1), 'isdirectory(v:val)')
        return s:relativize(a:ArgLead, abs_dirs)
      endif
    else
      let parent_dir = fnamemodify(resolve(expand(a:ArgLead)), ':h')
      if isdirectory(parent_dir)
        let abs_dirs = filter(globpath(parent_dir, '*', 0, 1), 'isdirectory(v:val) && v:val =~# "^".expand(a:ArgLead)')
        return s:relativize(a:ArgLead, abs_dirs)
      endif
    endif
  endif
  let registered = exists('g:clap') ? keys(g:clap.registrar) : []
  let registered += ['install-binary', 'install-binary!', 'debug', 'debug+']
  if !exists('s:autoload_providers')
    let s:autoload_providers = map(split(globpath(&runtimepath, 'autoload/clap/provider/*.vim'), "\n"), 'fnamemodify(v:val, ":t:r")')
  endif
  if !exists('s:user_providers')
    let s:user_providers = map(clap#provider#providers#get_user_defined(), 'split(v:val, ":")[0]')
  endif
  return filter(uniq(sort(s:autoload_providers + s:user_providers + keys(g:clap#provider_alias) + registered)), 'v:val =~# "^".a:ArgLead')
endfunction

function! clap#helper#complete_actions(A, L, P) abort
  if !exists('g:clap_actions')
      echoerr '`g:clap_actions` not found'
      return []
  endif
  if empty(a:A)
    return g:clap_actions
  else
    " Use copy otherwise the variable will be altered after map.
    return filter(copy(g:clap_actions), printf('v:val =~ "^%s"', a:A))
  endif
endfunction

function! clap#helper#echo_message(msg) abort
  echohl Function
  echo 'vim-clap: '
  echohl NONE
  echohl Normal
  echon a:msg
  echohl NONE
endfunction

function! clap#helper#echo_info(msg) abort
  echohl Function
  echom 'vim-clap: '.a:msg
  echohl NONE
endfunction

function! clap#helper#echo_error(msg) abort
  echohl ErrorMsg
  echom 'vim-clap: '.a:msg
  echohl NONE
endfunction

function! clap#helper#echo_warn(msg) abort
  echohl WarningMsg
  echom 'vim-clap: '.a:msg
  echohl NONE
endfunction

function! clap#helper#echo_clear() abort
  echo "\n"
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
