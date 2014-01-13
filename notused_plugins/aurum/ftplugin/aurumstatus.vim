"▶1 
scriptencoding utf-8
setlocal textwidth=0
setlocal noswapfile
setlocal nomodeline
execute frawor#Setup('0.0', {'@%aurum/bufvars': '0.0',
            \                '@%aurum/vimdiff': '1.1',
            \               '@%aurum/cmdutils': '4.0',
            \                   '@%aurum/edit': '1.2',
            \                 '@%aurum/commit': '1.0',
            \                     '@/mappings': '0.0',
            \                      '@/options': '0.0',
            \                           '@/os': '0.0',})
let s:_messages={
            \  'nopars': 'Revision %s has no parents',
        \}
let s:_oprefix='aurum'
let s:_options={
            \'statwincmd': {'default': 'c',
            \               'checker': 'match /\v^[jkhlwWtbpc]$/'},
        \}
"▶1 runmap
let s:noacttypes={
            \    'open': ['deleted'],
            \ 'revopen': ['added', 'ignored'],
            \    'diff': ['added', 'removed', 'deleted', 'unknown', 'ignored'],
            \'annotate': ['added', 'unknown', 'ignored'],
            \   'track': ['added', 'clean'],
            \  'commit': ['ignored', 'clean'],
            \  'forget': ['removed'],
        \}
let s:noacttypes.vimdiff    = s:noacttypes.diff
let s:noacttypes.revdiff    = s:noacttypes.diff
let s:noacttypes.revvimdiff = s:noacttypes.vimdiff
let s:noacttypes.vtrack     = s:noacttypes.track
let s:noacttypes.vcommit    = s:noacttypes.commit
let s:noacttypes.vforget    = s:noacttypes.forget
function s:F.runmap(action, ...)
    let buf=bufnr('%')
    let bvar=s:_r.bufvars[buf]
    if empty(bvar.types)
        return ''
    endif
    let visual=(a:0&&a:1)
    let isrecord=get(bvar.opts, 'record', 0)
    if isrecord
        if a:action is# 'track'
            return bvar.recrunmap(((visual)?('v'):('')).'add')
        elseif a:action is# 'commit'
            return bvar.recrunmap('commit')
        elseif a:action is# 'forget'
            return bvar.recrunmap(((visual)?('v'):('')).'remove')
        endif
    endif
    let rev1=get(bvar.opts, 'rev1')
    let rev2=get(bvar.opts, 'rev2')
    if rev1 is 0
        let rev1=''
    endif
    if rev2 is 0
        let rev2=''
    endif
    if empty(rev1) && empty(rev2)
        let rev1=bvar.repo.functions.getworkhex(bvar.repo)
    endif
    let curline=line('.')-1
    let vline1=line("'<")
    let vline2=line("'>")
    let file=bvar.files[curline]
    let manyfiles=(visual || v:count1>1)
    if has_key(s:noacttypes, a:action) &&
                \!(a:action[-7:] is# 'vimdiff' && manyfiles) &&
                \index(s:noacttypes[a:action], bvar.types[curline])!=-1
        return ''
    endif
    if !(a:action is# 'commit' || a:action is# 'track' || a:action is# 'forget'
                \|| a:action[-11:] is# 'fullvimdiff' ||
                \(a:action[-7:] is# 'vimdiff' && manyfiles))
        if isrecord
            let [lwnr, rwnr, swnr]=bvar.getwnrs()
            execute lwnr.'wincmd w'
        elseif winnr('$')>1
            execute 'wincmd' s:_f.getoption('statwincmd')
        endif
    endif
    if a:action is# 'open'
        execute 'silent e' fnameescape(s:_r.os.path.join(bvar.repo.path, file))
    elseif a:action is# 'revopen'
        call s:_r.mrun('silent edit', 'file', bvar.repo, rev1, file)
    elseif a:action is# 'fulldiff'
        call s:_r.mrun('silent edit', 'diff', bvar.repo, rev1, rev2, [], {})
    elseif a:action is# 'revfulldiff'
        call s:_r.mrun('silent edit', 'diff', bvar.repo, rev1,  '',  [], {})
    elseif a:action is# 'fullvimdiff'
        execute 'AuVimDiff full '.((empty(rev2) || empty(rev1))?
                    \                   ('curfile '):
                    \                   ('')).rev1.' '.rev2
    elseif a:action is# 'revfullvimdiff'
        let cs1=bvar.repo.functions.getcs(bvar.repo, rev1)
        if empty(cs1.parents)
            call s:_f.throw('nopars', cs1.hex)
        endif
        call s:_r.vimdiff.full(bvar.repo, [rev1, cs1.parents[0]], 1, [], 0)
    elseif !manyfiles && (a:action is# 'revvimdiff' || a:action is# 'vimdiff')
        let fargs1=['file', bvar.repo, rev1, file]
        if a:action is# 'revvimdiff'
            let cs1=bvar.repo.functions.getcs(bvar.repo, rev1)
            if empty(cs1.parents)
                call s:_f.throw('nopars', cs1.hex)
            endif
            let fargs2=['file', bvar.repo, cs1.parents[0], file]
        elseif empty(rev2)
            let file2=s:_r.os.path.join(bvar.repo.path, file)
        else
            let fargs2=['file', bvar.repo, rev2, file]
        endif
        if get(bvar.opts, 'record', 0)
            if exists('file2')
                execute 'silent edit' fnameescape(file2)
            else
                call call(s:_r.mrun, ['silent edit']+fargs2, {})
            endif
            diffthis
            execute rwnr.'wincmd w'
            call call(s:_r.mrun, ['silent edit']+fargs1, {})
            diffthis
            wincmd p
        else
            if exists('file2')
                execute 'silent edit' fnameescape(file2)
            else
                call call(s:_r.mrun, ['silent edit']+fargs2, {})
            endif
            call s:_r.vimdiff.split([fargs1], -1)
        endif
    elseif a:action is# 'annotate'
        call s:_r.mrun('silent edit', 'file', bvar.repo, rev1, file)
        AuAnnotate
    endif
    if visual
        let range=range(vline1-1, vline2-1, (((vline1>vline2)?(-1):(1))))
    else
        let rborder=curline+v:count1-1
        if rborder>(len(bvar.files)-1)
            let rborder=len(bvar.files)-1
        endif
        let range=range(curline, rborder)
    endif
    if has_key(s:noacttypes, a:action) && a:action[-7:] isnot# 'vimdiff'
        call filter(range,
                    \'index(s:noacttypes[a:action], bvar.types[v:val])==-1')
    endif
    let files=map(copy(range), 'bvar.files[v:val]')
    if a:action is# 'commit'
        if s:_r.commit.commit(bvar.repo, bvar.opts, files, bvar.status,
                    \         ['modified', 'added', 'removed', 'deleted',
                    \          'unknown'])
            silent edit!
        else
            augroup AuStatusCommit
                execute 'autocmd BufWipeOut <buffer> '.
                            \'if bufexists('.buf.') | '.
                            \   'execute "autocmd AuStatusCommit '.
                            \                    'BufEnter <buffer='.buf.'> '.
                            \                    'nested '.
                            \              'execute \"autocmd! AuStatusCommit '.
                            \                          'BufEnter '
                            \                           '<buffer='.buf.'>\" | '.
                            \              'silent edit!" | '.
                            \'endif'
            augroup END
        endif
    elseif a:action is# 'track'
        call map(copy(files), 'bvar.repo.functions.add(bvar.repo, v:val)')
        silent edit!
    elseif a:action is# 'forget'
        call map(copy(files), 'bvar.repo.functions.forget(bvar.repo, v:val)')
        silent edit!
    elseif a:action is# 'revdiff'
        call s:_r.mrun('silent edit', 'diff', bvar.repo, rev1,  '',  files, {})
    elseif a:action is# 'diff'
        call s:_r.mrun('silent edit', 'diff', bvar.repo, rev1, rev2, files, {})
    elseif manyfiles && (a:action is# 'revvimdiff' || a:action is# 'vimdiff')
        let args=[bvar.repo]
        if a:action is# 'revvimdiff'
            let cs1=bvar.repo.functions.getcs(bvar.repo, rev1)
            if empty(cs1.parents)
                call s:_f.throw('nopars', cs1.hex)
            endif
            let args+=[[cs1.parents[0], rev1]]
        else
            if empty(rev2)
                let args+=[[0, rev1]]
            else
                let args+=[[rev1, rev2]]
            endif
        endif
        let args+=[2, files, 0]
        return call(s:_r.vimdiff.full, args, {})
    endif
endfunction
let s:_augroups+=['AuStatusCommit']
"▶1 AuStatus mapping group
"▶2 getrhs
function s:F.getrhs(...)
    return ':<C-u>call call(<SID>Eval("s:F.runmap"), '.string(a:000).', {})<CR>'
endfunction
"▲2
call s:_f.mapgroup.add('AuStatus', {
            \    'Exit': {'lhs':  'X',   'rhs': ':<C-u>bwipeout!<CR>'       },
            \   'Enter': {'lhs': '<CR>', 'rhs': s:F.getrhs(          'open')},
            \    'Open': {'lhs':  'o',   'rhs': s:F.getrhs(       'revopen')},
            \  'FVdiff': {'lhs': 'gD',   'rhs': s:F.getrhs(   'fullvimdiff')},
            \ 'RFVdiff': {'lhs': 'gC',   'rhs': s:F.getrhs('revfullvimdiff')},
            \   'Fdiff': {'lhs': 'gd',   'rhs': s:F.getrhs(      'fulldiff')},
            \  'RFdiff': {'lhs': 'gc',   'rhs': s:F.getrhs(   'revfulldiff')},
            \    'Diff': {'lhs':  'd',   'rhs': s:F.getrhs(          'diff')},
            \   'vDiff': {'lhs':  'd',   'rhs': s:F.getrhs(          'diff', 1),
            \             'mode': 'x'},
            \   'Rdiff': {'lhs':  'c',   'rhs': s:F.getrhs(       'revdiff')},
            \  'vRdiff': {'lhs':  'c',   'rhs': s:F.getrhs(       'revdiff', 1),
            \             'mode': 'x'},
            \   'Vdiff': {'lhs':  'D',   'rhs': s:F.getrhs(       'vimdiff')},
            \  'vVdiff': {'lhs':  'D',   'rhs': s:F.getrhs(       'vimdiff', 1),
            \             'mode': 'x'},
            \  'RVdiff': {'lhs':  'C',   'rhs': s:F.getrhs(    'revvimdiff')},
            \ 'vRVdiff': {'lhs':  'C',   'rhs': s:F.getrhs(    'revvimdiff', 1),
            \             'mode': 'x'},
            \'Annotate': {'lhs':  'a',   'rhs': s:F.getrhs(      'annotate')},
            \  'Commit': {'lhs':  'i',   'rhs': s:F.getrhs(        'commit')},
            \ 'vCommit': {'lhs':  'i',   'rhs': s:F.getrhs(        'commit', 1),
            \             'mode': 'v'},
            \   'Track': {'lhs':  'A',   'rhs': s:F.getrhs(         'track')},
            \  'vTrack': {'lhs':  'A',   'rhs': s:F.getrhs(         'track', 1),
            \             'mode': 'v'},
            \  'Forget': {'lhs':  'R',   'rhs': s:F.getrhs(        'forget')},
            \ 'vForget': {'lhs':  'R',   'rhs': s:F.getrhs(        'forget', 1),
            \             'mode': 'v'},
            \}, {'func': s:F.runmap, 'silent': 1, 'mode': 'n'})
"▶1
call frawor#Lockvar(s:, '_r')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
