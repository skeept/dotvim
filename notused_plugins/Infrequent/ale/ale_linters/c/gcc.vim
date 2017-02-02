" Author: w0rp <devw0rp@gmail.com>
" Description: gcc linter for c files

" Set this option to change the GCC options for warnings for C.
if !exists('g:ale_c_gcc_options')
    " let g:ale_c_gcc_options = '-Wall'
    " let g:ale_c_gcc_options = '-std=c99 -Wall'
    " c11 compatible
    let g:ale_c_gcc_options = '-std=c11 -Wall'
endif

function! ale_linters#c#gcc#GetCommand(buffer) abort
    return 'gcc -S -x c -fsyntax-only '
    \      . g:ale_c_gcc_options . ' -'

endfunction

call ale#linter#Define('c', {
\   'name': 'gcc',
\   'output_stream': 'stderr',
\   'executable': 'gcc',
\   'command_callback': 'ale_linters#c#gcc#GetCommand',
\   'callback': 'ale#handlers#HandleGCCFormat',
\})
