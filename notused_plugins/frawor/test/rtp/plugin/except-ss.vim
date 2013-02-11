execute frawor#Setup('0.0', {'@/functions': '0.0',
            \                 '@except-ss': '0.0',
            \     '@/decorators/altervars': '0.0'})
function s:F.saver()
    throw "Saver exception"
endfunction
function s:F.setter(arg)
    throw "Setter exception"
endfunction
function s:F.wrappedfunc(...)
    echo 'args: ('.string(a:000)[1:-2].')'
endfunction
call s:_f.addaltspecial('test', s:F.saver, s:F.setter)
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+test']]},
            \             'Function2': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+test', 0]]}})
call Function(1)
echo "==="
call Function2(2)

