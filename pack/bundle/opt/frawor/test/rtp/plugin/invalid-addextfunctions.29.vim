execute frawor#Setup('0.0', {'@/functions': '0.0',
            \               '@/decorators': '0.0'})
call s:_f.adddecorator('test', function('string'))
call s:_f.addextfunctions({'Function': {'function': function('tr'),
            \                              '@test': 0}})
