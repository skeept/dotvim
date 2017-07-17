let s:Cache = vital#gina#import('System.Cache.Memory')
let s:Path = vital#gina#import('System.Filepath')


function! gina#complete#common#opener(arglead, cmdline, cursorpos) abort
  if a:arglead !~# '^--opener='
    return []
  endif
  let candidates = [
        \ 'split',
        \ 'vsplit',
        \ 'tabedit',
        \ 'pedit',
        \]
  let prefix = '--opener='
  return gina#util#filter(a:arglead, map(candidates, 'prefix . v:val'))
endfunction

function! gina#complete#common#command(arglead, cmdline, cursorpos) abort
  let cache = s:get_cache()
  if !cache.has('command_names')
    call cache.set('command_names', s:get_command_names())
  endif
  let command_names = cache.get('command_names')
  return gina#util#filter(a:arglead, command_names, '^_')
endfunction


" Private --------------------------------------------------------------------
function! s:get_cache() abort
  if exists('s:cache')
    return s:cache
  endif
  let s:cache = s:Cache.new()
  return s:cache
endfunction

function! s:get_command_names() abort
  let suffix = s:Path.realpath('autoload/gina/command/*.vim')
  let command_names = []
  for runtimepath in split(&runtimepath, ',')
    let names = map(
          \ glob(s:Path.join(runtimepath, suffix), 0, 1),
          \ 'matchstr(fnamemodify(v:val, '':t''), ''^.\+\ze\.vim$'')',
          \)
    call extend(command_names, names)
  endfor
  return sort(command_names)
endfunction
