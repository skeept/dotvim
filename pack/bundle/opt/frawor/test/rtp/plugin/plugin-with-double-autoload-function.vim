execute frawor#Setup('0.0', {'@/functions': '0.1',
            \               '@/decorators': '0.0',
            \'@plugin-with-double-autoload-function': '0.0'})
function s:F.tracerun(plugdict, fname, ...)
    " XXX Ordering is unknown thus message is the same for both traceruns
    call WriteFile('In tracerun for '.a:fname)
    return [1, '@@@', 0, ['try',
                \           'call WriteFile("Calling '.a:fname.' (2)")'],
                \        ['finally',
                \           'call WriteFile("Finished '.a:fname.' (2)")',
                \         'endtry'], 0]
endfunction
function s:F.func(...)
    return a:0 == 1 ? a:1 : a:000
endfunction
call s:_f.adddecorator('tracerun2', s:F.tracerun)
let s:_aufunctions.tracedfunc={'function': ['@plugin-with-autoload-function', [0], 'tracedfunc'], '@tracerun2': []}
