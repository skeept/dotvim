scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                            '@/os': '0.0',})
let s:pushactions=['push', 'outgoing']
let s:pullactions=['pull', 'incoming']
let s:ppactions=s:pushactions+s:pullactions
let s:_aufunctions.cmd={'@FWC': ['-onlystrings _ '.
            \'in ppactions ~ smart '.
            \'[:":" '.s:_r.cmdutils.comp.rev.
            \'[:":" '.s:_r.cmdutils.comp.file.
            \'['.     s:_r.cmdutils.comp.repo.']]]', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(bang, action, rev, url, repopath)
    let repo=s:_r.cmdutils.checkedgetrepo(a:repopath)
    if a:url isnot# ':' && stridx(a:url, '://')==-1 && isdirectory(a:url)
        let url=s:_r.os.path.realpath(a:url)
    else
        let url=a:url
    endif
    let key=((index(s:pushactions, a:action)==-1)?('pull'):('push'))
    return repo.functions[key](repo, (a:action[0] isnot# 'p'), a:bang,
                \              ((  url is# ':')?(0):(  url)),
                \              ((a:rev is# ':')?(0):(a:rev)))
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
