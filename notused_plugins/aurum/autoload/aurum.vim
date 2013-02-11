"▶1 
scriptencoding utf-8
execute frawor#Setup('0.1', {'@%aurum/repo': '5.4',
            \               '@%aurum/cache': '2.3',
            \            '@%aurum/cmdutils': '4.0',})
"▶1 getcrf
function s:F.id(val)
    return a:val
endfunction
function s:F.getcrf()
    let cbvar=s:_r.cache.getcbvar()
    if has_key(cbvar, '__relfname') && has_key(cbvar, 'repo') &&
                \localtime()-cbvar._timerepo<cbvar._maxtimerepo
        return [cbvar, cbvar.repo, cbvar.__relfname]
    endif
    try
        silent let [repo, rev, file]=s:_r.cmdutils.getrrf({'repo': ':'}, 0,
                    \                                     'getsilent')[1:]
    catch /^Frawor:[^:]\+:nrepo:/
        return [cbvar, 0, 0]
    endtry
    if repo isnot 0 && file isnot 0
        call s:_r.cache.get('repo', s:F.id, [repo], {})
        let cbvar.__relfname=file
    endif
    return [cbvar, repo, file]
endfunction
"▶1 _unload
function s:._unload()
    for adesc in values(s:akeys)
        call adesc.repo.functions.aremove(adesc.repo, adesc.rcid)
    endfor
endfunction
"▶1 anew
let s:abuffers={}
let s:akeys={}
let s:astarted=0
function s:F.anew(buf, repo, key, func, ...)
    if !s:astarted
        let s:astarted=1
        lockvar s:astarted
        call s:_f.addwiper(s:F.aupdate)
    endif
    if !has_key(s:abuffers, a:buf)
        let s:abuffers[a:buf]={}
    endif
    let key=a:func.string(a:000).a:repo.path
    if !has_key(s:akeys, key)
        let interval=s:_r.cache.getinterval(a:key)
        let rcid=call(a:repo.functions['a'.a:func], [a:repo,interval]+a:000, {})
        let s:akeys[key]={'repo': a:repo, 'rcid': rcid, 'buffers': {a:buf : 1},
                    \      'key': key,    'ckey': a:key}
    else
        let s:akeys[key].buffers[a:buf]=1
    endif
    augroup AuRemoveRC
        autocmd! BufWipeOut,BufFilePost <buffer> call s:F.abw(+expand('<abuf>'))
    augroup END
    let s:abuffers[a:buf][a:key]=s:akeys[key]
    return s:F.aget(s:akeys[key], 1)
endfunction
let s:_augroups+=['AuRemoveRC']
"▶1 aget
function s:F.aget(adesc, now)
    return a:adesc.repo.functions.aget(a:adesc.repo, a:adesc.rcid, a:now)
endfunction
"▶1 abw
function s:F.abw(buf)
    if has_key(s:abuffers, a:buf)
        for adesc in values(remove(s:abuffers, a:buf))
            unlet adesc.buffers[a:buf]
            if empty(adesc.buffers)
                unlet s:akeys[adesc.key]
                call adesc.repo.functions.aremove(adesc.repo, adesc.rcid)
            endif
        endfor
        augroup AuInvalidateStatusCache
            execute 'autocmd! BufWritePost <buffer='.a:buf.'>'
        augroup END
    endif
endfunction
"▶1 aupdate
function s:F.aupdate(key)
    call map(values(s:abuffers),
                \'has_key(v:val, a:key) ? s:F.aget(v:val[a:key], 1) : 0')
endfunction
"▶1 aswitch
function s:F.aswitch()
    let bl=tabpagebuflist()
    call map(filter(bl, 'has_key(s:abuffers, v:val)'), '"".v:val')
    for adesc in filter(values(s:akeys), 'empty(filter(keys(v:val.buffers), '.
                \                                     '"index(bl,v:val)!=-1"))')
        call adesc.repo.functions.aremove(adesc.repo, adesc.rcid)
        unlet s:akeys[adesc.key]
        call map(keys(adesc.buffers), 'remove(s:abuffers[v:val], adesc.ckey)')
    endfor
endfunction
augroup AuRCSwitchBuffers
    autocmd BufEnter * :call s:F.aswitch()
augroup END
let s:_augroups+=['AuRCSwitchBuffers']
"▶1 aurum#repository
function aurum#repository()
    " TODO Path instead of buffer cache to reduce number of shell calls
    " TODO Maybe somehow tell repo.get function not to update repository
    let repo=s:_r.cache.get('repo', s:_r.repo.get, [':'], {})
    if repo is 0
        return {}
    endif
    return repo
endfunction
let s:_functions+=['aurum#repository']
"▶1 aurum#changeset
function aurum#changeset(...)
    let repo=((a:0)?(a:1):(aurum#repository()))
    if empty(repo)
        return {}
    endif
    return s:_r.cache.get('cs', repo.functions.getwork, [repo], {})
endfunction
let s:_functions+=['aurum#changeset']
"▶1 filestatus
function s:F.filestatus(status)
    return get(keys(filter(copy(a:status), '!empty(v:val)')), 0, '')
endfunction
"▶1 aurum#status
function aurum#status(...)
    if !empty(&buftype)
        return ''
    endif
    let buf=bufnr('%')
    if has_key(s:abuffers, buf) && has_key(s:abuffers[buf], 'status')
        return s:F.filestatus(s:F.aget(s:abuffers[buf].status, 0))
    endif
    let [cbvar, repo, file]=s:F.getcrf()
    if repo is 0 || file is 0
        return ''
    endif
    if has_key(repo.functions, 'astatus')
        augroup AuInvalidateStatusCache
            autocmd! BufWritePost <buffer>
                        \ :call s:F.aget(s:abuffers[expand('<abuf>')].status, 1)
        augroup END
        return s:F.filestatus(s:F.anew(buf, repo, 'status', 'status',
                    \                  0, 0, [file], 1, 1))
    endif
    augroup AuInvalidateStatusCache
        autocmd! BufWritePost <buffer> :call s:_r.cache.del('status')
    augroup END
    return s:F.filestatus(s:_r.cache.get('status', repo.functions.status,
                \                        [repo, 0, 0, [file], 1, 1], {}))
endfunction
let s:_functions+=['aurum#status']
let s:_augroups+=['AuInvalidateStatusCache']
"▶1 aurum#branch
function aurum#branch(...)
    let buf=bufnr('%')
    if has_key(s:abuffers, buf) && has_key(s:abuffers[buf], 'branch')
        return s:F.aget(s:abuffers[buf].branch, 0)
    endif
    let repo=((a:0)?(a:1):(aurum#repository()))
    if empty(repo)
        return ''
    endif
    if has_key(repo.functions, 'agetrepoprop')
        return s:F.anew(buf, repo, 'branch', 'getrepoprop', 'branch')
    endif
    return s:_r.cache.get('branch', repo.functions.getrepoprop,
                \         [repo, 'branch'], {})
endfunction
let s:_functions+=['aurum#branch']
"▶1
call frawor#Lockvar(s:, '_r,abuffers,akeys,astarted')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
