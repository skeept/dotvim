execute frawor#Setup('0.0', {'@/commands': '0.0'})
call s:_f.command.add('Abc', 'call Abc()', {})
let s:g={}
call FraworRegister(0, s:_sid, 'xxx', {'@/commands': [0]}, s:g)
call s:g._f.command.del('Abc')
call s:_f.command.del('Abc')

