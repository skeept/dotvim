scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',})
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'+ '.s:_r.cmdutils.comp.file, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(...)
    let globs=filter(copy(a:000), 'v:val isnot# ":"')
    let hascur=!(a:0 && len(globs)==a:0)
    let repo=s:_r.cmdutils.checkedgetrepo(a:0 ? a:1 : ':')
    let allfiles=s:_r.cmdutils.getaddedermvdfiles(repo)
    let files=s:_r.cmdutils.filterfiles(repo, globs, allfiles)
    if hascur
        let rrfopts={'repo': repo.path}
        let files+=[repo.functions.reltorepo(repo,
                    \s:_r.cmdutils.getrrf(rrfopts, 'nocurf', 'getfile')[3])]
    endif
    call map(copy(files), 'repo.functions.add(repo, v:val)')
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
