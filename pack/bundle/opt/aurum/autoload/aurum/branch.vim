scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',})
let s:_messages={
            \ 'bexsts': 'Error while creating branch %s for repository %s: '.
            \           'branch already exists',
        \}
let s:_aufunctions.cmd={'@FWC': ['-onlystrings _ '.
            \'type "" {repo '.s:_r.cmdutils.comp.repo.'}', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(bang, branch, opts)
    let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
    let force=a:bang
    if !force && index(repo.functions.getrepoprop(repo, 'brancheslist'),
                \      a:branch)!=-1
        call s:_f.throw('bexsts', a:branch, repo.path)
    endif
    call repo.functions.branch(repo, a:branch, force)
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
