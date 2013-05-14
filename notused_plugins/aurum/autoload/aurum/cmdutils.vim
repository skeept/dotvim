"▶1
scriptencoding utf-8
execute frawor#Setup('4.3', {'@/resources': '0.0',
            \                       '@/os': '0.0',
            \               '@%aurum/repo': '5.0',
            \               '@%aurum/edit': '1.0',
            \            '@%aurum/bufvars': '0.0',})
let s:_messages={
            \  'nrepo': 'Failed to find a repository',
            \'noafile': 'Failed to deduce which file to annotate',
            \'noffile': 'Failed to deduce which file to show',
            \ 'nocurf': 'Failed to deduce which file was meant',
            \  'norev': 'Failed to get revision',
            \'nocfile': 'Unsure what should be commited',
        \}
let s:r={}
"▶1 globescape :: path → glob
function s:r.globescape(path)
    return escape(a:path, '\*?[]{}')
endfunction
"▶1 getdifffile :: bvar + cursor → file
function s:r.getdifffile(bvar)
    if len(a:bvar.files)==1
        return a:bvar.files[0]
    endif
    let diffre=a:bvar.repo.functions.diffre(a:bvar.repo, a:bvar.opts)
    let lnr=search(diffre, 'bcnW')
    if !lnr
        return 0
    endif
    return a:bvar.repo.functions.diffname(a:bvar.repo, getline(lnr), diffre,
                \                         a:bvar.opts)
endfunction
"▶1 getfile :: [path] → path
function s:r.getfile(files)
    let file=0
    if !empty(a:files)
        if len(a:files)==1
            let file=a:files[0]
        else
            let choice=inputlist(['Select file (0 to cancel):']+
                        \               map(copy(a:files),
                        \                   '(v:key+1).". ".v:val'))
            if choice
                let file=a:files[choice-1]
            endif
        endif
    endif
    return file
endfunction
"▶1 rrf buffer functions :: bvar, opts, act, failmsg → scope
let s:rrf={}
"▶2 rrf.file : bvar → (repo, rev, file)
function s:rrf.file(bvar, opts, act, failmsg)
    return {'hasbuf': 1,
           \  'repo': a:bvar.repo,
           \   'rev': a:bvar.rev,
           \  'file': a:bvar.file,}
endfunction
"▶2 rrf.copy : bvar → (file), file → (repo), 0 → (rev)
function s:rrf.copy(bvar, opts, act, failmsg)
    let r={}
    if a:act is# 'getfile'
        let r.file=a:bvar.file
    else
        let r.repo=s:_r.repo.get(s:_r.os.path.dirname(a:bvar.file))
        if r.repo isnot 0 && a:act isnot# 'getrr'
            let r.file=r.repo.functions.reltorepo(r.repo, a:bvar.file)
        endif
    endif
    let r.rev=0
    let r.hasbuf=1
    return r
endfunction
"▶2 rrf.edit : same as copy
let s:rrf.edit=s:rrf.copy
"▶2 rrf.status : bvar → (repo, rev), . → (file)
function s:rrf.status(bvar, opts, act, failmsg)
    let r={}
    let r.repo=a:bvar.repo
    let  r.rev=get(a:bvar.opts, 'rev1', 0)
    if empty(a:bvar.files)
        if a:failmsg isnot 0
            call s:_f.throw(a:failmsg)
        endif
    elseif a:act is# 'getfiles'
        let r.files=a:bvar.files
    else
        let r.file=a:bvar.files[line('.')-1]
    endif
    if a:act is# 'annotate' || a:act is# 'open'
        topleft new
    endif
    return r
endfunction
"▶2 rrf.diff : bvar → (repo, rev, file(s))
function s:rrf.diff(bvar, opts, act, failmsg)
    let r={}
    let r.repo=a:bvar.repo
    let  r.rev=empty(a:bvar.rev2) ? a:bvar.rev1 : a:bvar.rev2
    " XXX Maybe it should pull in all filenames instead when act='getfiles'?
    let r.file=s:r.getdifffile(a:bvar)
    if r.file is 0 && a:failmsg isnot 0 && a:act isnot# 'getrr'
        return 0
    endif
    if a:act is# 'annotate' || a:act is# 'open'
        leftabove vnew
    endif
    return r
endfunction
"▶2 rrf.commit : bvar → (repo, file(s))
function s:rrf.commit(bvar, opts, act, failmsg)
    let r={}
    let r.repo=a:bvar.repo
    if a:act is# 'getfiles'
        let r.files=a:bvar.files
    elseif a:act isnot# 'getsilent' && a:act isnot# 'getrr'
        let r.file=s:r.getfile(a:bvar.files)
        if r.file is 0 && a:failmsg isnot 0
            return 0
        endif
        if a:act is# 'annotate' || a:act is# 'open'
            topleft new
        endif
    endif
    return r
endfunction
"▶2 rrf.annotate : bvar → (repo), . → (rev, file)
function s:rrf.annotate(bvar, opts, act, failmsg)
    let r={}
    let r.repo=a:bvar.repo
    if a:act is# 'getfiles'
        let r.file=a:bvar.file
    else
        let r.file=a:bvar.files[line('.')-1]
        if !has_key(a:opts, 'rev')
            let r.rev=a:bvar.revisions[line('.')-1]
            if r.rev is# a:bvar.rev
                if a:act isnot# 'annotate'
                    " Don't do the following if we are not annotating
                elseif has_key(a:bvar, 'annbuf') &&
                            \bufwinnr(a:bvar.annbuf)!=-1
                    execute bufwinnr(a:bvar.annbuf).'wincmd w'
                else
                    " FIXME It does not look like a proper place for doing this 
                    "       job. More, it looks like some necessary autocommands 
                    "       doing cleanup are missing.
                    setlocal scrollbind cursorbind nowrap
                    call s:_r.mrun('silent rightbelow vsplit',
                                \  'file', r.repo, r.rev, r.file)
                    let a:bvar.annbuf=bufnr('%')
                    setlocal scrollbind cursorbind nowrap
                    syncbind
                endif
                return 0
            endif
        endif
        if a:act is# 'annotate' || a:act is# 'open'
            if winnr('$')>1
                close
            endif
            if has_key(a:bvar, 'annbuf') && bufwinnr(a:bvar.annbuf)!=-1
                execute bufwinnr(a:bvar.annbuf).'wincmd w'
            endif
        endif
    endif
    return r
endfunction
"▶2 rrf.log : bvar → repo, . → (rev), 0 → (file)
function s:rrf.log(bvar, opts, act, failmsg)
    return {'repo': a:bvar.repo,
           \ 'rev': a:bvar.getblock(a:bvar)[2],
           \'file': 0,}
endfunction
"▲2
"▶1 getrrf :: opts, failmsg, act + buf → (hasbuf, repo, rev, file)
" Actions: getfile   : Used to get trivial filename only. Non-last arguments 
"                      should be ignored
"          getfiles  : Used to get a list of files (if user specified no 
"                      patterns), or, at least, repository (but not revision)
"          get       : Used to get repo, revision and file. If it is not 
"                      aurum:// buffer, revision is zero
"          getsilent : Like get, but won’t prompt for a file in aurum://commit 
"                      buffers
"          getrr     : Gets repository and revision, but not file
" TODO Move open and annotate actions out of here.
"          open      : Prepare a window for opening file as well
"          annotate  : Like open, except for aurum://annotate when current 
"                      revision is the same as annotated revision. In latter 
"                      case it just switches to annotated file (or opens a new 
"                      one if it does not exist)
let s:rrffailresult=[0, 0, 0, 0]
function s:r.getrrf(opts, failmsg, act)
    let hasbuf=0
    let file=0
    "▶2 a:opts.file file → (repo?)
    if has_key(a:opts, 'file') && a:opts.file isnot# ':'
        if a:act isnot# 'getfile' && a:opts.repo is# ':'
            let repo=s:_r.repo.get(s:_r.os.path.dirname(a:opts.file))
            if repo isnot 0 && a:act isnot# 'getrr'
                let file=repo.functions.reltorepo(repo, a:opts.file)
            endif
        else
            let file=a:opts.file
        endif
        if !has_key(a:opts, 'rev')
            let rev=0
        endif
    "▶2 a:opts.files files → repo?
    elseif has_key(a:opts, 'files') && !empty(a:opts.files)
        let files=[]
        if index(a:opts.files, ':')!=-1
            let newopts=copy(a:opts)
            unlet newopts.files
            let [repo, rev, file]=s:r.getrrf(newopts, 'nocurf', 'getfile')[1:]
            if repo is 0
                unlet repo
                let repo=s:_r.repo.get(file)
            endif
            if repo isnot 0
                let file=repo.functions.reltorepo(repo, file)
            endif
            let files+=[file]
        else
            let repo=s:_r.repo.get(a:opts.files[0])
        endif
    "▶2 aurum:// buffers
    elseif has_key(s:_r.bufvars, bufnr('%')) &&
                \has_key(s:_r.bufvars[bufnr('%')], 'command')
        let bvar=s:_r.bufvars[bufnr('%')]
        if has_key(s:rrf, bvar.command)
            let res=call(s:rrf[bvar.command], [bvar,a:opts,a:act,a:failmsg], {})
            if res is 0
                return s:rrffailresult
            else
                for [var, val] in items(res)
                    let {var}=val
                    unlet val
                endfor
            endif
        elseif a:failmsg isnot 0
            call s:_f.throw(a:failmsg)
        endif
    "▶2 buf → (repo, file), (rev=0)
    elseif filereadable(expand('%'))
        if a:act is# 'getfile'
            let file=expand('%')
        else
            let repo=s:_r.repo.get(':')
            if type(repo)==type({}) && a:act isnot# 'getrr'
                let file=repo.functions.reltorepo(repo, expand('%'))
            endif
        endif
        let  rev=0
        let hasbuf=2
    "▲2
    elseif a:failmsg isnot 0
        call s:_f.throw(a:failmsg)
    endif
    "▶2 Update repository if appropriate
    if exists('repo') && exists('bvar.repo') && repo is bvar.repo
        call repo.functions.updatechangesets(repo)
    endif
    "▲2
    if a:act isnot# 'getfile'
        "▶2 repo
        if !exists('repo')
            let repo=s:_r.repo.get(a:opts.repo)
            if type(repo)==type({}) && file isnot 0
                let file=repo.functions.reltorepo(repo, file)
            endif
        endif
        "▶2 rev
        if a:act is# 'getfiles'
            let rev=0
        elseif has_key(a:opts, 'rev')
            let oldrev=0
            if exists('rev') && rev isnot 0
                let oldrev=repo.functions.getrevhex(repo, rev)
            endif
            let rev=repo.functions.getrevhex(repo, a:opts.rev)
            if hasbuf && rev isnot# oldrev
                let hasbuf=0
            endif
        elseif exists('rev')
            if rev isnot 0
                let rev=repo.functions.getrevhex(repo, rev)
            endif
        elseif a:act is# 'getrr'
            let rev=repo.functions.getworkhex(repo)
        else
            let rev=0
        endif
        "▲2
    endif
    if exists('repo') && type(repo)!=type({})
        let file=0
        let rev=0
        if a:failmsg isnot 0
            call s:_f.throw('nrepo')
        endif
    endif
    return [hasbuf, exists('repo') ? repo : 0, rev,
                \((a:act is# 'getfiles')?
                \   ((exists('files'))?
                \       (files):
                \   ((file is 0)?
                \       (0)
                \   :
                \       ([file]))):
                \   (file))]
endfunction
"▶1 checkrepo
function s:r.checkrepo(repo)
    if type(a:repo)!=type({})
        call s:_f.throw('nrepo')
    endif
    return 1
endfunction
"▶1 checkedgetrepo
function s:r.checkedgetrepo(repopath)
    let repo=s:_r.repo.get(a:repopath)
    call s:r.checkrepo(repo)
    return repo
endfunction
"▶1 closebuf :: bvar → + buf
function s:r.closebuf(bvar)
    let r=''
    if has_key(a:bvar, 'prevbuf') && bufexists(a:bvar.prevbuf)
        let r.=':buffer '.a:bvar.prevbuf."\n"
    endif
    let buf=bufnr('%')
    return r.':if bufexists('.buf.')|bwipeout '.buf."|endif\n"
endfunction
"▶1 getexsttrckdfiles
function s:r.getexsttrckdfiles(repo, ...)
    let cs=a:repo.functions.getwork(a:repo)
    let r=copy(a:repo.functions.getcsprop(a:repo, cs, 'allfiles'))
    let status=a:repo.functions.status(a:repo)
    call filter(r, 'index(status.removed, v:val)==-1 && '.
                \  'index(status.deleted, v:val)==-1')
    let r+=status.added
    if a:0 && a:1
        let r+=status.unknown
    endif
    return r
endfunction
"▶1 getaddedermvdfiles
function s:r.getaddedermvdfiles(repo)
    let status=a:repo.functions.status(a:repo)
    return status.unknown+filter(copy(status.removed),
                \         'filereadable(s:_r.os.path.join(a:repo.path, v:val))')
endfunction
"▶1 filterfiles
function s:r.filterfiles(repo, globs, files)
    if empty(a:globs)
        return []
    endif
    let r=[]
    let dirs={}
    for file in a:files
        let fsplit=split(file, '\V/')
        if empty(fsplit)
            continue
        endif
        let d=dirs
        for component in fsplit[:-2]
            let component.='/'
            if !has_key(d, component)
                let d[component]={}
            endif
            let d=d[component]
        endfor
        let d[fsplit[-1]]=1
    endfor
    unlet! d
    let patterns=map(copy(a:globs), 's:_r.globtopat('.
                \                   'a:repo.functions.reltorepo(a:repo,v:val))')
    let tocheck=map(items(dirs), '[v:val[1], v:val[0]]')
    while !empty(tocheck)
        let [d, f]=remove(tocheck, 0)
        if !empty(filter(copy(patterns), 'f=~#v:val'))
            let r+=[f]
        elseif f[-1:] is# '/'
            let tocheck+=map(items(d), '[v:val[1], f.v:val[0]]')
        endif
        unlet d
    endwhile
    return r
endfunction
"▶1 completion-related constants
let s:r.comp={}
let s:r.comp.rev    = 'type string'
let s:r.comp.file   = 'type String'
let s:r.comp.cmd    = 'type STRING'
let s:r.comp.optrev = 'type STRing'
let s:r.comp.repo   = ':":"(either(path d, match@\v^\w+%(\+\w+)*\V://\v|^\:$@))'
let s:r.compcmds=['new', 'vnew', 'edit',
            \     'leftabove\ vnew', 'rightbelow\ vnew',
            \     'topleft\ vnew',   'botright\ vnew',
            \     'aboveleft\ new',  'belowright\ new',
            \     'topleft\ new',    'botright\ new',]
" XXX Some code relies on the fact that all options from s:diffoptslst are
"     numeric
let s:r.diffopts=['git', 'reverse', 'ignorews', 'iwsamount', 'iblanks',
            \     'numlines', 'showfunc', 'alltext', 'dates']
let s:r.comp.diffopts=join(map(copy(s:r.diffopts),
            \          'v:val is# "numlines" ? '.
            \               '" ?".v:val." range 0 inf" : '.
            \               '"!?".v:val'))
"▶1 Completion functions
function s:r.revlist(...)
    let repo=aurum#repository()
    return       repo.functions.getrepoprop(repo, 'tagslist')+
                \repo.functions.getrepoprop(repo, 'brancheslist')+
                \repo.functions.getrepoprop(repo, 'bookmarkslist')
endfunction
"▶1 gencompfunc
let s:replaces=[
            \['\V'.s:r.comp.rev,     'in *_r.cmdutils.revlist', 'g'],
            \['\V'.s:r.comp.file,    '(path)',                  'g'],
            \['\V'.s:r.comp.cmd,     'first(in _r.cmdutils.compcmds, idof cmd)',
            \                                                   'g'],
            \['\V'.s:r.comp.optrev,  'either(type "", in *_r.cmdutils.revlist)',
            \                                                   'g'],
            \]
function s:r.gencompfunc(fwc, subs, Compile)
    let subs=a:subs+s:replaces
    let fwc=substitute(a:fwc, '^-onlystrings\( _\)*', '', '')
    for args in subs
        let fwc=call('substitute', [fwc]+args)
    endfor
    return {'function': call(a:Compile, [fwc, 'complete'], {})[0]}
endfunction
"▶1 Post cmdutils resource
call s:_f.postresource('cmdutils', s:r)
"▶1
call frawor#Lockvar(s:, '_pluginloaded,_r')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
