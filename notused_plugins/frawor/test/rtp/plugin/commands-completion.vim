execute frawor#Setup('0.0', {'@/commands': '0.0'})

call s:_f.command.add('Abc', 'call WriteFile(<q-args>)',
            \         {'complete': 'var', 'nargs': '1'})

function Complete(a, c, p)
    return [a:a.a:a]
endfunction
call s:_f.command.add('Def', 'call WriteFile(<q-args>)',
            \         {'complete': function('Complete'), 'nargs': '1'})

function s:Complete(a, c, p)
    return [join(reverse(split(a:a, '\v.@=')), '')]
endfunction
call s:_f.command.add('Ghi', 'call WriteFile(<q-args>)',
            \         {'complete': function('s:Complete'), 'nargs': '1'})

function s:F.complete(a, c, p)
    return [a:a.join(reverse(split(a:a, '.\@=')), '')]
endfunction
call s:_f.command.add('Jkl', 'call WriteFile(<q-args>)',
            \         {'complete': s:F.complete, 'nargs': '1'})

let s:list=['abc']
call s:_f.command.add('Mno', 'call WriteFile(<q-args>)',
            \         {'complete': ['in list'], 'nargs': '1'})

let s:list2=['def']
call s:_f.command.add('Pqr', 'call WriteFile(<q-args>)',
            \         {'complete': ['in list2', 'complete'], 'nargs': '1'})
