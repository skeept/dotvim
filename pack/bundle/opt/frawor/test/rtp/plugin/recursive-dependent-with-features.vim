execute frawor#Setup('0.0', {'@recursive-dependent-with-features.2': '0.0',
            \                '@recursive-dependent-with-features':   '0.0'})
function s:F.writefeature(plugdict, fdict)
    call WriteFile(a:plugdict.id.': '.join(sort(keys(s:_f))))
endfunction
call s:_f.newfeature('write1', {'cons': s:F.writefeature})
call WriteFile('+++ '.s:_frawor.id)
if has_key(s:_f, 'write1')
    call s:_f.write1()
endif
if has_key(s:_f, 'write2')
    call s:_f.write2()
endif
call WriteFile('---')

