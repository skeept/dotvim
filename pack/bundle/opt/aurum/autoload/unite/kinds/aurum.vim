"▶1 
execute frawor#Setup('0.0', {})
"▶1 s:kind
function unite#kinds#aurum#define()
    return s:kind
endfunction
let s:kind={
            \          'name': 'aurum',
            \'default_action': 'open',
            \  'action_table': {'open': {'description': 'open file',
            \                          'is_selectable': 1,}},
            \       'parents': ['file'],
        \}
function s:kind.action_table.open.func(candidates)
    if !empty(a:candidates)
        let cbargs=a:candidates[0].action__cbargs
        call call(cbargs[0], [a:candidates[0].word]+cbargs[1:], {})
    endif
endfunction
"▶1
call frawor#Lockvar(s:, 'kind')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
