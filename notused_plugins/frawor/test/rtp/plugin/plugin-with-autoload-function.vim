execute frawor#Setup('0.0', {'@/functions': '0.1',
            \               '@/decorators': '0.0',
            \'@plugin-with-autoload-function': '0.0'})
function s:F.tracerun(plugdict, fname, ...)
    call WriteFile('In tracerun for '.a:fname)
    return [0, '@@@', 0, ['try',
                \           'call WriteFile("Calling '.a:fname.'")'],
                \        ['finally',
                \           'call WriteFile("Finished '.a:fname.'")',
                \         'endtry'], 0]
endfunction
function s:F.func(...)
    return a:0 == 1 ? a:1 : a:000
endfunction
call s:_f.adddecorator('tracerun', s:F.tracerun)
let s:_aufunctions.tracedfunc={'function': s:F.func, '@tracerun': []}
