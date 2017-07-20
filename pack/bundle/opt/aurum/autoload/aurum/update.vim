scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.3',})
let s:comp=s:_r.cmdutils.comp
let s:fwc='-onlystrings _ [:=(0) '.s:comp.rev.' ['.s:comp.repo.']]'
let s:_aufunctions.cmd={'@FWC': [s:fwc, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:fwc, [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(bang, rev, repopath)
    let repo=s:_r.cmdutils.checkedgetrepo(a:repopath)
    if a:rev is 0
        let rev=repo.functions.gettiphex(repo)
    else
        let rev=repo.functions.getrevhex(repo, a:rev)
    endif
    return repo.functions.update(repo, rev, a:bang)
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
