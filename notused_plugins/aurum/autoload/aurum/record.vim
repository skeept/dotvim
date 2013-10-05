"▶1 
scriptencoding utf-8
execute frawor#Setup('0.2', {'@/os': '0.0',
            \          '@/mappings': '0.0',
            \         '@/functions': '0.1',
            \               '@/fwc': '0.0',
            \       '@%aurum/cache': '2.4',
            \    '@%aurum/cmdutils': '4.3',
            \    '@%aurum/tabutils': '1.0',
            \   '@%aurum/lineutils': '0.0',
            \        '@%aurum/edit': '1.5',
            \        '@%aurum/undo': '1.0',
            \     '@%aurum/bufvars': '0.0',})
let s:_messages={
            \ 'bkpmis': 'Backup file %s not found',
            \'delfail': 'Failed to remove file %s',
            \'renfail': 'Failed to move file %s to %s',
            \ 'recnof': 'No files were selected for commiting',
            \   'norm': 'Can’t remove file %s as it was not added',
            \   'noad': 'Can’t add file %s as it is already included',
        \}
"▶1 write
function s:F.write(bvar)
    call feedkeys("\<C-\>\<C-n>:call ".
            \      "call(<SNR>".s:_sid."_Eval('s:F.runstatmap'), ".
            \           "['commit', ".expand('<abuf>')."], {})\n","n")
    call map(copy(s:_r.cache.allkeys), 's:_r.cache.wipe(v:val)')
endfunction
"▶1 genstate
function s:F.genstate(repo)
    let cs       = a:repo.functions.getwork(a:repo)
    let allfiles = a:repo.functions.getcsprop(a:repo, cs, 'allfiles')
    let status   = a:repo.functions.status(a:repo, 0, 0, allfiles)
    let state={'files': allfiles, 'contents': {}, 'removes': {}, 'revstatus': {},
                \'description': cs.description}
    for [s, files] in items(status)
        for file in files
            if index(allfiles, file)!=-1
                let state.contents[file]=
                            \a:repo.functions.readfile(a:repo, cs.hex, file)
            else
                let state.removes[file]=1
            endif
        endfor
    endfor
    return state
endfunction
"▶1 setstate
function s:F.setstate(repo, bvar, state)
    for idx in range(len(a:bvar.lines))
        let file=a:bvar.files[idx]
        if has_key(a:state.removes, file)
            let type=a:bvar.types[idx]
            if index(['added', 'unknown'], type)!=-1
                " Do nothing: just do not include the file in the commit
            elseif a:bvar.types[idx] is# 'modified'
                call a:repo.functions.forget(file)
                let a:bvar.types[idx]='removed'
                let a:bvar.chars[idx]='R'
                let a:bvar.lines[idx]='R '.file
                let a:bvar.statuses[idx]=2
            elseif index(['deleted', 'removed'], type)
                let a:bvar.statuses[idx]=2
            endif
        elseif index(a:state.files, file)!=-1
            if has_key(a:state.contents, file)
                let fullpath=s:_r.os.path.join(a:repo.path, file)
                let backupfile=s:F.getbackupfile(a:bvar, fullpath)
                if rename(fullpath, backupfile)
                    call s:_f.throw('renfail', fullpath, backupfile)
                endif
                call writefile(a:state.contents[file], fullpath, 'b')
                if filereadable(fullpath)
                    " FIXME may loose executable bit
                    let a:bvar.backupfiles[backupfile]=fullpath
                    let a:bvar.filesbackup[fullpath]=backupfile
                else
                    let a:bvar.newfiles[fullpath]=1
                endif
                let a:bvar.statuses[idx]=3
            else
                let a:bvar.statuses[idx]=2
            endif
        endif
    endfor
    let a:bvar.copts.message = a:state.description
    call s:_r.undo.reset(a:bvar)
    call cursor(1, 1)
endfunction
"▶1 run
function s:F.run(cmd, opts, files, container)
    let files=copy(a:files)
    if !empty(files) && a:opts.repo is# ':'
        let repo=s:_r.cmdutils.checkedgetrepo(s:_r.os.path.dirname(files[0]))
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
    endif
    if get(a:opts, 'amend', 0)
        let state=s:F.genstate(repo)
        call repo.functions.strip(repo)
    else
        let state=0
    endif
    call map(files, 'repo.functions.reltorepo(repo, v:val)')
    let sopts={'prefix': '-'}
    if !empty(files)
        let sopts.files=files
    endif
    call s:_r.run(a:cmd, 'status', repo, sopts)
    setlocal nomodifiable
    call s:_f.mapgroup.map('AuRecord', bufnr('%'))
    call extend(a:container, [state, repo])
endfunction
"▶1 _unload :: bvar
function s:F._unload(bvar)
    return s:_f.tab.unload(s:layoutname, a:bvar)
endfunction
"▶1 recfunc
" TODO investigate why closing record tab is causing next character consumption
"      under wine
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'{  repo      '.s:_r.cmdutils.comp.repo.
            \'  ?message     type ""'.
            \'  ?date        type ""'.
            \'  ?user        type ""'.
            \' !?closebranch'.
            \' !?amend'.
            \'} '.
            \'+ '.s:_r.cmdutils.comp.file, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(opts, ...)
    let container=[]
    call s:_f.tab.create(s:layoutname, s:F.run, [a:opts, a:000, container])
    let [state, repo]=container
    let bvar=s:_r.bufvars[bufnr('%')]
    " 0: not included, unmodified
    " 1: not included,   modified
    " 2:     included, unmodified
    " 3:     included,   modified
    let bvar.statuses=repeat([0], len(bvar.types))
    let bvar.backupfiles={}
    let bvar.filesbackup={}
    let bvar.newfiles={}
    let bvar.lines=map(copy(bvar.chars), 'v:val." ".bvar.files[v:key]')
    let bvar.copts=extend(copy(a:opts), {'repo': repo})
    let bvar.bufnr=bufnr('%')
    let bvar.oldbufs={}
    let bvar.bwfunc=s:F._unload
    let bvar.switchwindow=s:F.switchwindow
    let bvar.openfiles=s:F.openfiles
    let bvar.foreignactions=s:foreignactions
    let bvar.foreignmap=s:F.foreignmap
    let bvar.write=s:F.write
    let bvar.savedopts={'undolevels': &undolevels,
                \        'scrollopt': &scrollopt,
                \        'autowrite': &autowrite,
                \     'autowriteall': &autowriteall,
                \         'autoread': &autoread,}
    let bvar.resetlines=s:F.resetlines
    let bvar.pulllines=s:F.pulllines
    let bvar.procundoleaf=s:F.procundoleaf
    call s:_r.undo.setup(bvar)
    setglobal noautowrite noautowriteall noautoread
    setlocal noreadonly buftype=acwrite
    augroup AuRecordVimLeave
        execute 'autocmd! VimLeave * nested '.
                    \   ':if has_key(s:_r.bufvars,'.bvar.bufnr.')'.
                    \   '|  call s:F._unload(s:_r.bufvars.'.bvar.bufnr.')'.
                    \   '|endif'
    augroup END
    if empty(bvar.chars)
        bwipeout!
    endif
    if !empty(state)
        call s:F.setstate(repo, bvar, state)
    endif
endfunction
"▶1 resetlines
function s:F.resetlines(bvar)
    for idx in range(len(a:bvar.lines))
        call setline(idx+1, s:statchars[a:bvar.statuses[idx]].a:bvar.lines[idx])
    endfor
endfunction
"▶1 restorebackup
function s:F.restorebackup(file, backupfile)
    if a:backupfile isnot 0
        if !filereadable(a:backupfile)
            call s:_f.warn('bkpmis', a:backupfile)
            return
        endif
    endif
    if delete(a:file)
        call s:_f.warn('delfail', a:file)
    endif
    if a:backupfile isnot 0
        if rename(a:backupfile, a:file)
            call s:_f.warn('renfail', a:backupfile, a:file)
        endif
    endif
endfunction
"▶1 unload
function s:F.unload(bvar)
    let backupfiles=copy(a:bvar.backupfiles)
    let newfiles=copy(a:bvar.newfiles)
    call filter(backupfiles, 'filereadable(v:key)')
    call filter(newfiles,    'filereadable(v:key)')
    call map(backupfiles, 's:F.restorebackup(v:val, v:key)')
    call map(newfiles,    's:F.restorebackup(v:key,   0  )')
    for [buf, savedopts] in items(filter(a:bvar.oldbufs, 'bufexists(v:key)'))
        for [opt, optval] in items(savedopts)
            call setbufvar(buf, '&'.opt, optval)
        endfor
    endfor
    augroup AuRecordVimLeave
        autocmd!
    augroup END
endfunction
"▶1 getwnrs
function s:F.getwnrs()
    return s:_f.tab.getwnrs()
endfunction
"▶1 register tab
let s:layoutname='AuRecordTab'
call s:_f.tab.new(s:layoutname, {
            \    'top': ['AuRecordLeft', 'AuRecordRight'],
            \ 'bottom': 'AuRecordStatus',
            \'oprefix': 'rec',
            \ 'unload': s:F.unload,
        \})
"▶1 edit
let s:savedopts=['readonly', 'modifiable', 'scrollbind', 'cursorbind',
            \    'scrollopt', 'wrap', 'foldmethod', 'foldcolumn']
function s:F.edit(bvar, fname, ro)
    if type(a:fname)==type('')
        " XXX Do not handle existance of aurum://edit and aurum://copy buffers: 
        " they are only used by AuRecord and recfunc forbids to launch new 
        " record if there is already one active
        let existed=0
        execute 'silent edit!' fnameescape(a:fname)
    else
        let existed=call(s:_r.run, ['silent edit']+a:fname, {})
    endif
    let buf=bufnr('%')
    if existed
        if !has_key(a:bvar.oldbufs, buf)
            let savedopts={'diff': 0}
            let a:bvar.oldbufs[buf]=savedopts
            for o in s:savedopts
                let savedopts[o]=getbufvar(buf, '&'.o)
            endfor
        endif
    else
        setlocal bufhidden=wipe
    endif
    if a:ro
        setlocal   readonly nomodifiable
    else
        setlocal noreadonly   modifiable
    endif
    if getwinvar(0, 'aurum_winid') is# 'AuRecordLeft'
        call s:_f.mapgroup.map('AuRecordLeft', bufnr('%'))
    endif
endfunction
let s:_augroups+=['AuRecordLeft']
"▶1 restorefiles :: bvar, sline::UInt, eline::UInt → + FS
function s:F.restorefiles(bvar, sline, eline)
    for file in map(range(a:sline, a:eline), 'a:bvar.lines[v:val-1][2:]')
        let fullpath=s:_r.os.path.join(a:bvar.repo.path, file)
        let backupfile=a:bvar.filesbackup[fullpath]
        call s:F.restorebackup(fullpath, backupfile)
    endfor
endfunction
"▶1 pulllines
function s:F.pulllines(bvar)
    for line in range(1, line('$'))
        let a:bvar.statuses[line-1]=stridx(s:statchars, getline(line)[0])
    endfor
endfunction
"▶1 procundoleaf
function s:F.procundoleaf(bvar, undoleaf)
    for [file, contents] in items(a:undoleaf)
        if contents is 0 && filereadable(file)
            call delete(file)
        else
            call writefile(contents, file, 'b')
        endif
        unlet contents
    endfor
endfunction
"▶1 undoleafwrite :: bvar, lines::[String], path → + bvar, FS
function s:F.undoleafwrite(bvar, lines, file)
    if a:file is# a:bvar.file
        let a:bvar.undoleaf[a:bvar.fullpath]=a:lines
    endif
    return a:bvar.ewrite(a:bvar, a:lines, a:file)
endfunction
"▶1 getbackupfile
function s:F.getbackupfile(bvar, fullpath)
    if has_key(a:bvar.filesbackup, a:fullpath)
        let backupfile=a:bvar.filesbackup[a:fullpath]
    else
        let backupfile=a:fullpath.'.orig'
        let i=0
        while s:_r.os.path.exists(backupfile)
            let backupfile=a:fullpath.'.'.i.'.orig'
            let i+=1
        endwhile
    endif
    return backupfile
endfunction
"▶1 updateline
function s:F.updateline(bvar, ...)
    let line=get(a:000, 0, line('.'))
    call setline(line, s:statchars[a:bvar.statuses[line-1]].a:bvar.lines[line-1])
    return 0
endfunction
"▶1 sactions
let s:F.sactions={}
"▶2 sactions.[v]add, sactions.[v]remove
function s:F.sactions.add(action, bvar, buf)
    if a:action[0] is# 'v'
        let sline=line("'<")
        let eline=line("'>")
        if sline>eline
            let [sline, eline]=[eline, sline]
        endif
    else
        let sline=line('.')
        let eline=line('.')+v:count1-1
        if eline>line('$')
            let eline=line('$')
        endif
    endif
    let add=(a:action[-3:] is# 'add')
    for line in range(sline, eline)
        let status=a:bvar.statuses[line-1]
        let oldstatus=status
        if add
            if status<2
                let status+=2
            elseif status==3
                let status=2
                call s:F.restorefiles(a:bvar, sline, eline)
            endif
        else
            if status>1
                let status-=2
            elseif status==1
                let status=0
                call s:F.restorefiles(a:bvar, sline, eline)
            endif
        endif
        if oldstatus==status
            call s:_f.warn('no'.((add)?('ad'):('rm')), a:bvar.files[line-1])
            continue
        endif
        let a:bvar.statuses[line-1]=status
        call setline(line, s:statchars[status].a:bvar.lines[line-1])
    endfor
    return 1
endfunction
let s:F.sactions.vadd=s:F.sactions.add
let s:F.sactions.remove=s:F.sactions.add
let s:F.sactions.vremove=s:F.sactions.remove
"▶2 sactions.discard
function s:F.sactions.discard(action, bvar, buf)
    call s:F._unload(a:bvar)
    return 0
endfunction
"▶2 sactions.undo
function s:F.sactions.undo(action, bvar, buf)
    execute 'silent normal! '.v:count1.'u'
    return s:_r.undo.postundo(a:bvar)
endfunction
"▶2 sactions.redo, sactions.earlier, sactions.later
let s:uactkey={
            \'redo':    "\<C-r>",
            \'earlier': "g+",
            \'later':   "g-",
        \}
function s:F.sactions.redo(action, bvar, buf)
    execute 'silent normal! '.v:count1.s:uactkey[a:action]
    return 1
endfunction
let s:F.sactions.earlier=s:F.sactions.redo
let s:F.sactions.later=s:F.sactions.earlier
"▶2 sactions.edit
function s:F.sactions.edit(action, bvar, buf)
    let [lwnr, rwnr, swnr]=s:F.getwnrs()
    let file=a:bvar.lines[line('.')-1][2:]
    let type=a:bvar.types[line('.')-1]
    let status=a:bvar.statuses[line('.')-1]
    let modified=status%2
    execute lwnr.'wincmd w'
    diffoff!
    let fullpath=s:_r.os.path.join(a:bvar.repo.path, file)
    let ntype=get(s:ntypes, type, 0)
    if !modified
        if ntype is# 'm' || ntype is# 'a'
            let backupfile=s:F.getbackupfile(a:bvar, fullpath)
        elseif ntype is# 'r'
            let a:bvar.newfiles[fullpath]=1
        endif
    endif
    if ntype isnot 0
        execute swnr.'wincmd w'
        if !modified
            let status=3
            let a:bvar.statuses[line('.')-1]=status
        endif
        if a:bvar.undo_full
            call s:_r.undo.doaction(a:bvar, 0, s:F.updateline)
            let undoleaf=s:_r.undo.getundoleaf(a:bvar)
        else
            call s:_r.undo.reset(a:bvar)
        endif
        execute lwnr.'wincmd w'
        call s:F.edit(a:bvar, 'aurum://edit:'.fullpath, 0)
        call s:_f.tab.setautowrite()
        if a:bvar.undo_full
            let ebvar=s:_r.bufvars[bufnr('%')]
            let ebvar.undoleaf=undoleaf
            let ebvar.fullpath=fullpath
            let ebvar.ewrite=ebvar.write
            let ebvar.write=s:F.undoleafwrite
        endif
        if ntype is# 'm' || (modified && ntype is# 'a')
            if !modified
                let fcontents=a:bvar.repo.functions.readfile(
                            \     a:bvar.repo,
                            \     a:bvar.repo.functions.getworkhex(a:bvar.repo),
                            \     file)
            endif
            diffthis
            execute rwnr.'wincmd w'
            call s:F.edit(a:bvar, 'aurum://copy:'.
                        \((modified)?(a:bvar.filesbackup[fullpath]):
                        \            (fullpath)), 1)
            diffthis
            wincmd p
        elseif modified
            if ntype is# 'r'
                diffthis
                execute rwnr.'wincmd w'
                call s:F.edit(a:bvar,
                            \ ['file', a:bvar.repo,
                            \  a:bvar.repo.functions.getworkhex(a:bvar.repo),
                            \  file], 1)
                diffthis
                wincmd p
            endif
        else
            if ntype is# 'a'
                let fcontents=readfile(fullpath, 'b')
            elseif ntype is# 'r'
                let fcontents=a:bvar.repo.functions.readfile(
                            \     a:bvar.repo,
                            \     a:bvar.repo.functions.getworkhex(a:bvar.repo),
                            \     file)
            endif
        endif
        if !modified
            if exists('backupfile')
                let isexe=executable(fullpath)
                if rename(fullpath, backupfile)
                    call s:_f.warn('renfail', fullpath, backupfile)
                    setlocal readonly nomodifiable
                    execute swnr.'wincmd w'
                    return 0
                endif
                let a:bvar.backupfiles[backupfile]=fullpath
                let a:bvar.filesbackup[fullpath]=backupfile
                if a:bvar.undo_full
                    let undoleaf[fullpath]=0
                    let undoleaf[backupfile]=readfile(backupfile, 'b')
                    let oundoleafpart={fullpath   : copy(undoleaf[backupfile]),
                                \      backupfile : 0}
                    call s:_r.undo.updatetree(a:bvar, oundoleafpart)
                endif
            else
                let isexe=0
            endif
            let diff=&diff
            if exists('fcontents')
                silent %delete _
                call s:_r.lineutils.setlines(fcontents, 0)
                if diff
                    diffupdate
                endif
            endif
            silent write
            if isexe && s:_r.os.name is# 'posix'
                call system('chmod +x '.fnameescape(fullpath))
            endif
        endif
        if !has_key(s:_r.bufvars, bufnr('%'))
            let s:_r.bufvars[bufnr('%')]={}
        endif
        call extend(s:_r.bufvars[bufnr('%')], {'recfile': file,
                    \                      'recmodified': modified,
                    \                      'recfullpath': fullpath,
                    \                       'recnewfile': 0,})
        if exists('backupfile')
            let s:_r.bufvars[bufnr('%')].recbackupfile=backupfile
        else
            let s:_r.bufvars[bufnr('%')].recnewfile=1
        endif
    endif
    return 1
endfunction
let s:_augroups+=['AuRecordAutowrite']
"▶2 sactions.commit
function s:F.sactions.commit(action, bvar, buf)
    let files=filter(copy(a:bvar.files), 'a:bvar.statuses[v:key]>1')
    if empty(files)
        call s:_f.warn('recnof')
        return 0
    endif
    setlocal bufhidden=hide
    let winview=winsaveview()
    try
        let r=s:_f.tab.copen(a:bvar, a:buf, s:ntypeskeys, {},
                    \        a:bvar.status, files)
    finally
        if bufwinnr(a:buf)!=-1
            call setbufvar(a:buf, '&bufhidden', 'wipe')
        endif
    endtry
    if r
        call s:F._unload(a:bvar)
    endif
    return 0
endfunction
"▶1 runstatmap
let s:statchars='-^+*'
let s:ntypes={
            \'modified': 'm',
            \'added':    'a',
            \'unknown':  'a',
            \'removed':  'r',
            \'deleted':  'r',
        \}
let s:ntypeskeys=keys(s:ntypes)
let s:uactions={
            \   'undo': 'undo',
            \   'redo': 'redo',
            \'earlier': 'undo',
            \  'later': 'redo',
        \}
function s:F.runstatmap(action, ...)
    "▶2 buf, bvar, reset
    let buf=get(a:000, 0, bufnr('%'))
    let bvar=s:_r.bufvars[buf]
    if !a:0
        if !s:_r.undo.preaction(bvar)
            return
        endif
    endif
    "▶2 undo
    let isundo=has_key(s:uactions, a:action)
    if isundo
        if !s:_r.undo.preundoaction(bvar, s:uactions[a:action])
            return
        endif
    endif
    "▶2 action
    call s:_r.undo.doaction(bvar, 1, s:F.runaction, a:action,buf,isundo)
endfunction
"▶1 foreignmap
let s:foreignactions={
            \'track': 1,
            \'commit': 1,
            \'forget': 1,
        \}
function s:F.foreignmap(action, visual)
    if a:action is# 'track'
        return s:F.runstatmap(((a:visual)?('v'):('')).'add')
    elseif a:action is# 'commit'
        return s:F.runstatmap('commit')
    elseif a:action is# 'forget'
        return s:F.runstatmap(((a:visual)?('v'):('')).'remove')
    endif
endfunction
"▶1 switchwindow
function s:F.switchwindow()
    let [lwnr, rwnr, swnr]=s:F.getwnrs()
    execute lwnr.'wincmd w'
endfunction
"▶1 openfiles
function s:F.openfiles(file2, fargs1, fargs2)
    let [lwnr, rwnr, swnr]=s:F.getwnrs()
    if a:file2 isnot 0
        execute 'silent edit' fnameescape(a:file2)
    else
        call call(s:_r.mrun, ['silent edit']+a:fargs2, {})
    endif
    diffthis
    execute rwnr.'wincmd w'
    call call(s:_r.mrun, ['silent edit']+a:fargs1, {})
    diffthis
    wincmd p
endfunction
"▶1 runaction
function s:F.runaction(bvar, action, buf, isundo)
    if s:F.sactions[a:action](a:action, a:bvar, a:buf)
        return a:isundo
    endif
    return 0
endfunction
"▶1 runleftmap
function s:F.runleftmap(action)
    let [lwnr, rwnr, swnr]=s:F.getwnrs()
    let bvar=s:_r.bufvars[bufnr('%')]
    if a:action is# 'discard'
        execute lwnr.'wincmd w'
        let lbuf=bufnr('%')
        silent enew!
        setlocal bufhidden=wipe
        let ebuf=bufnr('%')
        execute rwnr.'wincmd w'
        let rbuf=bufnr('%')
        silent execute 'buffer!' ebuf
        execute swnr.'wincmd w'
        if !bvar.recmodified
            let sbvar=s:_r.bufvars[bufnr('%')]
            if bvar.recnewfile
                call s:F.restorebackup(bvar.recfullpath, 0)
            else
                call s:F.restorebackup(bvar.recfullpath, bvar.recbackupfile)
            endif
            let fidx=index(sbvar.files, bvar.recfile)
            let sbvar.statuses[fidx]=0
            call s:_r.undo.doaction(sbvar, 0, s:F.updateline, fidx+1)
        endif
    elseif a:action is# 'commit'
        silent update
        execute swnr.'wincmd w'
        return s:F.runstatmap('commit')
    elseif a:action is# 'discardall'
        execute swnr.'wincmd w'
        return s:F.runstatmap('discard')
    elseif a:action is# 'remove'
        call s:F.runleftmap('discard')
        let sbvar=s:_r.bufvars[bufnr('%')]
        let fidx=index(sbvar.files, bvar.recfile)
        if sbvar.statuses[fidx]>1
            let sbvar.statuses[fidx]-=2
            call s:_r.undo.doaction(sbvar, 0, s:F.updateline, fidx)
        else
            call s:_f.warn('norm', bvar.recfile)
        endif
    elseif a:action is# 'finish'
        silent write
        execute swnr.'wincmd w'
    endif
endfunction
"▶1 rec mappings
function s:F.gm(...)
    return ':<C-u>call call(<SID>Eval("s:F.runstatmap"),'.string(a:000).','.
                \          '{})<CR>'
endfunction
function s:F.gml(...)
    return ':<C-u>call call(<SID>Eval("s:F.runleftmap"),'.string(a:000).','.
                \          '{})<CR>'
endfunction
call s:_f.mapgroup.add('AuRecord', {
            \   'Edit': {'lhs': 'O',     'rhs': s:F.gm('edit')   },
            \   'Undo': {'lhs': 'u',     'rhs': s:F.gm('undo')   },
            \   'Redo': {'lhs': '<C-r>', 'rhs': s:F.gm('redo')   },
            \'Earlier': {'lhs': 'g-',    'rhs': s:F.gm('earlier')},
            \  'Later': {'lhs': 'g+',    'rhs': s:F.gm('later')  },
        \}, {'mode': 'n', 'silent': 1, 'dontmap': 1})
call s:_f.mapgroup.add('AuRecordLeft', {
            \'Discard': {'lhs': 'x', 'rhs': s:F.gml('discard')   },
            \   'Exit': {'lhs': 'X', 'rhs': s:F.gml('discardall')},
            \ 'Commit': {'lhs': 'i', 'rhs': s:F.gml('commit')    },
            \ 'Remove': {'lhs': 'R', 'rhs': s:F.gml('remove')    },
            \ 'Finish': {'lhs': 'A', 'rhs': s:F.gml('finish')    },
        \}, {'mode': 'n', 'silent': 1, 'dontmap': 1, 'leader': '<Leader>'})
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
