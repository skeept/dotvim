"▶1 
scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cmdutils': '4.3',
            \                '@%aurum/maputils': '0.0',
            \                 '@%aurum/bufvars': '0.0',
            \               '@%aurum/lineutils': '0.0',
            \                 '@%aurum/vimdiff': '1.0',
            \                    '@%aurum/edit': '1.2',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                      '@/mappings': '0.0',
            \                            '@/os': '0.0',})
let s:_messages={
            \'nodfile': 'Failed to get file whose section is under the cursor',
        \}
"▶1 difffunc
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'{  repo     '.s:_r.cmdutils.comp.repo.
            \'  ?rev1     '.s:_r.cmdutils.comp.rev.
            \'  ?rev2     '.s:_r.cmdutils.comp.rev.
            \'  ?changes  '.s:_r.cmdutils.comp.rev.
            \s:_r.cmdutils.comp.diffopts.
            \'  ?cmd      '.s:_r.cmdutils.comp.cmd.
            \'}'.
            \'+ '.s:_r.cmdutils.comp.file, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(opts, ...)
    if a:0 && a:opts.repo is# ':'
        let repo=s:_r.cmdutils.checkedgetrepo(a:1)
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
    endif
    let files=map(filter(copy(a:000), 'v:val isnot# ":"'),
                \ 'repo.functions.reltorepo(repo, v:val)')
    let hascur = (len(a:000)!=len(files))
    "▶2 Get revisions and file list
    if has_key(a:opts, 'changes')
        let rev1=repo.functions.getrevhex(repo, a:opts.changes)
        let rev2=''
    else
        let rev1=get(a:opts, 'rev1', '')
        let rev2=get(a:opts, 'rev2', '')
    endif
    if empty(rev2)
        if empty(rev1)
            let rev2=repo.functions.getworkhex(repo)
        else
            let rev2=repo.functions.getnthparent(repo, rev1, 1).hex
        endif
    else
        let rev2=repo.functions.getrevhex(repo, rev2)
    endif
    if !empty(rev1)
        let rev1=repo.functions.getrevhex(repo, rev1)
    endif
    let status=filter(copy(repo.functions.status(repo,
                \                                empty(rev1)?0:rev1, rev2)),
                \     'v:key isnot# "clean" && v:key isnot# "ignored"')
    let csfiles=[]
    call map(values(status), 'extend(csfiles, v:val)')
    unlet status
    "▶2 Filter out requested files
    call map(csfiles, 'join(s:_r.os.path.split(v:val)[1:], "/")')
    let filelist=[]
    for pattern in map(copy(files), 's:_r.globtopat(v:val)')
        let filelist+=filter(copy(csfiles), 'v:val=~#pattern && '.
                    \                       'index(filelist, v:val)==-1')
    endfor
    if hascur
        let curfile=s:_r.cmdutils.getrrf({'repo': ':'}, 'nocurf', 'getfile')[3]
        let curfile=repo.functions.reltorepo(repo, curfile)
        if index(csfiles, curfile)!=-1 && index(filelist, curfile)==-1
            let filelist+=[curfile]
        endif
    endif
    if a:0 && empty(filelist)
        return
    endif
    "▲2
    let opts=filter(copy(a:opts), 'index(s:_r.cmdutils.diffopts, v:key)!=-1')
    call s:_r.run(get(a:opts, 'cmd', 'silent edit'), 'diff', repo, rev1, rev2,
                \ filelist, opts)
    if !has_key(a:opts, 'cmd')
        setlocal bufhidden=wipe
        if has('folding')
            setlocal foldmethod=expr
        endif
    endif
    call s:_f.mapgroup.map('AuDiff', bufnr('%'))
endfunction
"▶1 aurum://diff mappings
let s:mmgroup=':call <SNR>'.s:_sid.'_Eval("s:_f.mapgroup.map(''AuDiff'', '.
            \                                               "bufnr('%'))\")\n"
"▶2 rundiffmap
function s:F.rundiffmap(action)
    let buf=bufnr('%')
    let bvar=s:_r.bufvars[buf]
    let cmd="\<C-\>\<C-n>"
    if a:action is# 'exit'
        let cmd.=s:_r.cmdutils.closebuf(bvar)
    elseif a:action is# 'update'
        let rev=(empty(bvar.rev1)?(bvar.rev2):(bvar.rev1))
        call s:_r.maputils.update(bvar.repo, rev, v:count)
        return ''
    elseif a:action is# 'previous' || a:action is# 'next'
        let c=((a:action is# 'previous')?(v:count1):(-v:count1))
        if empty(bvar.rev1)
            let rev1=''
        else
            let rev1=bvar.repo.functions.getnthparent(bvar.repo,bvar.rev1,c).hex
        endif
        if empty(bvar.rev2)
            let rev2=''
        else
            let rev2=bvar.repo.functions.getnthparent(bvar.repo,bvar.rev2,c).hex
        endif
        let cmd.=':edit '.
                    \fnameescape(s:_r.fname('diff', bvar.repo, rev1, rev2,
                    \                       bvar.files, bvar.opts))."\n"
        let cmd.=s:mmgroup
        let cmd.=":bwipeout ".buf."\n"
    elseif a:action is# 'open'
        let file=s:_r.cmdutils.getdifffile(bvar)
        if file is 0
            call s:_f.throw('nodfile')
        endif
        let fullpath=s:_r.os.path.join(bvar.repo.path, file)
        if empty(bvar.rev1)
            if filereadable(fullpath)
                let cmd.=':edit'
            else
                let cmd.=':AuFile '.
                            \((empty(bvar.rev2))?
                            \       (bvar.repo.functions.getworkhex(bvar.repo)):
                            \       (bvar.rev2))
            endif
        else
            let cmd.=':AuFile '.bvar.rev1
        endif
        let cmd.=' '.fnameescape(fullpath)."\n"
    elseif a:action is# 'vimdiff'
        let cmd.=':AuVimDiff '
        if empty(bvar.rev1)
            let cmd.='curfile'
        else
            let cmd.=bvar.rev1
        endif
        let cmd.=' '.bvar.rev2."\n"
        let cmd.=':if bufwinnr('.buf.')!=-1 | '.
                    \'execute bufwinnr('.buf.')."wincmd w" | '.
                    \'close | '.
                    \'wincmd p | '.
                    \"endif\n"
    endif
    return cmd
endfunction
"▶2 fvdiff
function s:F.fvdiff()
    let bvar=s:_r.bufvars[bufnr('%')]
    let args=[bvar.repo]
    if empty(bvar.rev1)
        let args+=[[0, bvar.rev2]]
    elseif empty(bvar.rev2)
        let args+=[[0, bvar.rev1]]
    else
        let args+=[[bvar.rev1, bvar.rev2]]
    endif
    let args+=[1, bvar.files, 0]
    return call(s:_r.vimdiff.full, args, {})
endfunction
"▲2
call s:_f.mapgroup.add('AuDiff', {
            \  'Next': {'lhs':  'K', 'rhs': ['next'       ]},
            \  'Prev': {'lhs':  'J', 'rhs': ['previous'   ]},
            \'Update': {'lhs':  'U', 'rhs': ['update'     ]},
            \  'Exit': {'lhs':  'X', 'rhs': ['exit'       ]},
            \  'Open': {'lhs':  'o', 'rhs': ['open'       ]},
            \ 'Vdiff': {'lhs':  'D', 'rhs': ['vimdiff'    ]},
            \'FVdiff': {'lhs': 'gD', 'rhs': ':call <SNR>'.s:_sid.'_Eval('.
            \                                            '"s:F.fvdiff()")<CR>'},
        \}, {'func': s:F.rundiffmap, 'silent': 1, 'mode': 'n', 'dontmap': 1,})
"▶1 aurum://diff
let s:diff= {'arguments': 2,
            \ 'listargs': 1,
            \  'options': {'num': s:_r.cmdutils.diffopts},
            \ 'filetype': 'diff',
            \   'mgroup': 'AuDiff',
            \}
function s:diff.function(read, repo, rev1, rev2, files, opts)
    "▶2 Get revisions
    let rev1=a:rev1
    let rev2=a:rev2
    if !empty(rev1)
        let rev1=a:repo.functions.getrevhex(a:repo, rev1)
    endif
    if !empty(rev2)
        let rev2=a:repo.functions.getrevhex(a:repo, rev2)
    endif
    if empty(rev1) && empty(rev2)
        let rev2=a:repo.functions.getworkhex(a:repo)
    endif
    "▲2
    if a:read
        call s:_r.lineutils.setlines(
                    \a:repo.functions.diff(a:repo, rev1, rev2, a:files, a:opts),
                    \1)
        return {}
    else
        call a:repo.functions.difftobuffer(a:repo, bufnr('%'), rev1, rev2,
                    \                      a:files, a:opts)
        return {'rev1': rev1, 'rev2': rev2, 'files': a:files}
    endif
endfunction
call s:_f.newcommand(s:diff)
unlet s:diff
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
