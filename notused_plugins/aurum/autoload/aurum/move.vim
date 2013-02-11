scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                    '@%aurum/edit': '1.0',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                            '@/os': '0.0',
            \                         '@/table': '0.0',})
let s:_messages={
            \'nomv': 'No movable files found',
            \'_mvheader': ['Source', 'Destination'],
        \}
let s:_aufunctions.cmd={'@FWC': ['-onlystrings _ '.
            \'{  repo '.s:_r.cmdutils.comp.repo.
            \' ?!copy'.
            \' ?!rightrepl'.
            \' ?!leftpattern'.
            \' ?!pretend'.
            \'} '.
            \'+ '.s:_r.cmdutils.comp.file, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
" :AuM          — move current file to current directory
" :AuM dir      — move current file to given directory
" :AuM pat  pat — act like `zmv -W': use second pat to construct new file name
" :AuM pat+ dir — move given file(s) to given directory
" :AuM pat+     — move given file(s) to current directory
function s:_aufunctions.cmd.function(bang, opts, ...)
    if a:0 && !get(a:opts, 'leftpattern', 0) && a:opts.repo is# ':'
        let repo=s:_r.cmdutils.checkedgetrepo(a:1)
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
    endif
    let allfiles=s:_r.cmdutils.getexsttrckdfiles(repo)
    if get(a:opts, 'copy', 0)
        let key='copy'
    else
        let key='move'
    endif
    let rrfopts={'repo': repo.path}
    if a:0==0
        let target='.'
        let files=[repo.functions.reltorepo(repo,
                    \s:_r.cmdutils.getrrf(rrfopts, 'nocurf', 'getfile')[3])]
    elseif a:0==1 && isdirectory(a:1)
        let target=a:1
        let files=[repo.functions.reltorepo(repo,
                    \s:_r.cmdutils.getrrf(rrfopts, 'nocurf', 'getfile')[3])]
    elseif a:0>1 && get(a:opts, 'rightrepl', 0)
        let patterns=map(a:000[:-2], 's:_r.globtopat('.
                    \                'repo.functions.reltorepo(repo,v:val), 1)')
        let moves={}
        let repl=a:000[-1]
        for pattern in patterns
            for file in filter(copy(allfiles), 'v:val=~#pattern && '.
                        \                      '!has_key(moves, v:val)')
                let moves[file]=repo.functions.reltorepo(repo,
                            \               substitute(file, pattern, repl, ''))
            endfor
        endfor
    elseif a:0>1 && get(a:opts, 'leftpattern', 0)
        let moves={}
        let repl=a:000[-1]
        for pattern in a:000[:-2]
            for file in filter(copy(allfiles), 'v:val=~#pattern && '.
                        \                      '!has_key(moves, v:val)')
                let moves[file]=substitute(file, pattern, repl, '')
            endfor
        endfor
    elseif a:0==2 && a:2=~#'[*?]' &&
                \substitute(a:1, '\v%(^|$|\\.|[^*])[^*?]*', '-', 'g') is#
                \substitute(a:2, '\v%(^|$|\\.|[^*])[^*?]*', '-', 'g')
        let pattern=s:_r.globtopat(repo.functions.reltorepo(repo, a:1),
                    \                       1)
        let repl=split(a:2, '\V\(**\?\|?\)', 1)
        let moves={}
        for [file, match] in filter(map(copy(allfiles),
                    \                   '[v:val, matchlist(v:val, pattern)]'),
                    \               '!empty(v:val[1])')
            let target=''
            let i=1
            for s in repl
                let target .= s . get(match, i, '')
                let i+=1
            endfor
            let moves[file]=repo.functions.reltorepo(repo, target)
        endfor
    elseif a:0==2 && !isdirectory(a:2) && a:2[-1:] isnot# '/'
        let fst=a:1
        if fst is# ':'
            let fst=s:_r.cmdutils.getrrf(rrfopts, 'nocurf', 'getfile')[3]
        endif
        if filewritable(fst)
            let moves = {repo.functions.reltorepo(repo, fst):
                        \repo.functions.reltorepo(repo, a:2)}
        else
            let notfound=1
        endif
    else
        let notfound=1
    endif
    if exists('notfound')
        let globs=filter(copy(a:000), 'v:val isnot# ":"')
        let hascur=(len(globs)!=a:0)
        if a:0==1 || !(isdirectory(globs[-1]) || globs[-1][-1:] is# '/')
            let target='.'
        else
            let target=remove(globs, -1)
            if !isdirectory(target)
                call mkdir(target, 'p')
            endif
        endif
        let files=s:_r.cmdutils.filterfiles(repo, globs, allfiles)
        if hascur
            let files+=[s:_r.cmdutils.getrrf(rrfopts, 'nocurf', 'getfile')[3]]
        endif
    endif
    if exists('files')
        let target=repo.functions.reltorepo(repo, target)
        if !exists('moves')
            let moves={}
        endif
        for file in files
            let dest=s:_r.os.path.basename(file)
            if !empty(target)
                let dest=s:_r.os.path.join(target, dest)
            endif
            let moves[file]=dest
        endfor
    endif
    if empty(moves)
        call s:_f.throw('nomv')
    endif
    if get(a:opts, 'pretend', 0)
        call s:_r.printtable(items(moves), {'header': s:_messages._mvheader})
    else
        call map(moves,'repo.functions.'.key.'(repo, '.a:bang.', v:key, v:val)')
    endif
endfunction
"▶1
call frawor#Lockvar(s:, '')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
