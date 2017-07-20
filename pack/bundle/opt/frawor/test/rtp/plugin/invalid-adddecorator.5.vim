execute frawor#Setup('0.0', {'@/decorators': '0.0'})
let Decfunc=function('s:Eval')
delfunction s:Eval
call s:_f.adddecorator("abc", Decfunc)
