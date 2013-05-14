execute frawor#Setup('0.0', {'@/autocommands': '0.0',
            \                   '@/functions': '0.0'})
function s:Entered(...)
    call WriteFile(join(a:000).': '.expand('<amatch>'))
endfunction
let s:_functions+=['s:Entered']
function s:F.entered(...)
    return call('s:Entered', a:000)
endfunction
let s:ef=s:F.entered
let s:wf={'function': s:ef}
call s:_f.augroup.add('Au1', [["BufEnter", "*", 0, "call WriteFile('entered '.expand('<amatch>'))"],
            \                 ["BufEnter", "*", 0, "call <SID>Entered('2')"],
            \                 ["BufEnter", "*", 0, "if empty(expand('<amatch>'))"],
            \                 ["BufEnter", "*", 0, "    call <SID>Entered('empty')"],
            \                 ["BufEnter", "*", 0, "else"],
            \                 ["BufEnter", "*", 0, "    call <SID>Entered('non-empty')"],
            \                 ["BufEnter", "*", 0, "endif"],
            \])
call s:_f.augroup.add('Au1', [["BufEnter", "def", 1, "new ghi"],
            \                 ["BufEnter", "ghi", 0, "new jkl"],
            \                 ["BufEnter", "abc", 0, s:ef],
            \                 ["BufEnter", "abc", 0, [s:ef, 1, 2]],
            \                 ["BufEnter", "abc", 0, [s:ef]],
            \                 ["BufEnter", "abc", 0, [s:wf, 1, 2]],
            \                 ["BufEnter", "abc", 0, [s:wf]],
            \])
augroup TestEnter
    autocmd BufAdd * call s:Entered('testenter')
augroup END
let s:_augroups+=['TestEnter']
call WriteFile('===')
new
new abc
new def
function s:._unload()
    bwipeout abc
    bwipeout def
    bwipeout ghi
    bwipeout jkl
    wincmd o
endfunction
