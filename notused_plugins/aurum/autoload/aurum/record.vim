"▶1 
scriptencoding utf-8
execute frawor#Setup('0.0', {'@/options': '0.0',
            \                     '@/os': '0.0',
            \               '@/mappings': '0.0',
            \              '@/functions': '0.1',
            \                    '@/fwc': '0.0',
            \            '@%aurum/cache': '2.4',
            \           '@%aurum/commit': '1.3',
            \         '@%aurum/cmdutils': '4.3',
            \        '@%aurum/lineutils': '0.0',
            \             '@%aurum/edit': '1.5',
            \          '@%aurum/bufvars': '0.0',})
let s:hasundo=exists('*undotree')
let s:_options={
            \'recheight': {'default': 0,
            \               'filter': '(if type "" earg _  range 0 inf)'},
            \'fullundo':  {'default': s:hasundo,
            \               'filter': 'bool'},
        \}
let s:_messages={
            \  'recex': 'There is already one AuRecord tab active '.
            \           '(found tab with t:aurecid set to "AuRecordTab")',
            \ 'bkpmis': 'Backup file %s not found',
            \'delfail': 'Failed to remove file %s',
            \'renfail': 'Failed to move file %s to %s',
            \ 'uchngs': 'Found changes done manually. Resetting buffer, '.
            \           'please retry.',
            \ 'noundo': 'Your vim is too old, thus undo is not supported. '.
            \           'Update to version of Vim that has undotree() '.
            \           'function available',
            \ 'recnof': 'No files were selected for commiting',
            \   'norm': 'Can’t remove file %s as it was not added',
            \   'noad': 'Can’t add file %s as it is already included',
            \'noutree': 'No such item in saved undo tree. '.
            \           'If you can reproduce this error file a bug report',
            \'tooundo': 'Undone too much changes and cannot redo',
            \ 'undona': "Can’t undo changes. Possible reasons:\n".
            \           "  1. You did some changes manually and thus buffer ".
            \                "was reset\n".
            \           "  2. You edited a file which discards undo ".
            \                "information unless g:aurum_fullundo is set",
            \ 'redona': "Can’t redo changes. Possible reasons:\n".
            \           "  1. You did some changes manually and thus buffer ".
            \                "was reset\n".
            \           "  2. You edited a file which discards undo ".
            \                "information unless g:aurum_fullundo is set",
        \}
"▶1 commitvimdiffcb
function s:F.commitvimdiffcb(file, bvar, hex)
    let [lwnr, rwnr, swnr]=s:F.getwnrs()

    execute lwnr.'wincmd w'
    let file=s:_r.os.path.join(a:bvar.repo.path, a:file)
    let existed=bufexists(file)
    execute 'silent edit' fnameescape(file)
    if !existed
        setlocal bufhidden=wipe
    endif
    diffthis

    execute rwnr.'wincmd w'
    let existed=s:_r.run('silent edit', 'file', a:bvar.repo, a:hex, a:file)
    if !existed
        setlocal bufhidden=wipe
    endif
    diffthis

    execute lwnr.'wincmd w'
endfunction
"▶1 commitfindwindow
function s:F.commitfindwindow()
    let [lwnr, rwnr, swnr]=s:F.getwnrs()
    execute lwnr.'wincmd w'
    return 1
endfunction
"▶1 write
function s:F.write(bvar)
    call feedkeys("\<C-\>\<C-n>:call ".
            \      "call(<SNR>".s:_sid."_Eval('s:F.runstatmap'), ".
            \           "['commit', ".expand('<abuf>')."], {})\n","n")
    call map(copy(s:_r.cache.allkeys), 's:_r.cache.wipe(v:val)')
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
            \'} '.
            \'+ '.s:_r.cmdutils.comp.file, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(opts, ...)
    if !empty(filter(range(1, tabpagenr('$')),
                \    'gettabvar(v:val, "aurecid") is# "AuRecordTab"'))
        call s:_f.throw('recex')
    endif
    let files=copy(a:000)
    if !empty(files) && a:opts.repo is# ':'
        let repo=s:_r.cmdutils.checkedgetrepo(s:_r.os.path.dirname(files[0]))
    else
        let repo=s:_r.cmdutils.checkedgetrepo(a:opts.repo)
    endif
    call map(files, 'repo.functions.reltorepo(repo, v:val)')
    tabnew
    setlocal bufhidden=wipe
    let t:aurecid='AuRecordTab'
    let w:aurecid='AuRecordLeft'
    rightbelow vsplit
    let w:aurecid='AuRecordRight'
    let sopts={'record': 1}
    if !empty(files)
        let sopts.files=files
    endif
    let height=s:_f.getoption('recheight')
    if height<=0
        let height=winheight(0)/5
    endif
    call s:_r.run('silent botright '.height.'split', 'status', repo, sopts)
    setlocal bufhidden=wipe
    let w:aurecid='AuRecordStatus'
    setlocal nomodifiable
    call s:_f.mapgroup.map('AuRecord', bufnr('%'))
    let bvar=s:_r.bufvars[bufnr('%')]
    " 0: not included, unmodified
    " 1: not included,   modified
    " 2:     included, unmodified
    " 3:     included,   modified
    let bvar.statuses=repeat([0], len(bvar.types))
    let bvar.prevct=b:changedtick
    let bvar.reset=0
    let bvar.backupfiles={}
    let bvar.filesbackup={}
    let bvar.newfiles={}
    let bvar.lines=map(copy(bvar.chars), 'v:val." ".bvar.files[v:key]')
    let bvar.swheight=height
    let bvar.startundo=s:F.curundo()
    let bvar.recopts=extend(copy(a:opts), {'repo': repo})
    let bvar.bufnr=bufnr('%')
    let bvar.oldbufs={}
    let bvar.bwfunc=s:F.unload
    let bvar.getwnrs=s:F.getwnrs
    let bvar.recrunmap=s:F.runstatmap
    let bvar.write=s:F.write
    let bvar.savedopts={'undolevels': &undolevels,
                \        'scrollopt': &scrollopt,
                \        'autowrite': &autowrite,
                \     'autowriteall': &autowriteall,
                \         'autoread': &autoread,}
    let bvar.fullundo=(s:hasundo && s:_f.getoption('fullundo'))
    if bvar.fullundo
        let bvar.undotree={bvar.startundo : {}}
    endif
    setglobal noautowrite noautowriteall noautoread
    setlocal noreadonly buftype=acwrite
    augroup AuRecordVimLeave
        execute 'autocmd! VimLeave * '.
                    \   ':if has_key(s:_r.bufvars,'.bvar.bufnr.')'.
                    \   '|  call s:F.unload(s:_r.bufvars.'.bvar.bufnr.')'.
                    \   '|endif'
    augroup END
    if empty(bvar.chars)
        bwipeout!
    endif
endfunction
"▶1 curundo :: () → UInt
if s:hasundo
    function s:F.curundo()
        return undotree().seq_cur
    endfunction
else
    function s:F.curundo()
        return 0
    endfunction
endif
"▶1 reset
function s:F.reset(bvar)
    for idx in range(0, len(a:bvar.lines)-1)
        call setline(idx+1, s:statchars[a:bvar.statuses[idx]].a:bvar.lines[idx])
    endfor
    let a:bvar.prevct=b:changedtick
    let a:bvar.reset=1
    if s:hasundo
        let a:bvar.startundo=s:F.curundo()
        let savedundolevels=&undolevels
        setglobal undolevels=-1
        execute "normal! A \<BS>\e"
        let &undolevels=savedundolevels
        if a:bvar.fullundo
            let a:bvar.undotree={a:bvar.startundo : {}}
        endif
    endif
endfunction
"▶1 supdate
function s:F.supdate(bvar, prevundo)
    if b:changedtick!=a:bvar.prevct
        let a:bvar.prevct=b:changedtick
        if a:bvar.reset
            let a:bvar.reset=0
        endif
        let curundo=s:F.curundo()
        if              a:bvar.fullundo
                    \&& has_key(a:bvar.undotree, a:prevundo)
                    \&& curundo!=a:prevundo
                    \&& !has_key(a:bvar.undotree, curundo)
            let a:bvar.undotree[curundo]=copy(a:bvar.undotree[a:prevundo])
        endif
    endif
    setlocal nomodifiable
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
    let sbvar=get(a:bvar, 'sbvar', a:bvar)
    let sbuf=get(a:bvar, 'sbuf', -1)
    if sbuf isnot 0 && bufexists(sbuf)
        unlet sbvar.bwfunc
        execute 'bwipeout!' sbuf
    endif
    for [o, val] in items(sbvar.savedopts)
        execute 'let &g:'.o.'=val'
    endfor
    if bufexists(sbvar.bufnr)
        call setbufvar(sbvar.bufnr, '&modified', 0)
    endif
    if exists('t:aurecid') && t:aurecid is# 'AuRecordTab'
        unlet t:aurecid
        if tabpagenr('$')>1
            tabclose!
        else
            let wlist=range(1, winnr('$'))
            while !empty(wlist)
                for wnr in wlist
                    call remove(wlist, 0)
                    if !empty(getwinvar(wnr, 'aurecid'))
                        execute wnr.'wincmd w'
                        close!
                        let wlist=range(1, winnr('$'))
                        break
                    endif
                endfor
            endwhile
        endif
    else
        return
    endif
    let backupfiles=copy(sbvar.backupfiles)
    let newfiles=copy(sbvar.newfiles)
    call filter(backupfiles, 'filereadable(v:key)')
    call filter(newfiles,    'filereadable(v:key)')
    call map(backupfiles, 's:F.restorebackup(v:val, v:key)')
    call map(newfiles,    's:F.restorebackup(v:key,   0  )')
    for [buf, savedopts] in items(filter(sbvar.oldbufs, 'bufexists(v:key)'))
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
    let lwnr=0
    let rwnr=0
    let swnr=0
    for wnr in range(1, winnr('$'))
        let wid=getwinvar(wnr, 'aurecid')
        if wid is# 'AuRecordLeft'
            let lwnr=wnr
        elseif wid is# 'AuRecordRight'
            let rwnr=wnr
        elseif wid is# 'AuRecordStatus'
            let swnr=wnr
        endif
    endfor
    if lwnr is 0 || rwnr is 0
        execute swnr.'wincmd w'
        let bvar=s:_r.bufvars[bufnr('%')]
        if winnr('$')>1
            only!
        endif
        topleft new
        setlocal bufhidden=wipe
        let w:aurecid='AuRecordLeft'
        let lwnr=winnr()
        rightbelow vnew
        setlocal bufhidden=wipe
        let w:aurecid='AuRecordRight'
        let rwnr=winnr()
        wincmd j
        let swnr=winnr()
        execute 'resize' bvar.swheight
    endif
    return [lwnr, rwnr, swnr]
endfunction
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
    if getwinvar(0, 'aurecid') is# 'AuRecordLeft'
        call s:_f.mapgroup.map('AuRecordLeft', bufnr('%'))
    endif
endfunction
let s:_augroups+=['AuRecordLeft']
"▶1 srestore
function s:F.srestore(bvar)
    let sbuf=get(a:bvar, 'sbuf', -1)
    if !bufexists(sbuf)
        return s:F.unload(get(a:bvar, sbuf, 0))
    endif
    let sbvar=a:bvar.sbvar
    execute 'silent botright sbuffer' sbuf
    execute 'resize' sbvar.swheight
    call winrestview(a:bvar.winview)
    redraw!
    let w:aurecid='AuRecordStatus'
    setlocal bufhidden=wipe
    return 1
endfunction
"▶1 restorefiles :: bvar, sline::UInt, eline::UInt → + FS
function s:F.restorefiles(bvar, sline, eline)
    for file in map(range(a:sline, a:eline), 'a:bvar.lines[v:val-1][2:]')
        let fullpath=s:_r.os.path.join(a:bvar.repo.path, file)
        let backupfile=a:bvar.filesbackup[fullpath]
        call s:F.restorebackup(fullpath, backupfile)
    endfor
endfunction
"▶1 undoup :: bvar → + bvar
function s:F.undoup(bvar)
    for line in range(1, line('$'))
        let a:bvar.statuses[line-1]=stridx(s:statchars, getline(line)[0])
    endfor
    if a:bvar.fullundo
        let curundo=s:F.curundo()
        if !has_key(a:bvar.undotree, curundo)
            call s:F.reset(a:bvar)
            call s:_f.throw('noutree')
        endif
        for [file, contents] in items(a:bvar.undotree[curundo])
            if contents is 0 && filereadable(file)
                call delete(file)
            else
                call writefile(contents, file, 'b')
            endif
            unlet contents
        endfor
    endif
endfunction
"▶1 undoleafwrite :: bvar, lines::[String], path → + bvar, FS
function s:F.undoleafwrite(bvar, lines, file)
    if a:file is# a:bvar.file
        let a:bvar.undoleaf[a:bvar.fullpath]=a:lines
    endif
    return a:bvar.ewrite(a:bvar, a:lines, a:file)
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
    call s:F.unload(a:bvar)
    return 0
endfunction
"▶2 sactions.undo
function s:F.sactions.undo(action, bvar, buf)
    execute 'silent normal! '.v:count1.'u'
    let curundo=s:F.curundo()
    if curundo<a:bvar.startundo
        while curundo<a:bvar.startundo
            let pundo=curundo
            silent redo
            let curundo=s:F.curundo()
            if curundo==pundo
                call s:_f.throw('tooundo')
                call s:F.reset(a:bvar)
                setlocal nomodifiable
                return 0
            endif
        endwhile
    endif
    return 1
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
            if has_key(a:bvar.filesbackup, fullpath)
                let backupfile=a:bvar.filesbackup[fullpath]
            else
                let backupfile=fullpath.'.orig'
                let i=0
                while s:_r.os.path.exists(backupfile)
                    let backupfile=fullpath.'.'.i.'.orig'
                    let i+=1
                endwhile
            endif
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
        if a:bvar.fullundo
            let prevundo=s:F.curundo()
            let line=line('.')
            call setline(line, s:statchars[status].a:bvar.lines[line-1])
            call s:F.supdate(a:bvar, prevundo)
            let curundo=s:F.curundo()
        else
            call s:F.reset(a:bvar)
        endif
        setlocal nomodifiable
        execute lwnr.'wincmd w'
        call s:F.edit(a:bvar, 'aurum://edit:'.fullpath, 0)
        if a:bvar.fullundo
            let ebvar=s:_r.bufvars[bufnr('%')]
            let undoleaf=a:bvar.undotree[curundo]
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
                if a:bvar.fullundo
                    let undoleaf[fullpath]=0
                    let undoleaf[backupfile]=readfile(backupfile, 'b')
                    let oundoleafpart={fullpath   : copy(undoleaf[backupfile]),
                                \      backupfile : 0}
                    call map(a:bvar.undotree,
                                \'extend(v:val, oundoleafpart, "keep")')
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
        let r=s:_r.commit.commit(a:bvar.repo, a:bvar.recopts, files,
                    \            a:bvar.status, keys(s:ntypes), 'silent edit',
                    \            {'vimdiffcb':  s:F.commitvimdiffcb,
                    \             'findwindow': s:F.commitfindwindow,
                    \             'bwfunc':     s:F.srestore,
                    \             'sbvar':      a:bvar,
                    \             'sbuf':       a:buf,
                    \             'winview':    winview,})
    finally
        if bufwinnr(a:buf)!=-1
            call setbufvar(a:buf, '&bufhidden', 'wipe')
        endif
    endtry
    if r
        call s:F.unload(a:bvar)
    else
        let w:aurecid='AuRecordCommitMessage'
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
let s:uactions=['undo', 'redo', 'earlier', 'later']
function s:F.runstatmap(action, ...)
    "▶2 buf, bvar, reset
    let buf=get(a:000, 0, bufnr('%'))
    let bvar=s:_r.bufvars[buf]
    setlocal modifiable
    if !a:0 && b:changedtick!=bvar.prevct
        if bvar.fullundo && has_key(bvar.undotree, s:F.curundo())
            call s:F.undoup(bvar)
        else
            call s:_f.warn('uchngs')
            call s:F.reset(bvar)
            setlocal nomodifiable
            return
        endif
    endif
    "▶2 undo
    let isundo=(index(s:uactions, a:action)!=-1)
    if isundo
        if !s:hasundo
            call s:_f.warn('noundo')
            return
        endif
        if bvar.reset
            setlocal nomodifiable
            call s:_f.warn(a:action.'na')
            return
        endif
    endif
    let prevundo=s:F.curundo()
    "▶2 action
    if s:F.sactions[a:action](a:action, bvar, buf)
        if bufnr('%')==buf
            if isundo && s:F.curundo()!=prevundo
                call s:F.undoup(bvar)
            endif
            call s:F.supdate(bvar, prevundo)
        endif
    endif
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
            setlocal modifiable
            let prevundo=s:F.curundo()
            call setline(fidx+1, s:statchars[0].sbvar.lines[fidx])
            call s:F.supdate(sbvar, prevundo)
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
            setlocal modifiable
            let prevundo=s:F.curundo()
            call setline(fidx+1, s:statchars[sbvar.statuses[fidx]].
                        \        sbvar.lines[fidx])
            call s:F.supdate(sbvar, prevundo)
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
