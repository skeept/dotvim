execute frawor#Setup('0.0', {'@/commands': '0.0'})

function PrintArgs(...)
    call WriteFile(string(a:000))
endfunction

call s:_f.command.add('Abc', function('PrintArgs'), {'nargs': '1'})
Abc-def

call s:_f.command.add('Def', function('PrintArgs'), {'nargs': '1', 'bang': 1})
Def-ghi

call s:_f.command.add('Ghi', function('PrintArgs'), {'nargs': '1', 'count': 1})
Ghi-jkl

call s:_f.command.add('Jkl', function('PrintArgs'), {'nargs': '1', 'range': 1})
Jkl-mno

call s:_f.command.add('Mno', function('PrintArgs'), {'nargs': '1', 'register': 1})
Mno-pqr

call s:_f.command.add('Pqr', function('PrintArgs'), {'nargs': '1', 'register': 1,
            \                                        'bang': 1,    'count': 1})
Pqr-stu
Pqr!stu
