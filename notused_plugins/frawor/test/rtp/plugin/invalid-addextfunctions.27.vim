execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0',
            \'@invalid-addextfunctions.27': '0.0'})
function s:F.checker(...)
    return 0
endfunction
call s:_f.addaltspecial("test", function("winsaveview"), function("winrestview"), {'requiresarg': 1, 'checker': s:F.checker})
call s:_f.addextfunctions({'Function': {'function': function('tr'),
            \                         '@altervars': [['+test(...)']]}})
