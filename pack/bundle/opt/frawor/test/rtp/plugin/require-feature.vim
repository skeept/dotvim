execute frawor#Setup('0.0', {'@frawor': '1.0',
            \ '@plugin-with-feature-4': '0.0',})
function s:F.main()
    call WriteFile('Entered s:F.main()')
    runtime plugin/plugin-with-feature-2.vim
    call WriteFile('Has run :runtime')
    call FraworLoad('@plugin-with-feature-3')
    call WriteFile('Has run FraworLoad')
    call WriteFile('require pwf1: '.s:_f.require('@plugin-with-feature-1', [0, 0], 0))
    call WriteFile('require pwf2: '.s:_f.require('@plugin-with-feature-2', [0, 0], 0))
    call WriteFile('require pwf3: '.s:_f.require('@plugin-with-feature-3', [0, 0], 0))
    call WriteFile('require pwf4: '.s:_f.require('@plugin-with-feature-4', [0, 0], 0))
    call WriteFile('require pwf: '. s:_f.require('@plugin-with-feature',   [0, 0], 0))
    call WriteFile(sort(keys(s:_f)))
    call WriteFile('require xup: '.s:_f.require('@xxx-unexistent-plugin',  [0, 0], 0))
    call WriteFile('require xup: '.s:_f.require('@xxx-unexistent-plugin',  [0, 0], 1))
endfunction
call WriteFile(sort(keys(s:_f)))
call s:F.main()
