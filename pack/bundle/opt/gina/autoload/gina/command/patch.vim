let s:Group = vital#gina#import('Vim.Buffer.Group')
let s:Path = vital#gina#import('System.Filepath')
let s:String = vital#gina#import('Data.String')

let s:SCHEME = gina#command#scheme(expand('<sfile>'))
let s:WORKTREE = '@@'
let s:is_windows = has('win32') || has('win64')


function! gina#command#patch#call(range, args, mods) abort
  call gina#process#register(s:SCHEME, 1)
  try
    call s:call(a:range, a:args, a:mods)
  finally
    call gina#process#unregister(s:SCHEME, 1)
  endtry
endfunction


" Private --------------------------------------------------------------------
function! s:build_args(git, args) abort
  let args = a:args.clone()
  let args.params.groups = [
        \ args.pop('--group1', 'patch-l'),
        \ args.pop('--group2', 'patch-c'),
        \ args.pop('--group3', 'patch-r'),
        \]
  let args.params.opener = args.pop('--opener', 'edit')
  call gina#core#args#extend_path(a:git, args, args.pop(1))
  call gina#core#args#extend_line(a:git, args, args.pop('--line'))
  call gina#core#args#extend_col(a:git, args, args.pop('--col'))
  return args.lock()
endfunction

function! s:open(n, mods, opener, rev, params) abort
  if a:rev ==# s:WORKTREE
    execute printf(
          \ '%s Gina edit %s %s %s %s %s %s',
          \ a:mods,
          \ a:params.cmdarg,
          \ gina#util#shellescape(a:opener, '--opener='),
          \ gina#util#shellescape(a:params.groups[a:n], '--group='),
          \ gina#util#shellescape(a:params.line, '--line='),
          \ gina#util#shellescape(a:params.col, '--col='),
          \ gina#util#shellescape(a:params.path),
          \)
  else
    let treeish = gina#core#treeish#build(a:rev, a:params.path)
    execute printf(
          \ '%s Gina show %s %s %s %s %s %s',
          \ a:mods,
          \ a:params.cmdarg,
          \ gina#util#shellescape(a:opener, '--opener='),
          \ gina#util#shellescape(a:params.groups[a:n], '--group='),
          \ gina#util#shellescape(a:params.line, '--line='),
          \ gina#util#shellescape(a:params.col, '--col='),
          \ gina#util#shellescape(treeish),
          \)
  endif
endfunction

function! s:call(range, args, mods) abort
  let git = gina#core#get_or_fail()
  let args = s:build_args(git, a:args)
  let mods = gina#util#contain_direction(a:mods)
        \ ? 'keepalt ' . a:mods
        \ : join(['keepalt', 'rightbelow', a:mods])
  let group = s:Group.new()

  diffoff!
  let opener1 = args.params.opener
  let opener2 = empty(matchstr(&diffopt, 'vertical'))
        \ ? 'split'
        \ : 'vsplit'

  call s:open(0, mods, opener1, 'HEAD', args.params)
  let bufnr1 = bufnr('%')

  call s:open(1, mods, opener2, ':0', args.params)
  let bufnr2 = bufnr('%')

  call s:open(2, mods, opener2, s:WORKTREE, args.params)
  let bufnr3 = bufnr('%')

  " WORKTREE
  call gina#util#diffthis()
  call group.add({'keep': 1})
  call s:define_plug_mapping('diffput', bufnr2)
  call s:define_plug_mapping('diffget', bufnr2)
  if g:gina#command#patch#use_default_mappings
    nmap dp <Plug>(gina-diffput)
    nmap do <Plug>(gina-diffget)
  endif

  " HEAD
  execute printf('%dwincmd w', bufwinnr(bufnr1))
  call gina#util#diffthis()
  call group.add()
  call s:define_plug_mapping('diffput', bufnr2)
  if g:gina#command#patch#use_default_mappings
    nmap dp <Plug>(gina-diffput)
  endif

  " INDEX
  execute printf('%dwincmd w', bufwinnr(bufnr2))
  call gina#util#diffthis()
  call group.add()
  call s:define_plug_mapping('diffput', bufnr3)
  call s:define_plug_mapping('diffget', bufnr1, '-l')
  call s:define_plug_mapping('diffget', bufnr3, '-r')
  if g:gina#command#patch#use_default_mappings
    nmap dp <Plug>(gina-diffput)
    nmap dol <Plug>(gina-diffget-l)
    nmap dor <Plug>(gina-diffget-r)
  endif

  setlocal buftype=acwrite
  setlocal modifiable
  augroup gina_command_patch_internal
    autocmd! * <buffer>
    autocmd BufWriteCmd <buffer> call s:BufWriteCmd()
  augroup END

  call gina#util#diffupdate()
  normal! zm
  call gina#core#emitter#emit('command:called', s:SCHEME)
endfunction

function! s:define_plug_mapping(command, bufnr, ...) abort
  let suffix = a:0 ? a:1 : ''
  let lhs = printf('<Plug>(gina-%s%s)', a:command, suffix)
  let rhs = printf(':<C-u>%s %d<CR>', a:command, a:bufnr)
  call gina#util#map(lhs, rhs, {
        \ 'mode': 'n',
        \ 'noremap': 1,
        \ 'silent': 1,
        \})
endfunction

function! s:patch(git) abort
  let abspath = gina#core#path#expand('%')
  let path = gina#core#repo#relpath(a:git, abspath)
  call gina#process#call_or_fail(a:git, [
        \ 'add',
        \ '--intent-to-add',
        \ '--',
        \ s:Path.realpath(abspath),
        \])
  let diff = s:diff(a:git, path, getline(1, '$'))
  let result = s:apply(a:git, diff)
  return result
endfunction

function! s:diff(git, path, buffer) abort
  let tempfile = tempname()
  let tempfile1 = tempfile . '.index'
  let tempfile2 = tempfile . '.buffer'
  try
    if writefile(s:index(a:git, a:path), tempfile1) == -1
      return
    endif
    if writefile(a:buffer, tempfile2) == -1
      return
    endif
    " NOTE:
    " --no-index force --exit-code option.
    " --exit-code mean that the program exits with 1 if there were differences
    " and 0 means no differences
    let result = gina#process#call(a:git, [
          \ 'diff',
          \ '--no-index',
          \ '--unified=1',
          \ '--',
          \ tempfile1,
          \ tempfile2,
          \])
    if !result.status
      throw gina#core#exception#info(
            \ 'No difference between index and buffer'
            \)
    endif
    return s:replace_filenames_in_diff(
          \ result.content,
          \ tempfile1,
          \ tempfile2,
          \ a:path,
          \)
  finally
    silent! call delete(tempfile1)
    silent! call delete(tempfile2)
  endtry
endfunction

function! s:index(git, path) abort
  let result = gina#process#call(a:git, ['show', ':' . a:path])
  if result.status
    return []
  endif
  return result.content
endfunction

function! s:replace_filenames_in_diff(content, filename1, filename2, repl) abort
  " replace tempfile1/tempfile2 in the header to a:filename
  "
  "   diff --git a/<tempfile1> b/<tempfile2>
  "   index XXXXXXX..XXXXXXX XXXXXX
  "   --- a/<tempfile1>
  "   +++ b/<tempfile2>
  "
  let src1 = s:String.escape_pattern(a:filename1)
  let src2 = s:String.escape_pattern(a:filename2)
  if s:is_windows
    " NOTE:
    " '\' in {content} from 'git diff' are escaped so double escape is required
    " to substitute such path
    " NOTE:
    " escape(src1, '\') cannot be used while other characters such as '.' are
    " already escaped as well
    let src1 = substitute(src1, '\\\\', '\\\\\\\\', 'g')
    let src2 = substitute(src2, '\\\\', '\\\\\\\\', 'g')
  endif
  let repl = (a:filename1 =~# '^/' ? '/' : '') . a:repl
  let content = copy(a:content)
  let content[0] = substitute(content[0], src1, repl, '')
  let content[0] = substitute(content[0], src2, repl, '')
  let content[2] = substitute(content[2], src1, repl, '')
  let content[3] = substitute(content[3], src2, repl, '')
  return content
endfunction

function! s:apply(git, content) abort
  let tempfile = tempname()
  try
    if writefile(a:content, tempfile) == -1
      return
    endif
    let result = gina#process#call_or_fail(a:git, [
          \ 'apply',
          \ '--verbose',
          \ '--cached',
          \ '--',
          \ tempfile,
          \])
    call gina#core#emitter#emit('command:called:patch')
    return result
  finally
    silent! call delete(tempfile)
  endtry
endfunction

function! s:BufWriteCmd() abort
  let git = gina#core#get_or_fail()
  let result = gina#core#exception#call(function('s:patch'), [git])
  if !empty(result)
    call gina#process#inform(result)
    setlocal nomodified
  endif
  call gina#util#diffupdate()
endfunction


" Event ----------------------------------------------------------------------
function! s:on_command_called_patch(...) abort
  call gina#core#emitter#emit('modified:delay')
endfunction

if !exists('s:subscribed')
  let s:subscribed = 1
  call gina#core#emitter#subscribe(
        \ 'command:called:patch',
        \ function('s:on_command_called_patch')
        \)
endif


" Config ---------------------------------------------------------------------
call gina#config(expand('<sfile>'), {
      \ 'use_default_mappings': 1,
      \})
