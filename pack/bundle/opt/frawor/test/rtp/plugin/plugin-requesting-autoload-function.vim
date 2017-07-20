execute frawor#Setup('0.0', {'@/functions': '0.1'})
W::: Get 1
let s:F.func=s:_f.wrapfunc({'function': ['@plugin-with-autoload-function', [0, 0], 'tracedfunc']})
W::: Get 2
let s:F.func2=s:_f.wrapfunc({'function': ['@plugin-with-double-autoload-function', [0, 0], 'tracedfunc']})
W::: Run 1
call s:F.func()
W::: Run 2
call s:F.func2()
