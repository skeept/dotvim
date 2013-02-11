execute frawor#Setup('0.0', {'@/decorators/altervars': '0.0'})
let s:eref=function('s:Eval')
delfunction s:Eval
call s:_f.addaltspecial("test", s:eref, s:eref)
