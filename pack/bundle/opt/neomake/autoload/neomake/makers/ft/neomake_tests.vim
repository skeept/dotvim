if !exists('g:neomake_test_messages')
    " Only use it during tests.
    finish
endif

function! neomake#makers#ft#neomake_tests#EnabledMakers() abort
    return get(b:, 'neomake_test_enabledmakers',
                \ get(g:, 'neomake_test_enabledmakers',
                \ ['maker_without_exe', 'nonexisting']))
endfunction

function! neomake#makers#ft#neomake_tests#maker_without_exe() abort
    return {}
endfunction

function! neomake#makers#ft#neomake_tests#echo_maker() abort
    return {
        \ 'exe': 'printf',
        \ 'args': 'neomake_tests_echo_maker',
        \ 'errorformat': '%m',
        \ 'append_file': 0,
        \ }
endfunction

function! neomake#makers#ft#neomake_tests#true() abort
    return {}
endfunction

function! neomake#makers#ft#neomake_tests#process_output_error() abort
    let maker = {'exe': 'echo', 'args': 'output', 'append_file': 0}

    function! maker.process_output(...) abort
        return [{'valid': 1, 'text': 'error', 'lnum': 1, 'bufnr': bufnr('%')}]
    endfunction
    return maker
endfunction
