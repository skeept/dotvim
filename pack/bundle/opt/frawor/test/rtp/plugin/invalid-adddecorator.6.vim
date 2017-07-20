execute frawor#Setup('0.0', {'@/decorators': '0.0',
            \                 '@/functions': '0.0',
            \     '@invalid-adddecorator.6': '0.0'})
function s:InvalidDecorator(...)
    return 0
endfunction
call s:_f.adddecorator("abc", function('s:InvalidDecorator'))
call s:_f.addextfunctions({'Function': {'function': function('s:InvalidDecorator'),
            \                               '@abc': 0}})
