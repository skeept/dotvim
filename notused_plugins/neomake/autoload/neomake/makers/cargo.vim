" vim: ts=4 sw=4 et

function! neomake#makers#cargo#cargo() abort
    return {
        \ 'args': ['build'],
        \ 'errorformat':
            \ neomake#makers#ft#rust#rustc()['errorformat'],
        \ }
endfunction
