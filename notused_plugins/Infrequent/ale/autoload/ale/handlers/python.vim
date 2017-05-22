" Author: w0rp <devw0rp@gmail.com>
" Description: Error handling for flake8, etc.

function! ale#handlers#python#HandlePEP8Format(buffer, lines) abort
    " Matches patterns line the following:
    "
    " Matches patterns line the following:
    "
    " stdin:6:6: E111 indentation is not a multiple of four
    " test.yml:35: [EANSIBLE0002] Trailing whitespace
    let l:pattern = '\v^[a-zA-Z]?:?[^:]+:(\d+):?(\d+)?: \[?([[:alnum:]]+)\]? (.*)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:code = l:match[3]

        if (l:code ==# 'W291' || l:code ==# 'W293' || l:code ==# 'EANSIBLE002')
        \ && !ale#Var(a:buffer, 'warn_about_trailing_whitespace')
            " Skip warnings for trailing whitespace if the option is off.
            continue
        endif

        if l:code ==# 'I0011'
            " Skip 'Locally disabling' message
             continue
        endif

        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'col': l:match[2] + 0,
        \   'text': l:code . ': ' . l:match[4],
        \   'type': l:code[:0] ==# 'E' ? 'E' : 'W',
        \})
    endfor

    return l:output
endfunction

function! ale#handlers#python#AutoPEP8(buffer, lines) abort
    return {
    \   'command': 'autopep8 -'
    \}
endfunction

function! ale#handlers#python#ISort(buffer, lines) abort
    let l:config = ale#path#FindNearestFile(a:buffer, '.isort.cfg')
    let l:config_options = !empty(l:config)
    \   ? ' --settings-path ' . ale#Escape(l:config)
    \   : ''

    return {
    \   'command': 'isort' . l:config_options . ' -',
    \}
endfunction

function! ale#handlers#python#YAPF(buffer, lines) abort
    let l:config = ale#path#FindNearestFile(a:buffer, '.style.yapf')
    let l:config_options = !empty(l:config)
    \   ? ' --style ' . ale#Escape(l:config)
    \   : ''

    return {
    \   'command': 'yapf --no-local-style' . l:config_options,
    \}
endfunction
