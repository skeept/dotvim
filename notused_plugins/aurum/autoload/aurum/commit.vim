"▶1 
scriptencoding utf-8
execute frawor#Setup('1.3', {'@/resources': '0.0',
            \                '@/functions': '0.1',
            \                  '@/options': '0.0',
            \                       '@/os': '0.0',
            \                      '@/fwc': '0.0',
            \             '@%aurum/status': '1.2',
            \           '@%aurum/cmdutils': '4.3',
            \            '@%aurum/bufvars': '0.0',
            \            '@%aurum/vimdiff': '1.1',
            \               '@%aurum/edit': '1.0',
            \              '@%aurum/cache': '2.4',})
let s:_messages={
            \'emptmsg': 'Message must contain at least one non-blank character',
            \'nocfile': 'Unsure what should be commited',
            \'nocread': 'Cannot read aurum://commit',
            \  'nocom': 'Nothing to commit',
        \}
let s:_options={
            \'remembermsg':         {'default': 1, 'filter': 'bool'},
            \'bufleaveremembermsg': {'default': 1, 'filter': 'bool'},
            \'commitautoopendiff':  {'default': 0, 'filter': 'bool'},
            \'commitinfowincmd':    {
            \   'default': 'largest_adjacent',
            \   'checker': 'match /\v^%([jkhlwWtbpvs]|'.
            \                          'largest%(_%(vertical|'.
            \                                      'horizontal|'.
            \                                      'adjacent))?)$/'},
        \}
"▶1 parsedate string → [year, month, day, hour, minute, second]
" Date must have one of the following formats (XXX it is not validated):
" %Y-%m-%d %H:%M:%S
" %Y-%m-%d %H:%M
" %Y-%m-%d
"    %m-%d %H:%M:%S
"    %m-%d %H:%M
"    %m-%d
"          %H:%M:%S
"          %H:%M
function s:F.parsedate(str)
    let parts=split(a:str)
    if len(parts)==1
        if stridx(parts[0], ':')==-1
            let day=parts[0]
            let time=0
        else
            let day=0
            let time=parts[0]
        endif
    else
        let [day, time]=parts
    endif
    let r=[]
    if day is# 0
        let r+=[0, 0, 0]
    else
        let parts=split(day, '-')
        if len(parts)==2
            let r+=[0]
        else
            let year=remove(parts, 0)
            if len(year)<=2
                let y=str2nr(year)
                let cy=str2nr(strftime('%y'))
                let c=str2nr(strftime('%Y')[:-3])
                if y<=cy
                    let year=''.((c*100)+y)
                else
                    let year=''.(((c-1)*100)+y)
                endif
            endif
            let r+=[year]
        endif
        let r+=map(parts, 'len(v:val)==1 ? "0".v:val : v:val')
    endif
    if time is# 0
        let r+=[0, 0, 0]
    else
        let parts=map(split(time, ':'), 'len(v:val)==1 ? "0".v:val : v:val')
        let r+=parts
        if len(parts)==2
            let r+=[0]
        endif
    endif
    return r
endfunction
"▶1 vimdiffcb
function s:F.vimdiffcb(file, bvar, hex)
    execute 'silent tabnew'
                \ fnameescape(s:_r.os.path.join(a:bvar.repo.path, a:file))
    return s:_r.vimdiff.split([['file', a:bvar.repo, a:hex, a:file]], 0)
endfunction
"▶1 findwindow :: () -> winexisted::Bool
function s:F.winsize(wnr)
    let width=winwidth(a:wnr)
    return (width>80 ? 80 : width)*winheight(a:wnr)
endfunction
function s:F.winsplit()
    if winwidth(0)>=&textwidth*2
        execute 'silent' (winwidth(0)-&textwidth)                'vsplit'
    else
        execute 'silent' (max([winheight(0)-5, winheight(0)/2]))  'split'
    endif
    return 0
endfunction
function s:F.findwindow()
    let wcommand=s:_f.getoption('commitinfowincmd')
    if len(wcommand)==1
        let commit_mark=reltime()
        let wscope=w:
        let w:aurum_commit_mark=commit_mark
        try
            execute 'wincmd' wcommand
            if              exists('w:aurum_commit_mark')
                        \&& w:aurum_commit_mark is# commit_mark
                return s:F.winsplit()
            endif
            return (stridx('sv', wcommand)==-1)
        finally
            call remove(wscope, 'aurum_commit_mark')
        endtry
    elseif wcommand is# 'largest'
        let maxsize=0
        let mwnr=0
        for wnr in filter(range(1, winnr('$')), 'v:val!='.winnr())
            let size=s:F.winsize(a:wnr)
            if size>maxsize
                let maxsize=size
                let mwnr=a:wnr
            endif
        endfor
        if mwnr
            execute mwnr.'wincmd w'
            return 1
        else
            return s:F.winsplit()
        endif
    else
        let maxsize=0
        let mwcmd=0
        let wcmds={
                    \'vertical':   ['j', 'k'],
                    \'horizontal': ['h', 'l'],
                    \'adjacent':   ['h', 'l', 'j', 'k'],
                \}[wcommand[8:]]
        let curwin=winnr()
        for wcmd in wcmds
            execute 'wincmd' wcmd
            if winnr()!=curwin
                let size=s:F.winsize(0)
                wincmd p
                if size>maxsize
                    let maxsize=size
                    let mwcmd=wcmd
                endif
            endif
        endfor
        if mwcmd is 0
            return s:F.winsplit()
        else
            execute 'wincmd' mwcmd
            return 1
        endif
    endif
endfunction
"▶1 commit :: repo, opts, files, status, types[, cmd[, bvarpart]] → + repo
let s:defdate=['strftime("%Y")',
            \  'strftime("%m")',
            \  'strftime("%d")',
            \  '"00"',
            \  '"00"',
            \  '"00"']
let s:statmsgs={
            \'added': 'Added',
            \'removed': 'Removed',
            \'modified': 'Modified',
        \}
let s:statmsgs.unknown=s:statmsgs.added
let s:statmsgs.deleted=s:statmsgs.removed
" TODO Investigate why closing commit buffer on windows consumes next character
" XXX Do not change names of options used here, see :AuRecord
function s:F.commit(repo, opts, files, status, types, ...)
    let user=''
    let date=''
    let message=''
    let cb=get(a:opts, 'closebranch', 0)
    let revstatus={}
    call map(filter(copy(a:status), 'index(a:types, v:key)!=-1'),
                \'map(copy(v:val),"extend(revstatus,{v:val : ''".v:key."''})")')
    if !empty(a:files)
        call filter(revstatus, 'index(a:files, v:key)!=-1')
    endif
    if empty(revstatus)
        call s:_f.throw('nocom')
    endif
    for key in filter(['user', 'date', 'message'], 'has_key(a:opts, v:val)')
        let l:{key}=a:opts[key]
    endfor
    "▶2 Normalize date
    if has_key(a:opts, 'date')
        let date=substitute(date, '_', ' ', '')
        let dparts=map(s:F.parsedate(date), 'v:val is 0 ? '.
                    \                               'eval(s:defdate[v:key]) : '.
                    \                               'v:val')
        let date=join(dparts[:2], '-').' '.join(dparts[3:], ':')
    endif
    "▲2
    if empty(message)
        call s:_r.run(((a:0 && a:1 isnot 0)? a:1 : 'silent new'),
                    \ 'commit', a:repo, user, date, cb, a:files)
        let bvar=s:_r.bufvars[bufnr('%')]
        if a:0>1 && a:2 isnot 0
            call extend(bvar, a:2)
        endif
        let bvar.revstatus=revstatus
        "▶2 Add previous message
        if exists('g:AuPreviousRepoPath') &&
                    \   g:AuPreviousRepoPath is# a:repo.path &&
                    \exists('g:AuPreviousTip') &&
                    \   g:AuPreviousTip is# a:repo.functions.gettiphex(a:repo)&&
                    \exists('g:AuPreviousCommitMessage')
            call setline('.', split(g:AuPreviousCommitMessage, "\n", 1))
            call cursor(line('$'), col([line('$'), '$']))
            unlet g:AuPreviousRepoPath g:AuPreviousTip g:AuPreviousCommitMessage
        endif
        "▶2 Add comment
        let fmessage=[]
        for [file, state] in items(revstatus)
            let fmessage+=['# '.s:statmsgs[state].' '.file]
        endfor
        call sort(fmessage)
        call append('.', fmessage)
        startinsert!
        "▶2 Open diff
        if s:_f.getoption('commitautoopendiff')
            let winexisted=bvar.findwindow()
            if winexisted
                let prevbuf=bufnr('%')
            else
                let prevbuf=0
            endif
            let existed=s:_r.mrun('silent edit', 'diff', bvar.repo, 0, 0,
                        \                                keys(revstatus), {})
            if !existed
                setlocal bufhidden=wipe
            endif
            let dbuf=bufnr('%')
            let dtabpagenr=tabpagenr()
            silent! %foldopen!
            wincmd p
            augroup AuCommitAutoCloseDiff
                execute 'autocmd BufWipeOut <buffer> '.
                            \':call s:F.closediffbuf('.dbuf.', '.
                            \                          dtabpagenr.', '.
                            \                          prevbuf.', '
                            \                          existed.', '.
                            \                          winexisted.')'
            augroup END
        endif
        "▲2
        return 0
    else
        call a:repo.functions.commit(a:repo, message, a:files, user, date, cb)
        return 1
    endif
endfunction
let s:_augroups+=['AuCommitAutoCloseDiff']
"▶1 closediffbuf
function s:F.closediffbuf(dbuf, dtabpagenr, prevbuf, existed, winexisted)
    if bufexists(a:dbuf) && count(tabpagebuflist(a:dtabpagenr), a:dbuf)==1
        let cmds=[]
        let switchcmds=[]
        if (a:prevbuf && bufexists(a:prevbuf)) || a:winexisted
            let curtab=tabpagenr()
            if curtab!=a:dtabpagenr
                let cmds+=['tabnext '.a:dtabpagenr]
                call insert(switchcmds, 'tabnext '.curtab)
            endif
            let cmds+=['execute bufwinnr('.a:dbuf.') "wincmd w"']
            call insert(switchcmds, 'wincmd p')
            if a:prevbuf && bufexists(a:prevbuf)
                let cmds+=['buffer '.a:prevbuf]
            else
                let cmds+=['bnext']
            endif
        endif
        if !a:existed
            let cmds+=['if bufexists('.a:dbuf.')', 'bwipeout '.a:dbuf, 'endif']
        endif
        let cmds+=switchcmds
        return feedkeys("\<C-\>\<C-n>:".join(cmds, '|')."\n\<C-l>", 'n')
    endif
endfunction
"▶1 savemsg :: message, bvar → + g:
function s:F.savemsg(message, bvar)
    if a:message!~#"[^[:blank:]\n]"
        return
    endif
    let g:AuPreviousCommitMessage=a:message
    let g:AuPreviousTip=a:bvar.repo.functions.gettiphex(a:bvar.repo)
    let g:AuPreviousRepoPath=a:bvar.repo.path
endfunction
"▶1 finish :: bvar → + bvar.repo
function s:F.finish(bvar)
    let message=join(filter(getline(1, '$'), 'v:val[0] isnot# "#"'), "\n")
    if message!~#"[^[:blank:]\n]"
        call s:_f.throw('emptmsg')
    endif
    if s:_f.getoption('remembermsg')
        call s:F.savemsg(message, a:bvar)
    endif
    call a:bvar.repo.functions.commit(a:bvar.repo, message, a:bvar.files,
                \                     a:bvar.user, a:bvar.date,
                \                     a:bvar.closebranch)
    call map(copy(s:_r.cache.allkeys), 's:_r.cache.wipe(v:val)')
    let a:bvar.did_message=1
    if has_key(a:bvar, 'sbvar')
        call a:bvar.bwfunc(a:bvar)
        let a:bvar.bwfunc=a:bvar.sbvar.bwfunc
    endif
    call feedkeys("\<C-\>\<C-n>:bwipeout!\n\<C-l>")
endfunction
"▶1 commfunc
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'{  repo '.s:_r.cmdutils.comp.repo.
            \' *?type      (either (in [modified added '.
            \                          'removed deleted '.
            \                          'unknown all] '.
            \                         '~start,'.
            \                      'match /\v^[MARDU?!]+$/))'.
            \'  ?message   type ""'.
            \'  ?user      type ""'.
            \'  ?date      match /\v%(^%(\d*\d\d-)?'.
            \                         '%(%(1[0-2]|0?[1-9])-'.
            \                           '%(3[01]|0?[1-9]|[12]\d)))?'.
            \                      '%(%(^|[ _])%(2[0-3]|[01]\d)'.
            \                                 '\:[0-5]\d'.
            \                                 '%(\:[0-5]\d)?)?$/'.
            \' !?closebranch'.
            \'}'.
            \'+ '.s:_r.cmdutils.comp.file, 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
function s:_aufunctions.cmd.function(opts, ...)
    let rrfopts=copy(a:opts)
    let hasall=index(a:000, 'all')!=-1
    if a:0 && !hasall
        let rrfopts.files=a:000
    endif
    let [repo, rev, files]=s:_r.cmdutils.getrrf(rrfopts,
                \                               ((a:0)?(0):('nocfile')),
                \                               'getfiles')[1:]
    call s:_r.cmdutils.checkrepo(repo)
    let status=repo.functions.status(repo)
    "▶2 Get file list
    let types=['modified', 'added', 'removed']
    if hasall
        unlet files
        let files=[]
    elseif a:0
        if has_key(a:opts, 'type')
            let types=s:_r.status.parseshow(a:opts.type)
            call filter(types, 'v:val isnot# "clean" && v:val isnot# "ignored"')
        endif
        let filepats=map(filter(copy(a:000), 'v:val isnot# ":"'),
                    \    's:_r.globtopat('.
                    \    'repo.functions.reltorepo(repo, v:val))')
        let statfiles={}
        for [type, sfiles] in items(status)
            if index(types, type)==-1
                continue
            endif
            let curfiles=[]
            for pattern in filepats
                let curfiles+=filter(copy(sfiles), 'v:val=~#pattern')
            endfor
            if !empty(curfiles)
                let statfiles[type]=curfiles
                let files+=curfiles
            endif
        endfor
    elseif files is 0
        call s:_f.throw('nocfile')
    endif
    "▲2
    return s:F.commit(repo, a:opts, files, status, types)
endfunction
"▶1 aurum://commit
let s:commit={'arguments': 3,
            \  'listargs': 1,
            \'modifiable': 1,
            \  'filetype': 'aurumcommit',
            \}
function s:F.bufleave()
    let bvar=s:_r.bufvars[+expand('<abuf>')]
    if !bvar.did_message && s:_f.getoption('bufleaveremembermsg')
        let message=join(filter(getline(1,'$'),'v:val[0] isnot# "#"'), "\n")
        call s:F.savemsg(message, bvar)
    endif
endfunction
function s:commit.function(read, repo, user, date, cb, files)
    if a:read
        call s:_f.throw('nocread')
    endif
    augroup AuCommit
        autocmd! BufLeave <buffer> :call s:F.bufleave()
    augroup END
    return {'user': a:user, 'date': a:date, 'files': a:files,
                \'closebranch': !!a:cb, 'write': s:F.finish,
                \'did_message': 0, 'vimdiffcb': s:F.vimdiffcb,
                \'findwindow': s:F.findwindow,}
endfunction
let s:_augroups+=['AuCommit']
function s:commit.write(lines, repo, user, date, cb, files)
    let message=join(filter(copy(a:lines), 'v:val[0] isnot# "#"'), "\n")
    call a:repo.functions.commit(a:repo, message, a:files, a:user, a:date, a:cb)
    call map(copy(s:_r.cache.allkeys), 's:_r.cache.wipe(v:val)')
endfunction
call s:_f.newcommand(s:commit)
"▶1 Post resource
call s:_f.postresource('commit', {'commit': s:F.commit,
            \                     'finish': s:F.finish,})
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
