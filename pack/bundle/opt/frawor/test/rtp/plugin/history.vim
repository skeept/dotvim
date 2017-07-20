execute frawor#Setup('0.0', {'@/history': '0.0',
            \   '@/decorators/altervars': '0.0',
            \              '@/functions': '0.0',})
function s:F.printhist()
    call WriteFile('     /: '.string(s:_r.history.get('/')))
    call WriteFile('  expr: '.string(s:_r.history.get('expr')))
    call WriteFile('     @: '.string(s:_r.history.get('@')))
    call WriteFile('   cmd: '.string(s:_r.history.get('cmd')))
endfunction
W History:
call s:F.printhist()
W Clear ::
call s:_r.history.clear(':')
call s:F.printhist()
W Set expr:
call s:_r.history.set('expr', ['foo', 'bar'])
call s:F.printhist()
W Check +history:
function s:F.modhist()
    call histadd('@', 'baz')
    call histadd('cmd', 'foobar')
    call s:_r.history.clear('/')
    call s:F.printhist()
endfunction
let s:F.modhist=s:_f.wrapfunc({'function': s:F.modhist,
            \                '@altervars': [['+history(cmd)'],
            \                               ['+history(expr)'],
            \                               ['+history(/)']]})
call s:F.modhist()
W Restored:
call s:F.printhist()
