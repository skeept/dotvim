let s:Guard = vital#gina#import('Vim.Guard')
let s:Queue = vital#gina#import('Data.Queue')
let s:String = vital#gina#import('Data.String')


" Default pipe ---------------------------------------------------------------
function! gina#process#pipe#default() abort
  let pipe = copy(s:default_pipe)
  return pipe
endfunction

let s:default_pipe = {}

function! s:default_pipe.on_start() abort
  call gina#process#register(self)
endfunction

function! s:default_pipe.on_exit(data) abort
  call gina#process#unregister(self)
endfunction



" Store pipe -----------------------------------------------------------------
function! gina#process#pipe#store() abort
  let pipe = deepcopy(s:store_pipe)
  let pipe._stdout = ['']
  let pipe._stderr = ['']
  let pipe._content = ['']
  return pipe
endfunction

let s:store_pipe = gina#util#inherit(gina#process#pipe#default())

function! s:store_pipe.on_stdout(data) abort
  call gina#util#extend_content(self._stdout, a:data)
  call gina#util#extend_content(self._content, a:data)
endfunction

function! s:store_pipe.on_stderr(data) abort
  call gina#util#extend_content(self._stderr, a:data)
  call gina#util#extend_content(self._content, a:data)
endfunction
"
function! s:store_pipe.on_exit(data) abort
  if empty(get(self._content, -1, 'a'))
    call remove(self._content, -1)
  endif
  if empty(get(self._stdout, -1, 'a'))
    call remove(self._stdout, -1)
  endif
  if empty(get(self._stderr, -1, 'a'))
    call remove(self._stderr, -1)
  endif
  call self.super(s:store_pipe, 'on_exit', a:data)
endfunction


" Echo pipe ------------------------------------------------------------------
function! gina#process#pipe#echo() abort
  let pipe = deepcopy(s:echo_pipe)
  return pipe
endfunction

let s:echo_pipe = gina#util#inherit(gina#process#pipe#store())

function! s:echo_pipe.on_exit(data) abort
  if len(self._content)
    call gina#core#console#message(
          \ s:String.remove_ansi_sequences(join(self._content, "\n")),
          \)
  endif
  call self.super(s:echo_pipe, 'on_exit', a:data)
endfunction


" Stream pipe ----------------------------------------------------------------
function! gina#process#pipe#stream(...) abort
  let pipe = deepcopy(s:stream_pipe)
  let pipe.writer = gina#core#writer#new(a:0 ? a:1 : s:stream_pipe_writer)
  return pipe
endfunction

function! gina#process#pipe#stream_writer() abort
  return deepcopy(s:stream_pipe_writer)
endfunction

let s:stream_pipe = gina#util#inherit(gina#process#pipe#default())
let s:stream_pipe_writer = {}

function! s:stream_pipe.on_start() abort
  call self.super(s:stream_pipe, 'on_start')
  let self.writer._job = self
  call self.writer.start()
endfunction

function! s:stream_pipe.on_stdout(data) abort
  call self.writer.write(a:data)
endfunction

function! s:stream_pipe.on_exit(data) abort
  call self.super(s:stream_pipe, 'on_exit', a:data)
  call self.writer.stop()
endfunction

function! s:stream_pipe_writer.on_start() abort
  let self._winview = getbufvar(self.bufnr, 'gina_winview', [])
  let self._spinner = gina#core#spinner#start(self.bufnr)
  call gina#process#register('writer:' . self.bufnr, 1)
  call gina#core#emitter#emit('writer:started', self.bufnr)
endfunction

function! s:stream_pipe_writer.on_write(msg) abort
  call gina#core#emitter#emit('writer:wrote', self.bufnr, a:msg)
endfunction

function! s:stream_pipe_writer.on_flush(msg) abort
  call gina#core#emitter#emit('writer:flushed', self.bufnr, a:msg)
endfunction

function! s:stream_pipe_writer.on_stop() abort
  call self._job.stop()
  call self._spinner.stop()

  let focus = gina#core#buffer#focus(self.bufnr)
  if empty(focus) || bufnr('%') != self.bufnr
    call gina#core#emitter#emit('writer:stopped', self.bufnr)
    call gina#process#unregister('writer:' . self.bufnr, 1)
    return
  endif
  let guard = s:Guard.store(['&l:modifiable'])
  try
    setlocal modifiable
    if empty(getline('$'))
      silent $delete _
    endif
    setlocal nomodified
  finally
    if !empty(self._winview)
      silent! call winrestview(self._winview)
    endif
    call guard.restore()
    call focus.restore()
    call gina#core#emitter#emit('writer:stopped', self.bufnr)
    call gina#process#unregister('writer:' . self.bufnr, 1)
  endtry
endfunction


" Automatically update b:gina_winview with cursor move while no buffer content
" is available in BufReadCmd and winsaveview() always returns unwilling value
augroup gina_process_pipe_internal
  autocmd! *
  autocmd BufEnter  gina://* let b:gina_winview = winsaveview()
  autocmd CursorMoved  gina://* let b:gina_winview = winsaveview()
  autocmd CursorMovedI gina://* let b:gina_winview = winsaveview()
augroup END
