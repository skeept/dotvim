execute frawor#Setup('0.0', {'@/commands': '0.0'})

W- String + no options
function Abc()
    W$ Abc
endfunction
let s:_functions+=['Abc']
call s:_f.command.add('Abc', 'call Abc()', {})
Abc

W- nargs
call s:_f.command.add('WF', 'call WriteFile(<q-args>)', {'nargs': '+'})
try
    WF
catch
    call WriteFile('caught '.matchstr(v:exception, 'E\d\+'))
endtry
WF$ WF

W- range
call s:_f.command.add('Def', 'call WriteFile(<line1>, <line2>)', {'range': '%'})
if line('$')==1
    call append('.', ['', '', ''])
endif
Def
.Def

W- count
call s:_f.command.add('Ghi', 'call WriteFile(<line1>, <line2>)',{'count': '20'})
2Ghi

W- bang
call s:_f.command.add('Jkl', 'call WriteFile("bang: ".<bang>0)', {'bang': 1})
Jkl
Jkl!

W- bar
call s:_f.command.add('Mno', 'call WriteFile(<q-args>)', {'nargs': '1',
            \                                             'bar': 0})
call s:_f.command.add('Pqr', 'call WriteFile(<q-args>)', {'nargs': '1'})
Mno 1 | Pqr 2
Pqr 3 | Mno 4

W- Fref + no options
call s:_f.command.add('Stu', function('Abc'), {})
Stu

W- rsplitfunc: regex
call s:_f.command.add('Vwx', function('WriteFile'), {'rsplitfunc': '-'})
Vwx abc-def-ghi
Vwx abc def

W- rsplitfunc: function
function Rsplit(cmdline)
    return split(a:cmdline, ':')
endfunction
let s:_functions+=['Rsplit']
call s:_f.command.add('Yz', function('WriteFile'),
            \         {'rsplitfunc': function('Rsplit')})
Yz abc:def:ghi
Yz abc def

W- rsplitfunc: 0
call s:_f.command.add('Zy', function('WriteFile'), {'rsplitfunc': 0,
            \                                       'nargs': '+'})
Zy abc:def:ghi
Zy abc def ghi
