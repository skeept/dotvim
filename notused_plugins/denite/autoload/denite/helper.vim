"=============================================================================
" FILE: helper.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

function! denite#helper#complete(arglead, cmdline, cursorpos) abort "{{{
  let _ = []

  if a:arglead !~ ':'
    " Option names completion.
    let _ += map(copy(denite#helper#options()), "'-' . v:val")

    " Add "-no-" option names completion.
    let _ += values(map(filter(copy(denite#init#_user_options()),
          \ 'type(v:val) == type(v:true) || type(v:val) == type(v:false)'),
          \ "'-no-' . tr(v:key, '_', '-')"))

    " Source name completion.
    let _ += map(globpath(&runtimepath,
          \ 'rplugin/python3/denite/source/*.py', 1, 1),
          \ "fnamemodify(v:val, ':t:r')")
  endif

  return uniq(sort(filter(_, 'stridx(v:val, a:arglead) == 0')))
endfunction"}}}
function! denite#helper#complete_actions(arglead, cmdline, cursorpos) abort "{{{
  return uniq(sort(filter(g:denite#_actions,
        \ 'stridx(v:val, a:arglead) == 0')))
endfunction"}}}

function! denite#helper#call_denite(command, args, line1, line2) abort "{{{
  let [args, context] = denite#helper#_parse_options_args(a:args)

  let context.firstline = a:line1
  let context.lastline = a:line2
  let context.bufnr = bufnr('%')
  if a:command ==# 'DeniteCursorWord'
    let context.input = expand('<cword>')
  elseif a:command ==# 'DeniteBufferDir'
    let context.path = fnamemodify(bufname('%'), ':p:h')
  elseif a:command ==# 'DeniteProjectDir'
    let context.path = denite#util#path2project_directory(getcwd())
  endif

  call denite#start(args, context)
endfunction"}}}

function! denite#helper#options() abort "{{{
  return map(keys(denite#init#_user_options()), "tr(v:val, '_', '-')")
endfunction"}}}

function! denite#helper#_parse_options_args(cmdline) abort "{{{
  let _ = []
  let [args, options] = s:parse_options(a:cmdline)
  for arg in args
    " Add source name.
    let source_name = matchstr(arg, '^[^:]*')
    let source_arg = arg[len(source_name)+1 :]
    let source_args = source_arg  == '' ? [] :
          \  map(split(source_arg, '\\\@<!:', 1),
          \      'substitute(v:val, ''\\\(.\)'', "\\1", "g")')
    call add(_, { 'name': source_name, 'args': source_args })
  endfor

  return [_, options]
endfunction"}}}
function! s:parse_options(cmdline) abort "{{{
  let args = []
  let options = {}

  " Eval
  let cmdline = (a:cmdline =~ '\\\@<!`.*\\\@<!`') ?
        \ s:eval_cmdline(a:cmdline) : a:cmdline

  for arg in split(cmdline, '\%(\\\@<!\s\)\+')
    let arg = substitute(arg, '\\\( \)', '\1', 'g')
    let arg_key = substitute(arg, '=\zs.*$', '', '')

    let name = substitute(tr(arg_key, '-', '_'), '=$', '', '')[1:]
    if name =~ '^no_'
      let name = name[3:]
      let value = 0
    else
      let value = (arg_key =~ '=$') ? arg[len(arg_key) :] : 1
    endif

    if index(keys(denite#init#_user_options()), name) >= 0
      let options[name] = value
    else
      call add(args, arg)
    endif
  endfor

  return [args, options]
endfunction"}}}
function! s:eval_cmdline(cmdline) abort "{{{
  let cmdline = ''
  let prev_match = 0
  let match = match(a:cmdline, '\\\@<!`.\{-}\\\@<!`')
  while match >= 0
    if match - prev_match > 0
      let cmdline .= a:cmdline[prev_match : match - 1]
    endif
    let prev_match = matchend(a:cmdline,
          \ '\\\@<!`.\{-}\\\@<!`', match)
    let cmdline .= escape(eval(a:cmdline[match+1 : prev_match - 2]), '\: ')

    let match = match(a:cmdline, '\\\@<!`.\{-}\\\@<!`', prev_match)
  endwhile
  if prev_match >= 0
    let cmdline .= a:cmdline[prev_match :]
  endif

  return cmdline
endfunction"}}}

" vim: foldmethod=marker
