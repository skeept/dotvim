execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \               '@/functions': '0.0'})
function s:F.strfunc(char, ...)
    if a:0
        call WriteFile('strfunc: ('.string([a:char]+a:000)[1:-2].')')
    endif
    if a:char=~#'^\u$'
        return [ 1,  0,  0]
    elseif a:char=~#'^\l$'
        return [ 2,  0,  0]
    elseif a:char=~#'^\s$'
        return [ 3,  0,  0]
    elseif a:char=~#'^\d$'
        return [ 1,  1,  0]
    elseif a:char is# ','
        return [ 2,  2,  0]
    elseif a:char is# '.'
        return [ 3,  3,  0]
    elseif a:char is# '-'
        return [ 1,  0,  4]
    elseif a:char is# ';'
        return [ 2,  0,  5]
    elseif a:char is# '!'
        return [ 3,  0,  6]
    elseif a:char is# '+'
        return [ 1,  7,  8]
    elseif a:char is# ':'
        return [ 2,  9, 10]
    elseif a:char is# '?'
        return [ 3, 11, 12]
    elseif a:char is# '^'
        return [-1,  0,  0]
    elseif a:char is# '#'
        return [-1,  0, 13]
    elseif a:char is# '%'
        return [-1, 14,  0]
    elseif a:char is# '&'
        return [-1, 15, 16]
    endif
    return [0, 0, 0]
endfunction
function MapFunc(...)
    call WriteFile('args: ('.string(a:000)[1:-2].')')
    return ''
endfunction
let s:_functions+=['MapFunc']

call s:_f.mapgroup.add('Strfunc', {'1': {'rhs': ['%lhs', '%str'],
            \                        'strfunc': s:F.strfunc,
            \                           'func': function('MapFunc'),
            \                            'lhs': 'a',},
            \                      '2': {'rhs': {'function':
            \                                    function('MapFunc')},
            \                        'strfunc': s:F.strfunc,
            \                           'args': ['%lhs', '%str'],
            \                            'lhs': 'b',},
            \                      '3': {'rhs':
            \                             ':<C-u>call MapFunc(%str)<CR>',
            \                        'strfunc': s:F.strfunc,
            \                            'lhs': 'c'},
            \                     })
