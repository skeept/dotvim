scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',})
let s:_messages={
            \ 'nunsup': 'Naming is not supported for repository %s',
            \'ukntype': 'Unknown label type: %s. Supported types: %s',
            \   'ldef': 'Label %s with type %s was alredy defined',
        \}
let s:_aufunctions.cmd={'@FWC': ['-onlystrings _ '.
            \'type ""'.
            \'{  repo '.s:_r.cmdutils.comp.repo.
            \' ? type   type ""'.
            \' ?!delete'.
            \' ?!local'.
            \'} '.
            \'+ type ""', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(bang, name, opts, ...)
    let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
    if !has_key(repo, 'labeltypes') || empty(repo.labeltypes)
        call s:_f.throw('nunsup', repo.path)
    endif
    if get(a:opts, 'delete', 0)
        let rev=0
    elseif a:0
        let rev=repo.functions.getrevhex(repo, a:1)
    else
        let rev=repo.functions.getworkhex(repo)
    endif
    if has_key(a:opts, 'type')
        let type=a:opts.type
        let lts=repo.labeltypes
        if index(lts, type)==-1
            let type=get(filter(copy(lts),
                        \       'v:val[:'.(len(type)-1).'] is# type'), 0, 0)
            if type is 0
                call s:_f.throw('ukntype', a:opts.type, join(lts, ', '))
            endif
        endif
    else
        let type=repo.labeltypes[0]
    endif
    let force=a:bang
    if rev isnot 0 && !force
        try
            let labels=repo.functions.getrepoprop(repo, type.'slist')
            if index(labels, a:name)!=-1
                let rev=0
            endif
        catch
            let rev=0
        endtry
        if rev is 0
            call s:_f.throw('ldef', a:name, type)
        endif
    endif
    call repo.functions.label(repo, type, a:name, rev, force,
                \             get(a:opts, 'local', 0))
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
