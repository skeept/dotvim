"▶1 
execute frawor#Setup('0.0', {})
"▶1 s:source
function unite#sources#aurum#define()
    return s:source
endfunction
let s:source={
            \'name': 'aurum',
            \'description': 'Changeset files',
            \'hooks': {},
        \}
function s:source.hooks.on_init(args, context)
    let a:context.source__files=a:args[0]
    let a:context.source__cbargs=a:args[1]
endfunction
function s:source.gather_candidates(args, context)
    return map(copy(a:context.source__files),
                \'{"word": v:val, '.
                \ '"abbr": v:val, '.
                \ '"kind": "aurum", '.
                \ '"action__cbargs": a:context.source__cbargs, '.
                \'}')
endfunction
"▶1
call frawor#Lockvar(s:, 'source')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
