"▶1 
scriptencoding utf-8
execute frawor#Setup('2.0', {'@%aurum/cmdutils': '4.3',
            \                 '@%aurum/bufvars': '0.0',
            \                    '@%aurum/edit': '1.4',
            \                     '@/functions': '0.1',
            \                           '@/fwc': '0.0',
            \                     '@/resources': '0.0',
            \                         '@/table': '0.1',})
let s:_messages={
            \'nocsfile': 'File “%s” is not present in changeset %s '.
            \            'from the repository %s',
        \}
"▶1 formatann :: repo, cs, lnum, numlen → String
function s:F.formatann(repo, cs, lnum, numlen)
    if !has_key(self, a:cs.hex)
        let description=matchstr(a:cs.description, '\v\S@=\p.*\S@=\p')
        let oldlen=len(description)
        while s:_r.strdisplaywidth(description, a:numlen+1)>30
            let description=substitute(description, '.$', '', '')
        endwhile
        if len(description)<oldlen
            let description.='…'
        endif
        let descwidth=s:_r.strdisplaywidth(description, a:numlen+1)
        if descwidth<31
            let description.=repeat(' ', 31-descwidth)
        endif
        let user=substitute(a:cs.user, '\m\s*<[^>]\+>$', '', '')
        let self[a:cs.hex]=printf('%*s %s / %s', a:numlen, a:cs.rev,
                    \                            description, user)
    endif
    return self[a:cs.hex]
endfunction
"▶1 unload
function s:F.unload(bvar)
    if has_key(a:bvar, 'annbuf') && bufexists(a:bvar.annbuf)
        let annwin=s:F.findwin(a:bvar.winid)
        if annwin
            for [o, v] in items(a:bvar.saved)
                call setwinvar(annwin, '&'.o, v)
            endfor
        endif
    endif
endfunction
"▶1 setup
"▶2 getcs :: rev + self → cs + self
function s:F.getcs(rev)
    if has_key(self, a:rev)
        return self[a:rev]
    endif
    let cs=self.repo.functions.getcs(self.repo, a:rev)
    let self[a:rev]=cs
    return cs
endfunction
"▲2
function s:F.setup(read, repo, rev, file)
    let rev=a:repo.functions.getrevhex(a:repo, a:rev)
    let bvar={'rev': rev, 'file': a:file}
    let ann=copy(a:repo.functions.annotate(a:repo, rev, a:file))
    let d={'repo': a:repo, 'getcs': s:F.getcs}
    let css=map(copy(ann), 'd.getcs(v:val[1])')
    let d={}
    let nl=max(map(copy(css), 'len(v:val.rev)'))
    let bvar.files=map(copy(ann), 'v:val[0]')
    let bvar.linenumbers=map(copy(ann), 'v:val[2]')
    let bvar.revisions=map(copy(css), 'v:val.hex')
    let bvar.bwfunc=s:F.unload
    let lines=map(copy(css), 'call(s:F.formatann, [a:repo, v:val, v:key, '.
                \                                  nl.'],d)')
    if a:read
        call append('.', lines)
    else
        call setline('.', lines)
        setlocal readonly nomodifiable
    endif
    return bvar
endfunction
"▶1 findwin :: winid → win
function s:F.findwin(winid)
    let win=winnr()
    if win>1 && getwinvar(win-1, 'aurum_annonate_winid') is a:winid
        return win-1
    elseif getwinvar(win+1, 'aurum_annonate_winid') is a:winid
        return win+1
    elseif getwinvar(win, 'aurum_annonate_winid') is a:winid
        return win
    else
        return 0
    endif
endfunction
"▶1 setannbuf
function s:F.setannbuf(bvar, annbuf, winid)
    let a:bvar.annbuf=a:annbuf
    let a:bvar.winid=a:winid
    setlocal scrollbind cursorbind nowrap
    let buf=bufnr('%')
    let annwin=s:F.findwin(a:winid)
    if !annwin
        return
    endif
    execute annwin.'wincmd w'
    let a:bvar.saved={}
    let a:bvar.saved.scrollbind = &scrollbind
    let a:bvar.saved.cursorbind = &cursorbind
    let a:bvar.saved.wrap       = &wrap
    setlocal scrollbind cursorbind nowrap
    " XXX I was unable to make scrollbinded windows behave sensibly without the 
    "     following command. No matter what I tried, if initially buffer had any 
    "     offset from the top (line("w0")!=1), saved vertical offset of 
    "     scrollbinded buffers was invalid, even if I moved cursor to the top 
    "     before setting scrollbind. It is good that my task allows :syncbind, 
    "     but it would be a pain if I wanted to have different relative offsets.
    syncbind
    augroup AuAnnotateBW
        execute 'autocmd BufWipeOut,BufHidden <buffer='.a:annbuf.'> '.
                    \':if bufexists('.buf.') | '.
                    \   'call feedkeys("\<C-\>\<C-n>'.
                    \                 ':silent! bw '.buf.'\n\<C-l>") | '.
                    \ 'endif'
    augroup END
endfunction
let s:_augroups+=['AuAnnotateBW']
"▶1 foldopen
if has('folding')
    function s:F.foldopen()
        if &foldenable
            try
                " XXX Using silent! here because I am unable to catch E490 for 
                " unknown reason
                silent! %foldopen!
            catch /^Vim:(foldopen):E490:/
                " No folds found — ignore
            endtry
        endif
    endfunction
else
    function s:F.foldopen()
        " Doing nothing if there is no folding support
    endfunction
endif
"▶1 annfunc
" TODO Investigate why wiping out annotate buffer causes consumption of next
"      character under wine
let s:_aufunctions.cmd={'@FWC': ['-onlystrings '.
            \'{  repo  '.s:_r.cmdutils.comp.repo.
            \'  ?file  '.s:_r.cmdutils.comp.file.
            \'  ?rev   '.s:_r.cmdutils.comp.rev.
            \'}', 'filter']}
let s:_aufunctions.comp=s:_r.cmdutils.gencompfunc(s:_aufunctions.cmd['@FWC'][0],
            \                                     [], s:_f.fwc.compile)
let s:lastid=0
function s:_aufunctions.cmd.function(opts)
    let [hasannbuf, repo, rev, file]=s:_r.cmdutils.getrrf(a:opts, 'noafile',
                \                                         'annotate')
    if repo is 0
        return
    endif
    if rev is 0
        let rev=repo.functions.getworkhex(repo)
    endif
    let allfiles=repo.functions.getcsprop(repo, rev, 'allfiles')
    if index(allfiles, file)==-1
        call s:_f.throw('nocsfile', file, rev, repo.path)
    endif
    if hasannbuf==2
        let hasannbuf=!repo.functions.dirty(repo, file)
    endif
    if hasannbuf
        let annbuf=bufnr('%')
    else
        " TODO Check for errors
        let existed=s:_r.mrun('silent edit', 'file', repo, rev, file)
        let annbuf=bufnr('%')
        if !existed
            setlocal bufhidden=wipe
        endif
    endif
    let annwin=winnr()
    call s:F.foldopen()
    let lnr=line('.')
    let winid=s:lastid
    let s:lastid+=1
    let w:aurum_annonate_winid=winid
    let anwidth=min([42, winwidth(0)/2-1])
    call s:_r.run('silent leftabove '.anwidth.'vsplit', 'annotate', repo,
                \ rev, file)
    execute lnr
    setlocal bufhidden=wipe
    call s:F.setannbuf(s:_r.bufvars[bufnr('%')], annbuf, winid)
endfunction
let s:_augroups+=['AuAnnotateBW']
"▶1 plstrgen
function s:F.plstrgen(bvar)
    let cs=a:bvar.repo.functions.getcs(a:bvar.repo, a:bvar.rev)
    let r=[cs.rev]
    if !empty(get(cs, 'tags'))
        let r+=['['.join(cs.tags).']']
    endif
    if !empty(get(cs, 'bookmarks'))
        let r+=['['.join(cs.bookmarks).']']
    endif
    if cs.branch isnot# 'default'
        let r+=['('.(cs.branch).')']
    endif
    return join(r)
endfunction
"▶1 aurum://annotate
call s:_f.newcommand({'function': s:F.setup,
            \        'arguments': 2,
            \         'filetype': 'aurumannotate',
            \         'plstrgen': s:F.plstrgen,})
"▶1 Post resource
call s:_f.postresource('annotate', {'setannbuf': s:F.setannbuf,
            \                        'foldopen': s:F.foldopen,
            \                         'findwin': s:F.findwin,})
"▶1
call frawor#Lockvar(s:, '_r,lastid')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
