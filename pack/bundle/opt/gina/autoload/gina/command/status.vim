let s:Path = vital#gina#import('System.Filepath')
let s:String = vital#gina#import('Data.String')

let s:SCHEME = gina#command#scheme(expand('<sfile>'))


function! gina#command#status#call(range, args, mods) abort
  let git = gina#core#get_or_fail()
  let args = s:build_args(git, a:args)
  let bufname = gina#core#buffer#bufname(git, s:SCHEME, {
        \ 'params': [
        \   args.params.partial ? '--' : '',
        \ ],
        \})
  call gina#core#buffer#open(bufname, {
        \ 'mods': a:mods,
        \ 'group': args.params.group,
        \ 'opener': args.params.opener,
        \ 'cmdarg': args.params.cmdarg,
        \ 'callback': {
        \   'fn': function('s:init'),
        \   'args': [args],
        \ }
        \})
endfunction


" Private --------------------------------------------------------------------
function! s:build_args(git, args) abort
  let args = a:args.clone()
  let args.params.group = args.pop('--group', 'short')
  let args.params.opener = args.pop('--opener', &previewheight . 'split')
  let args.params.partial = !empty(args.residual())
  call args.set('--short', 2)
  return args.lock()
endfunction

function! s:init(args) abort
  call gina#core#meta#set('args', a:args)

  if exists('b:gina_initialized')
    return
  endif
  let b:gina_initialized = 1

  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal nomodifiable
  setlocal autoread

  " Attach modules
  call gina#core#anchor#attach()
  call gina#action#attach(function('s:get_candidates'), {
        \ 'markable': 1,
        \})

  augroup gina_command_status_internal
    autocmd! * <buffer>
    autocmd BufReadCmd <buffer>
          \ call gina#core#exception#call(function('s:BufReadCmd'), [])
  augroup END
endfunction

function! s:BufReadCmd() abort
  let git = gina#core#get_or_fail()
  let args = gina#core#meta#get_or_fail('args')
  let pipe = gina#process#pipe#stream()
  let pipe.writer = gina#core#writer#new(extend(
        \ gina#process#pipe#stream_writer(),
        \ s:writer
        \))
  call gina#core#buffer#assign_cmdarg()
  call gina#process#open(git, args, pipe)
  setlocal filetype=gina-status
endfunction

function! s:compare_record(a, b) abort
  let a = matchstr(a:a, '...\zs.*')
  let b = matchstr(a:b, '...\zs.*')
  return a ==# b ? 0 : a > b ? 1 : -1
endfunction

function! s:get_candidates(fline, lline) abort
  let args = gina#core#meta#get_or_fail('args')
  let residual = args.residual()
  let candidates = map(
        \ getline(a:fline, a:lline),
        \ 's:parse_record(v:val, residual)'
        \)
  return filter(candidates, '!empty(v:val)')
endfunction

function! s:parse_record(record, residual) abort
  let record = s:String.remove_ansi_sequences(a:record)
  let m = matchlist(
        \ record,
        \ '^\(..\) \("[^"]\{-}"\|.\{-}\)\%( -> \("[^"]\{-}"\|[^ ]\+\)\)\?$'
        \)
  if empty(m) || m[1] ==# '##'
    return {}
  endif
  let candidate = {
        \ 'word': record,
        \ 'abbr': a:record,
        \ 'sign': m[1],
        \ 'residual': a:residual,
        \}
  if len(m) && !empty(m[3])
    return extend(candidate, {
          \ 'path': s:strip_quotes(m[3]),
          \ 'path1': s:strip_quotes(m[2]),
          \ 'path2': s:strip_quotes(m[3]),
          \})
  else
    return extend(candidate, {
          \ 'path': s:strip_quotes(m[2]),
          \ 'path1': s:strip_quotes(m[2]),
          \ 'path2': '',
          \})
  endif
endfunction

function! s:strip_quotes(str) abort
  return a:str =~# '^\%(".*"\|''.*''\)$' ? a:str[1:-2] : a:str
endfunction


" Writer ---------------------------------------------------------------------
let s:writer = gina#util#inherit(gina#process#pipe#stream_writer())

function! s:writer.on_stop() abort
  call self.super(s:writer, 'on_stop')
  call gina#core#emitter#emit('command:called', s:SCHEME)
endfunction


" Config ---------------------------------------------------------------------
call gina#config(expand('<sfile>'), {
      \ 'use_default_aliases': 1,
      \ 'use_default_mappings': 1,
      \})
