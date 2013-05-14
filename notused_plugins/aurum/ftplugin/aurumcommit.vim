"▶1 
scriptencoding utf-8
setlocal textwidth=80
setlocal nonumber
if exists('+relativenumber')
    setlocal norelativenumber
endif
setlocal noswapfile
setlocal nomodeline
execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \                      '@/os': '0.0',
            \           '@%aurum/bufvars': '0.0',
            \          '@%aurum/maputils': '0.0',
            \           '@%aurum/vimdiff': '1.1',
            \            '@%aurum/commit': '1.2',
            \              '@%aurum/edit': '1.0',})
"▶1 listfiles
function s:F.listfiles(bvar)
    if has_key(a:bvar, 'revstatus')
        return keys(a:bvar.revstatus)
    elseif !empty(a:bvar.files)
        return a:bvar.files
    else
        let status=a:bvar.repo.functions.status(a:bvar.repo, 0, 0, a:bvar.files)
        let status=filter(copy(status), 'index(s:defstats, v:key)!=-1')
        let revstatus={}
        call map(copy(status),'map(copy(v:val),'.
                    \             '"extend(revstatus,{v:val :''".v:key."''})")')
        let a:bvar.revstatus=revstatus
        return keys(a:bvar.revstatus)
    endif
endfunction
"▶1 getfile
let s:defstats=['added', 'removed', 'modified']
function s:F.getfile(bvar)
    let files=s:F.listfiles(a:bvar)
    let file=matchstr(getline('.'), '\v(^\#\ \S+\ )@<=.*$')
    if !empty(file) && index(files, file)!=-1
        return file
    endif
    let file=expand('<cfile>')
    if index(files, file)!=-1
        return file
    endif
    return 0
endfunction
"▶1 diffcb
function s:F.diffcb(file, bvar, hex)
    call a:bvar.findwindow()
    if !s:_r.mrun('silent edit', 'diff', a:bvar.repo, 0, 0, [a:file], {})
        setlocal bufhidden=wipe
    endif
endfunction
"▶1 runcommap
function s:F.runcommap(count, action)
    let buf=bufnr('%')
    let bvar=s:_r.bufvars[buf]
    if a:action is# 'commit'
        call s:_r.commit.finish(bvar)
    elseif a:action is# 'discard'
        bwipeout!
        stopinsert
    elseif a:action[:5] is# 'recall'
        if has_key(bvar, 'recallcs')
            let cnt=(a:count ? a:count : 1)
            let oldmsg=split(bvar.recallcs.description, "\n", 1)
            if !empty(oldmsg)
                let morelen=len(oldmsg)-1
                let moremsg=oldmsg[1:]
                for line in range(1, line('$'))
                    if getline(line) is# oldmsg[0] &&
                                \(morelen ?
                                \   getline(line+1, line+morelen) ==# moremsg :
                                \   1)
                        execute 'silent' line.','.(line+morelen).'delete _'
                        undojoin
                        break
                    endif
                endfor
            endif
        else
            let bvar.recallcs=bvar.repo.functions.getwork(bvar.repo)
            let cnt=a:count
            if empty(getline(1))
                silent 1 delete _
                undojoin
            endif
        endif
        let cnt=((a:action[6:] is# 'prev')?(cnt):(-cnt))
        let bvar.recallcs=bvar.repo.functions.getnthparent(bvar.repo,
                    \                                      bvar.recallcs.hex,
                    \                                      cnt)
        call append(0, split(bvar.recallcs.description, "\n", 1))
    elseif a:action is# 'fulldiff'
        call bvar.findwindow()
        if !s:_r.mrun('silent edit', 'diff', bvar.repo, 0, 0,
                    \                        s:F.listfiles(bvar), {})
            setlocal bufhidden=wipe
        endif
    elseif a:action is# 'diff' || a:action is# 'vimdiff'
        let file=s:F.getfile(bvar)
        let hex=bvar.repo.functions.getworkhex(bvar.repo)
        let cbargs=[(a:action is# 'diff' ? s:F.diffcb : bvar.vimdiffcb),
                    \bvar, hex]
        if file is 0
            let pvargs=[s:_r.maputils.readfilewrapper, bvar.repo, hex]
            return s:_r.maputils.promptuser(s:F.listfiles(bvar), cbargs, pvargs)
        else
            return call(cbargs[0], [file]+cbargs[1:], {})
        endif
    elseif a:action is# 'fullvimdiff'
        return s:_r.vimdiff.full(bvar.repo,
                    \            [0, bvar.repo.functions.getworkhex(bvar.repo)],
                    \            1, s:F.listfiles(bvar), 0)
    elseif a:action is# 'insprev'
        call setline('.', split(g:AuPreviousCommitMessage, "\n", 1))
    endif
endfunction
"▶1 AuCommitMessage mapping group
function s:F.mapwrapper(...)
    return "\<C-\>\<C-n>".
                \":call call(\<SNR>".s:_sid."_Eval('s:F.runcommap'), ".
                \            string([v:count]+a:000).', '.
                \           "{})\n"
endfunction
call s:_f.mapgroup.add('AuCommitMessage', {
            \ 'Commit': {'lhs':  'i', 'rhs': ['commit'     ]},
            \   'Prev': {'lhs':  'J', 'rhs': ['recallprev' ]},
            \   'Next': {'lhs':  'K', 'rhs': ['recallnext' ]},
            \   'Diff': {'lhs':  'd', 'rhs': ['diff'       ]},
            \  'Fdiff': {'lhs': 'gd', 'rhs': ['fulldiff'   ]},
            \  'Vdiff': {'lhs':  'D', 'rhs': ['vimdiff'    ]},
            \ 'FVdiff': {'lhs': 'gD', 'rhs': ['fullvimdiff']},
            \   'Exit': {'lhs':  'X', 'rhs': ['discard'    ]},
            \'InsPrev': {'lhs':  'p', 'rhs': ['insprev'    ]},
        \}, {'mode': 'in', 'silent': 1, 'leader': '<LocalLeader>',
        \    'func': s:F.mapwrapper})
"▶1
call frawor#Lockvar(s:, '_r')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
