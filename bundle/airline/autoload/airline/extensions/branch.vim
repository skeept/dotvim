" MIT License. Copyright (c) 2013 Bailey Ling.
" vim: et ts=2 sts=2 sw=2

let s:has_fugitive = exists('*fugitive#head')
let s:has_fugitive_detect = exists('*fugitive#detect')
let s:has_lawrencium = exists('*lawrencium#statusline')

if !s:has_fugitive && !s:has_lawrencium
  finish
endif

let s:empty_message = get(g:, 'airline#extensions#branch#empty_message',
      \ get(g:, 'airline_branch_empty_message', ''))
let s:symbol = get(g:, 'airline#extensions#branch#symbol', g:airline_symbols.branch)

function! airline#extensions#branch#get_head()
  let head = ''

  if s:has_fugitive && !exists('b:mercurial_dir')
    let head = fugitive#head()

    if empty(head) && s:has_fugitive_detect && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head()
    endif
  endif

  if empty(head)
    if s:has_lawrencium
      let head = lawrencium#statusline()
    endif
  endif

  return empty(head) || !s:check_in_path()
        \ ? s:empty_message
        \ : printf('%s%s', empty(s:symbol) ? '' : s:symbol.(g:airline_symbols.space), head)
endfunction

function! s:check_in_path()
  if !exists('b:airline_branch_path')
    let root = get(b:, 'git_dir', get(b:, 'mercurial_dir', ''))
    let bufferpath = resolve(fnamemodify(expand('%'), ':p:h'))

    if !filereadable(root) "not a file
      " if .git is a directory, it's the old submodule format
      if match(root, '\.git$') >= 0
        let root = expand(fnamemodify(root, ':h'))
      else
        " else it's the newer format, and we need to guesstimate
        let pattern = '\.git\(\\\|\/\)modules\(\\\|\/\)'
        if match(root, pattern) >= 0
          let root = substitute(root, pattern, '', '')
        endif
    endif

    let b:airline_file_in_root = stridx(bufferpath, root) > -1
  endif
  return b:airline_file_in_root
endfunction

function! airline#extensions#branch#init(ext)
  call airline#parts#define_function('branch', 'airline#extensions#branch#get_head')

  autocmd BufReadPost * unlet! b:airline_file_in_root
endfunction

