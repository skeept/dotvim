"▶1 
scriptencoding utf-8
execute frawor#Setup('1.1', {'@%aurum/cmdutils': '4.3',
            \                    '@%aurum/edit': '1.3',
            \                 '@%aurum/bufvars': '0.0',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                      '@/mappings': '0.0',
            \                     '@/resources': '0.0',
            \                       '@/options': '0.0',
            \                            '@/os': '0.0',})
let s:_options={
            \'vimdiffusewin': {'default': 0, 'filter': 'bool'},
        \}
let s:_messages={
            \'nodfile': 'Failed to deduce which file to diff with',
            \ 'cndiff': 'Can’t show diff for file %s',
            \ 'nodrev': 'Unsure what revision should be diffed with',
        \}
let s:lastfullid=0
"▶1 restore
function s:F.restore(dbvar)
    if empty(t:auvimdiff_diffbufvars)
        unlet t:auvimdiff_diffbufvars
        unlet t:auvimdiff_origbufvar
        unlet t:auvimdiff_prevbuffers
    endif
    augroup AuVimDiff
        autocmd! BufEnter,BufWipeOut <buffer>
    augroup END
    let hastickchange=0
    if has_key(a:dbvar, 'diffsaved')
        let buf=bufnr('%')
        for [option, value] in items(a:dbvar.diffsaved)
            call setbufvar(buf, '&'.option, value)
        endfor
    endif
    if !has_key(a:dbvar, 'changedtick') ||
                \b:changedtick!=a:dbvar.changedtick
        let hastickchange=1
    endif
    let curpos=getpos('.')
    if !hastickchange && has_key(a:dbvar, 'winview')
        call winrestview(a:dbvar.winview)
    endif
    if has_key(a:dbvar, 'filetype')
        let &l:filetype=a:dbvar.filetype
    endif
    if !hastickchange && has_key(a:dbvar, 'closedfolds')
        normal! zR
        for line in a:dbvar.closedfolds
            try
                execute line.'foldclose'
            catch /\VVim(foldclose):E490:/
                normal! zM
                break
            endtry
        endfor
    endif
    call setpos('.', curpos)
endfunction
"▶1 diffrestore
let s:F.diffrestore={}
"▶2 diffrestore.onotherenter
function s:F.diffrestore.onotherenter(buf, abuf, dbvar, ddbvars, prevbuffers)
    if has_key(a:dbvar, 'bufnr')
        if bufexists(a:dbvar.bufnr)
            return
        else
            call s:F.diffrestore.onwipe(a:buf, a:abuf, a:dbvar, a:ddbvars,
                        \               a:prevbuffers)
        endif
    endif
    let ddbvar=remove(a:ddbvars, a:abuf)
    return s:F.restore(a:ddbvars[a:abuf])
endfunction
"▶2 diffrestore.onenter
function s:F.diffrestore.onenter(buf, abuf, dbvar, ddbvars, prevbuffers)
    if !empty(filter(copy(a:dbvar.diffbufs), 'bufwinnr(v:val)!=-1'))
        return
    endif
    return s:F.restore(a:dbvar)
endfunction
"▶2 diffrestore.onotherwipe
function s:F.diffrestore.onotherwipe(buf, abuf, dbvar, ddbvars, prevbuffers)
    call filter(a:dbvar.diffbufs, 'v:val isnot '.a:abuf)
    unlet a:ddbvars[a:abuf]
endfunction
"▶2 diffrestore.onwipe
function s:F.diffrestore.onwipe(buf, abuf, dbvar, ddbvars, prevbuffers)
    call map(copy(a:ddbvars), 'remove(v:val, "srcbuf")')
    let toremove=keys(filter(copy(a:ddbvars),
                \            '!v:val.existed && bufexists(v:val.bufnr)'))
    if !empty(toremove)
        let cmd="\<C-\>\<C-n>:"
        for buf in filter(toremove, 'bufwinnr(+v:val)!=-1 && '.
                    \               'get(a:prevbuffers, v:val, 0)')
            let cmd.=bufwinnr(+buf).'wincmd w|'.
                        \'silent buffer '.a:prevbuffers[buf].'|'.
                        \'wincmd p|'
        endfor
        let cmd.=    'try|'.
                    \   'silent bwipeout '.join(toremove).'|'.
                    \'catch /Vim(bwipeout):E517:/|'.
                    \'endtry'.
                    \"\n\<C-l>"
        call feedkeys(cmd, 'n')
    endif
endfunction
"▶2 diffrestore.call
function s:F.diffrestore.call(func)
    if !exists('t:auvimdiff_origbufvar') || !exists('t:auvimdiff_diffbufvars')
                \|| !bufexists(t:auvimdiff_origbufvar.bufnr)
        return
    endif
    let dbvar=t:auvimdiff_origbufvar
    let ddbvars=t:auvimdiff_diffbufvars
    let prevbuffers=t:auvimdiff_prevbuffers
    return s:F.diffrestore[a:func](t:auvimdiff_origbufvar.bufnr,
                \                  +expand('<abuf>'), dbvar, ddbvars,
                \                  prevbuffers)
endfunction
"▶1 findwindow
function s:F.findwindow()
    let curwin=winnr()
    let curwinh=winheight(curwin)
    let curwinw=winwidth(curwin)
    let r=0
    let vertical=(stridx(&diffopt, 'vertical')!=-1)
    for wc in vertical ? ['l', 'h'] : ['j', 'k']
        execute 'wincmd' wc
        if winnr()!=curwin && ((vertical)?(winheight(0)==curwinh):
                    \                     (winwidth(0) ==curwinw))
            let r=1
            break
        endif
        execute curwin 'wincmd w'
    endfor
    return r
endfunction
"▶1 save
let s:diffsaveopts=['diff', 'foldcolumn', 'foldenable', 'foldmethod',
            \       'foldlevel', 'scrollbind', 'cursorbind', 'wrap']
function s:F.save(buf, dbvar)
    let a:dbvar.diffsaved={}
    for option in s:diffsaveopts
        let a:dbvar.diffsaved[option]=getbufvar(a:buf, '&'.option)
    endfor
    let a:dbvar.winview=winsaveview()
    let a:dbvar.cursor=getpos('.')[1:]
    let a:dbvar.changedtick=b:changedtick
    let closedfolds=[]
    let a:dbvar.closedfolds=closedfolds
    for line in range(1, line('$'))
        if foldclosed(line)!=-1
            execute line.'foldopen'
            call insert(closedfolds, line)
        endif
    endfor
endfunction
"▶1 open :: cmd, target::Either path fnameargs → existed::Bool
function s:F.open(cmd, target)
    if type(a:target)==type('')
        let r=bufexists(a:target)
        execute 'silent' a:cmd fnameescape(a:target)
        return r
    else
        return call(s:_r.mrun, ['silent '.a:cmd]+a:target, {})
    endif
endfunction
"▶1 bwau
function s:F.bwau(dbuf, eventpart)
    augroup AuVimDiff
        execute 'autocmd! BufEnter   <buffer='.a:dbuf.'> '.
                    \':call s:F.diffrestore.call("on'.a:eventpart.'enter")'
        execute 'autocmd! BufWipeOut <buffer='.a:dbuf.'> '.
                    \':call s:F.diffrestore.call("on'.a:eventpart.'wipe")'
    augroup END
endfunction
"▶1 diffsplit
function s:F.diffsplit(difftargets, usewin)
    "▶2 Open new tab if current already has diffsplit
    if !empty(filter(range(1, winnr('$')), 'getwinvar(v:val, "&diff")'))
        tab split
    endif
    "▶2 Compatibility: allow one difftarget appear as string
    if type(a:difftargets)==type('')
        let difftargets=[a:difftargets]
    else
        let difftargets=a:difftargets
    endif
    "▲2
    let buf=bufnr('%')
    let t:auvimdiff_origbufvar={'bufnr': buf, 'diffbufs': []}
    let t:auvimdiff_diffbufvars={}
    let dbvar=t:auvimdiff_origbufvar
    let dbvar.changedtick=b:changedtick
    call s:F.save(buf, dbvar)
    call s:_f.mapgroup.map('AuVimDiff', buf)
    let vertical=(stridx(&diffopt, 'vertical')!=-1)
    let splitcmd=((vertical)?('v'):('')).'split'
    let filetype=&filetype
    diffthis
    let i=0
    for difftarget in difftargets
        let ddbvar={}
        "▶2 Open other buffer, respecting “usewin” option
        " Uses left/right or upper/lower window if it has similar dimensions
        if (!i && (a:usewin==-1 ? s:_f.getoption('vimdiffusewin') : a:usewin))
                    \&& winnr('$')>1 && s:F.findwindow()
            let prevbuf=s:_r.prevbuf()
            let existed=s:F.open('edit', difftarget)
        else
            let existed=s:F.open(splitcmd, difftarget)
        endif
        "▲2
        let dbuf=bufnr('%')
        if existed
            call s:F.save(dbuf, ddbvar)
        else
            setlocal bufhidden=wipe
        endif
        diffthis
        if &filetype isnot# filetype
            let ddbvar.filetype=&filetype
            let &filetype=filetype
        endif
        let ddbvar.orig_filetype = filetype
        let t:auvimdiff_diffbufvars[dbuf]=ddbvar
        let t:auvimdiff_prevbuffers={dbuf : 0}
        let ddbvar.bufnr=dbuf
        let ddbvar.srcbuf=buf
        let ddbvar.existed=existed
        if exists('prevbuf')
            let ddbvar.prevbuf=prevbuf
            let t:auvimdiff_prevbuffers[dbuf]=prevbuf
        endif
        let dbvar.diffbufs+=[dbuf]
        call s:_f.mapgroup.map('AuVimDiff', dbuf)
        call s:F.bwau(dbuf, 'other')
        if has_key(s:_r.bufvars, dbuf)
            " Is used to preserve diff after Prev/Next mappings
            let bvar=s:_r.bufvars[dbuf]
            let bvar.diff_auargs=['other']
            let bvar.preserve=s:F.preserve
        endif
        let i+=1
    endfor
    execute bufwinnr(buf).'wincmd w'
    call cursor(dbvar.cursor)
    call s:F.bwau(buf, '')
    if has_key(s:_r.bufvars, buf)
        let bvar=s:_r.bufvars[buf]
        let bvar.diff_auargs=['']
        let bvar.preserve=s:F.preserve
    endif
endfunction
let s:_augroups+=['AuVimDiff']
"▶1 exit
function s:F.exit(...)
    let buf=bufnr('%')
    let cmd="\<C-\>\<C-n>"
    "▶2 AuV full was used
    if exists('t:auvimdiff_full')
        let vdid=t:auvimdiff_full
        let tabnr=tabpagenr()
        for tabnr in range(1, tabnr)
            if gettabvar(tabnr, 'auvimdiff_full') is vdid
                break
            endif
        endfor
        let vdtabcond="exists('t:auvimdiff_full') && t:auvimdiff_full is ".vdid
        let cmd.=":tabnext ".tabnr."\n"
        let cmd.=":while tabpagenr('$')>1 && ".vdtabcond." | ".
                    \"tabclose! | ".
                    \"endwhile\n"
        let cmd.=":if ".vdtabcond." | ".
                    \"only! | ".
                    \"enew! | ".
                    \"endif\n"
        return cmd
    "▶2 diffsplit() was not used
    elseif !exists('t:auvimdiff_diffbufvars') ||
                \!exists('t:auvimdiff_origbufvar') ||
                \(!has_key(t:auvimdiff_diffbufvars, buf) &&
                \ buf!=t:auvimdiff_origbufvar.bufnr)
        if &diff && exists('t:auvimdiff_prevbuffers')
            for dbuf in map(filter(range(1, winnr('$')),
                      \            'getwinvar(v:val, "&diff")'),
                      \     'winbufnr(v:val)')
                if has_key(t:auvimdiff_prevbuffers, dbuf)
                    let prevbuf=remove(t:auvimdiff_prevbuffers, dbuf)
                    if prevbuf
                        let cmd.=':buffer '.prevbuf."\n"
                    endif
                    let cmd.=':bwipeout! '.dbuf."\n"
                endif
                call s:_f.mapgroup.unmap('AuVimDiff', dbuf)
            endfor
            let cmd.=":diffoff!\n"
        else
            call s:_f.mapgroup.unmap('AuVimDiff', buf)
        endif
        if exists('t:auvimdiff_prevbuffers')
            unlet t:auvimdiff_prevbuffers
        endif
        return cmd
    endif
    "▲2
    let dbvar=t:auvimdiff_origbufvar
    let isorig=(buf==dbvar.bufnr)
    call s:_f.mapgroup.unmap('AuVimDiff', buf)
    let cmd.=":diffoff!\n"
    "▶2 Original buffer
    for ddbvar in filter(values(t:auvimdiff_diffbufvars),
                \        'bufexists(v:val.bufnr)')
        call s:_f.mapgroup.unmap('AuVimDiff', ddbvar.bufnr)
        let bwnr=bufwinnr(ddbvar.bufnr)
        if bwnr!=-1
            if has_key(ddbvar, 'prevbuf') && bufexists(ddbvar.prevbuf)
                let cmd.=':'.bwnr."wincmd w\n".
                            \':buffer '.ddbvar.prevbuf."\n".
                            \"\<C-w>p"
            endif
            if !ddbvar.existed
                let cmd.=':if bufexists('.ddbvar.bufnr.') | '.
                            \   'bwipeout '.ddbvar.bufnr.' | '.
                            \"endif\n"
            endif
        else
            let cmd.=':if bufexists('.ddbvar.bufnr.') | '.
                        \   'bwipeout '.ddbvar.bufnr.' | '.
                        \"endif\n"
        endif
    endfor
    "▶2 Opened buffer
    if bufexists(dbvar.bufnr)
        call s:_f.mapgroup.unmap('AuVimDiff', dbvar.bufnr)
        if bufwinnr(dbvar.bufnr)!=-1
            let cmd.=':'.bufwinnr(ddbvar.srcbuf)."wincmd w\n"
        endif
    endif
    "▲2
    return cmd
endfunction
"▶1 preserve
function s:F.preservebv(bvar, buf)
    diffthis
    let buf=bufnr('%')
    call s:_f.mapgroup.map('AuVimDiff', buf)
    let bvar=s:_r.bufvars[buf]
    let bvar.preserve=s:F.preserve
    let bvar.diff_auargs=a:bvar.diff_auargs
    call call(s:F.bwau, [buf]+a:bvar.diff_auargs, {})
    if exists('t:auvimdiff_diffbufvars') &&
                \has_key(t:auvimdiff_diffbufvars, a:buf)
        let ddbvar=remove(t:auvimdiff_diffbufvars, a:buf)
        if &filetype isnot# ddbvar.orig_filetype
            let ddbvar.filetype=&filetype
            let &filetype=ddbvar.orig_filetype
        endif
        let ddbvar.bufnr=buf
        let t:auvimdiff_diffbufvars[buf]=ddbvar
        if exists('t:auvimdiff_origbufvar')
            call map(t:auvimdiff_origbufvar.diffbufs,
                        \'v:val=='.a:buf.' ? '.buf.' : v:val')
        endif
    elseif exists('t:auvimdiff_origbufvar') &&
                \t:auvimdiff_origbufvar.bufnr == buf
        let t:auvimdiff_origbufvar.bufnr=buf
        if exists('t:auvimdiff_diffbufvars')
            call map(t:auvimdiff_diffbufvars,
                        \'extend(v:val, {"srcbuf": '.buf.'})')
        endif
        let t:auvimdiff_origbufvar.changedtick=b:changedtick
    endif
endfunction
function s:F.preserve()
    if &diff
        augroup AuVimDiff
            autocmd! BufWipeOut <buffer>
            autocmd! BufEnter   <buffer>
        augroup END
        return s:F.preservebv
    endif
    return 0
endfunction
"▶1 AuVimDiff mappings
call s:_f.mapgroup.add('AuVimDiff', {
            \  'Exit': {'lhs': 'X', 'rhs': s:F.exit},
        \}, {'mode': 'n', 'silent': 1, 'dontmap': 1, 'leader': '<Leader>',})
"▶1 openfile
function s:F.openfile(usewin, hasbuf, repo, revs, file)
    "▶2 Open first buffer
    let frev=a:revs[0]
    if a:hasbuf
        let fbuf=bufnr('%')
    else
        let t:auvimdiff_prevbuffers={}
        let prevbuf=s:_r.prevbuf()
        if frev is 0
            execute 'silent edit' fnameescape(s:_r.os.path.join(a:repo.path,
                        \                     a:file))
        else
            call s:_r.run('silent edit', 'file', a:repo, frev, a:file)
        endif
        let t:auvimdiff_prevbuffers[bufnr('%')]=prevbuf
        let fbuf=bufnr('%')
    endif
    "▶2 Open subsequent buffers
    let difftargets=map(a:revs[1:],
                \'((v:val is 0)?'.
                \   '(a:file):'.
                \   '(["file", a:repo, v:val, a:file]))')
    call s:F.diffsplit(difftargets, a:usewin)
    "▲2
    return fbuf
endfunction
"▶1 opentab
function s:F.opentab(repo, revs, file, fdescr)
    "▶2 Open first revision
    let frev=a:revs[0]
    if !has_key(a:fdescr, 1) || a:fdescr[1] is# 'removed'
                \            || a:fdescr[1] is# 'deleted'
        tabnew
        let existed=0
    elseif frev is 0
        let fname=fnameescape(s:_r.os.path.join(a:repo.path, a:file))
        let existed=bufexists(fname)
        execute 'silent tabedit' fname
    else
        let existed=s:_r.run('silent tabedit', 'file', a:repo, frev, a:file)
    endif
    if !existed
        setlocal bufhidden=wipe
    endif
    let t:auvimdiff_full=s:lastfullid
    call s:_f.mapgroup.map('AuVimDiff', bufnr('%'))
    "▶2 Open subsequent revisions
    let i=1
    let vertical=(stridx(&diffopt, 'vertical')!=-1)
    for rev in a:revs[1:]
        if !has_key(a:fdescr, i) || a:fdescr[i] is# 'added'
                    \            || a:fdescr[i] is# 'unknown'
            diffthis
            if vertical
                vnew
            else
                new
            endif
            diffthis
            let existed=0
        else
            let existed=s:_r.run('silent diffsplit','file', a:repo, rev, a:file)
        endif
        if !existed
            setlocal bufhidden=wipe
        endif
        call s:_f.mapgroup.map('AuVimDiff', bufnr('%'))
        let i+=1
    endfor
    1 wincmd w
    "▲2
endfunction
"▶1 fullvimdiff
function s:F.fullvimdiff(repo, revs, mt, files, areglobs, ...)
    let statuses=map(a:revs[1:],
                \    'a:repo.functions.status(a:repo, v:val, a:revs[0])')
    let files={}
    let i=1
    let stypes=['modified']
    "▶2 Get accepted statuses list
    if a:mt
        let stypes+=['added', 'removed']
        if a:mt==2
            let stypes+=['deleted', 'unknown']
        endif
    endif
    "▶2 Get file statuses
    for status in statuses
        for [k, fs] in filter(items(status), 'index(stypes, v:val[0])!=-1')
            for f in fs
                if !has_key(files, f)
                    let files[f]={}
                endif
                let files[f][i]=k
            endfor
        endfor
        let i+=1
    endfor
    "▶2 Filter out requested files
    if !empty(a:files)
        let files2={}
        if a:areglobs
            let filepats=map(filter(copy(a:files), 'v:val isnot# ":"'),
                        \    's:_r.globtopat(v:val)')
            "▶3 Current file
            if a:0 && !empty(a:1)
                for f in a:1
                    if has_key(files, f)
                        let files2[f]=remove(files, f)
                    else
                        call s:_f.throw('cndiff', f)
                    endif
                endfor
            endif
            "▲3
            for pattern in filepats
                call map(filter(keys(files), 'v:val=~#pattern'),
                            \'extend(files2, {v:val : remove(files, v:val)})')
            endfor
        else
            for f in filter(copy(a:files), 'has_key(files, v:val)')
                let files2[f]=remove(files, f)
            endfor
        endif
        let files=files2
    endif
    "▶2 Open tabs
    let s:lastfullid+=1
    for [f, d] in items(files)
        call s:F.opentab(a:repo, a:revs, f, d)
    endfor
    "▲2
endfunction
"▶1 :AuVimDiff
" TODO exclude binary files from full diff
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'{  repo  '.s:_r.cmdutils.comp.repo.
            \'  ?file  '.s:_r.cmdutils.comp.file.
            \' *?files (match /\W/)'.
            \' !?full'.
            \' !?untracked'.
            \' !?onlymodified'.
            \' !?curfile'.
            \' !?usewin'.
            \'}'.
            \'+ '.s:_r.cmdutils.comp.rev, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \[['\V(match /\\W/)', '(path)', '']], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(opts, ...)
    "▶2 repo and revisions
    let full=get(a:opts, 'full', 0)
    let action=((full)?('getfiles'):('open'))
    let [hasbuf, repo, rev, file]=s:_r.cmdutils.getrrf(a:opts, 0, action)
    call s:_r.cmdutils.checkrepo(repo)
    let revs=[]
    if rev isnot 0
        let rev=repo.functions.getrevhex(repo, rev)
    endif
    if get(a:opts, 'curfile', 0)
        let revs+=[0]
    endif
    if a:0
        let revs+=map(copy(a:000), 'repo.functions.getrevhex(repo, v:val)')
        if len(revs)==1
            call insert(revs, rev)
        endif
    else
        if empty(revs)
            let revs+=[rev]
        endif
        let revs+=[repo.functions.getworkhex(repo)]
    endif
    if revs[1] is# revs[0]
        let revs[1]=get(repo.functions.getwork(repo).parents, 0, 0)
        if revs[1] is 0
            call s:_f.throw('nodrev')
        endif
    endif
    "▲2
    if full
        let args=[repo, revs,
                    \((get(a:opts, 'untracked', 0))?
                    \   (2):
                    \   (!get(a:opts, 'onlymodified', 1)))]
        if has_key(a:opts, 'files')
            let files=map(filter(copy(a:opts.files), 'v:val isnot# ":"'),
                        \        'repo.functions.reltorepo(repo, v:val)')
            let args+=[files, 1]
            if len(files)!=len(a:opts.files)
                if empty(file)
                    call s:_f.throw('nodfile')
                else
                    let args+=[file]
                endif
            endif
        else
            let args+=[[], 0]
        endif
        return call(s:F.fullvimdiff, args, {})
    else
        if file is 0
            call s:_f.throw('nodfile')
        endif
        let usewin=get(a:opts, 'usewin', -1)
        let usewin=(usewin==-1 ? s:_f.getoption('vimdiffusewin') : usewin)
        let fbuf=s:F.openfile(usewin, hasbuf, repo, revs, file)
        if bufwinnr(fbuf)!=-1
            execute bufwinnr(fbuf).'wincmd w'
        endif
    endif
endfunction
"▶1 Post resource
call s:_f.postresource('vimdiff', {'split': s:F.diffsplit,
            \                       'full': s:F.fullvimdiff,})
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded,lastfullid')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
