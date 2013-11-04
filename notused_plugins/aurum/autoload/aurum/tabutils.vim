"▶1 
scriptencoding utf-8
execute frawor#Setup('1.0', {'@/options': '0.0',
            \                     '@/os': '0.0',
            \             '@%aurum/edit': '1.0',
            \          '@%aurum/bufvars': '0.0',
            \           '@%aurum/commit': '1.3',})
let s:_messages={
            \'tidnstr': 'Tab identifier must be a non-empty string',
            \'tidreg' : 'Tab identifier “%s” was already registered '.
            \           'by plugin %s',
            \'layinv' : "Invalid layout: it must\n".
            \           " - be a dictionary\n".
            \           " - that has only “top”, “bottom”, “oprefix”, ".
            \              "“unload” keys\n".
            \           " - with “top” key value being a non-empty ".
            \              "list of unique strings\n".
            \           " - and “bottom” key value being a string not present ".
            \              "in “top” list\n".
            \           " - ",
            \'tidukn' : 'Unknown tabid or tabid is not a string',
            \'botncal': 'botfun argument is not callable',
            \'barnlst': 'botargs argument is not a list',
            \  'tabex': 'There already is tab with id “%s”',
            \ 'nsbvar': 'Internal error: sbvar key is present and sbuf '.
            \           'is pointing to unknown buffer. If you can reproduce '.
            \           'this file a bug report',
        \}
let s:f={'cons': {}}
"▶1 options
let s:options={
            \'height':    {'default': 0,
            \               'filter': '(if type "" earg _  range 0 inf)'},
            \'autowrite': {'default': 1,
            \               'filter': 'bool'},
        \}
let s:_options={}
"▶1 getswheight
function s:F.getswheight(tabspec)
    let height=s:_f.getoption(a:tabspec.oprefix . 'height')
    if height<=0
        return winheight(0)/5
    endif
    return height
endfunction
"▶1 getids
function s:F.getids(layout)
    return a:layout.top + [a:layout.bottom]
endfunction
"▶1 f.cons.new :: {f}, tabid, layout → + s:tabs, fdict
let s:tabs={}
function s:f.cons.new(plugdict, fdict, tabid, tabdesc)
    "▶2 Check arguments
    if type(a:tabid)!=type('') || empty(a:tabid)
        call s:_f.throw('tidnstr')
    elseif has_key(s:tabs, a:tabid)
        call s:_f.throw('tidreg', a:tabid, s:tabs[a:tabid])
    elseif          type(a:tabdesc)!=type({})
                \|| sort(keys(a:tabdesc)) !=#
                \       ['bottom', 'oprefix', 'top', 'unload']
                \|| type(a:tabdesc.bottom)!=type('')
                \|| type(a:tabdesc.top)!=type([])
                \|| empty(a:tabdesc.top)
                \|| !empty(filter(copy(a:tabdesc.top),'type(v:val)!='.type('')))
                \|| !empty(filter(a:tabdesc.top[1:],
                \                 'index(a:tabdesc.top[:(v:key)], v:val)!=-1'))
                \|| index(a:tabdesc.top, a:tabdesc.bottom)!=-1
                \|| !exists('*a:tabdesc.unload')
                \|| !(type(a:tabdesc.oprefix) == type(0)
                \  || type(a:tabdesc.oprefix) == type(''))
        call s:_f.throw('layinv')
    endif
    "▶2 tabdesc
    let a:fdict[a:tabid]={
                \'layout': {'bottom': a:tabdesc.bottom,
                \              'top': copy(a:tabdesc.top),},
                \'oprefix': a:tabdesc.oprefix,
                \'unload': a:tabdesc.unload,
                \'ids': s:F.getids(a:tabdesc),
                \'id': a:tabid,
            \}
    let oprefix=a:tabdesc.oprefix
    let s:_options[oprefix.'height']=s:options.height
    let s:_options[oprefix.'autowrite']=s:options.autowrite
    let s:tabs[a:tabid]=a:plugdict.id
endfunction
"▶1 settoplayout
function s:F.settoplayout(layout)
    let w:aurum_winid=a:layout.top[0]
    for id in a:layout.top[1:]
        rightbelow vnew
        setlocal bufhidden=wipe
        let w:aurum_winid=id
    endfor
endfunction
"▶1 getwinnrs
function s:F.getwinnrs(ids)
    let curids={}
    call map(filter(map(range(1, winnr('$')),
                \'[getwinvar(v:val, "aurum_winid"), v:key+1]'),
                \'!empty(v:val[0])'),
                \'extend(curids, {v:val[0]: v:val[1]})')
    return map(copy(a:ids), 'get(curids, v:val, 0)')
endfunction
"▶1 getswnr
function s:F.getswnr(tabspec)
    return s:F.getwinnrs([a:tabspec.layout.bottom])[0]
endfunction
"▶1 getlwnr
function s:F.getlwnr(tabspec)
    return s:F.getwinnrs([a:tabspec.layout.top[0]])[0]
endfunction
"▶1 getlrwnrs
function s:F.getlrwnrs(tabspec)
    return s:F.getwinnrs(a:tabspec.layout.top[0:1])
endfunction
"▶1 tabunload :: {f}
function s:F.tabunload(tabspec)
    let swnr=s:F.getswnr(a:tabspec)
    if !swnr
        tabclose
        return -1
    endif
    execute swnr.'wincmd w'
    let bvar=s:_r.bufvars[bufnr('%')]
    return a:tabspec.unload(bvar)
endfunction
"▶1 gettabspec :: fdict[, nothrow] → (tabid, tabspec)
function s:F.gettabspec(fdict, ...)
    let tabid=gettabvar(tabpagenr(), 'aurum_tabid')
    "▶2 Check tabid
    if type(tabid)!=type('') || !has_key(a:fdict, tabid)
        if !a:0 || !a:1
            call s:_f.throw('tidukn')
        else
            return [0, 0]
        endif
    endif
    "▲2
    let tabspec=a:fdict[tabid]
    return [tabid, tabspec]
endfunction
"▶1 f.cons.getwnrs :: {f} → ([topid] + bottomids)
function s:f.cons.getwnrs(plugdict, fdict)
    let [tabid, tabspec]=s:F.gettabspec(a:fdict)
    let ids=tabspec.ids
    let winnrs=s:F.getwinnrs(ids)
    if winnrs[0] is 0 || index(winnrs, 0)==-1
        return winnrs
    else
        execute winnrs[-1].'wincmd w'
        silent only!
        topleft new
        call s:F.settoplayout(tabspec.layout)
        wincmd j
        execute 'resize' s:F.getswheight(tabspec)
        return s:F.getwinnrs(ids)
    endif
endfunction
"▶1 f.cons.create :: {f}, tabid, botfun, botargs → + vim
let s:last_prevtabmark=0
let s:prevtabs={}
function s:f.cons.create(plugdict, fdict, tabid, botfun, botargs)
    "▶2 Check arguments
    if type(a:tabid)!=type('') || !has_key(a:fdict, a:tabid)
        call s:_f.throw('tidukn')
    elseif !exists('*a:botfun')
        call s:_f.throw('botncal')
    elseif type(a:botargs)!=type([])
        call s:_f.throw('barnlst')
    endif
    "▲2
    if !empty(filter(range(1, tabpagenr('$')),
                \    'gettabvar(v:val, "aurum_tabid") is# '.string(a:tabid)))
        call s:_f.throw('tabex', a:tabid)
    endif
    let tabspec=a:fdict[a:tabid]
    if !exists('t:aurum_tabmark')
        let t:aurum_tabmark=s:last_prevtabmark
        let s:last_prevtabmark+=1
    endif
    let tabmark = t:aurum_tabmark
    tabnew
    setlocal bufhidden=wipe
    let t:aurum_tabid=tabspec.id
    call s:F.settoplayout(tabspec.layout)
    let height=s:F.getswheight(tabspec)
    call call(a:botfun, ['silent botright '.height.'split'] + a:botargs,
                \{})
    setlocal bufhidden=wipe
    let w:aurum_winid=tabspec.layout.bottom
    let s:prevtabs[tabspec.id]=tabmark
endfunction
"▶1 find :: tabid → tabnr + tab
function s:F.find(tabid)
    for tabnr in range(1, tabpagenr('$'))
        if gettabvar(tabnr, 'aurum_tabid') is# a:tabid
            execute 'tabnext' tabnr
            return tabnr
        endif
    endfor
    return 0
endfunction
"▶1 close :: tabid, tabspec
function s:F.close(tabid, tabspec)
    unlet t:aurum_tabid
    if tabpagenr('$')>1
        tabclose!
        if has_key(s:prevtabs, a:tabid)
            let tabmark=s:prevtabs[a:tabid]
            let tabnr=index(map(range(1, tabpagenr('$')),
                        \       'gettabvar(v:val, "aurum_tabmark")'), tabmark)+1
            if tabnr
                execute 'tabnext' tabnr
            endif
        endif
    else
        let wlist=range(1, winnr('$'))
        while !empty(wlist)
            for wnr in wlist
                call remove(wlist, 0)
                if index(a:tabspec.ids, getwinvar(wnr, 'aurum_winid'))
                    execute wnr.'wincmd w'
                    if winnr('$')==1
                        unlet w:aurum_winid
                        enew
                    else
                        close!
                    endif
                    let wlist=range(1, winnr('$'))
                    break
                endif
            endfor
        endwhile
    endif
    if has_key(s:prevtabs, a:tabid)
        unlet s:prevtabs[a:tabid]
    endif
    return 1
endfunction
"▶1 f.cons.setautowrite :: {f}
function s:f.cons.setautowrite(plugdict, fdict)
    let [tabid, tabspec]=s:F.gettabspec(a:fdict)
    if s:_f.getoption(tabspec.oprefix . 'autowrite')
        augroup AuRecordAutowrite
            autocmd! BufLeave <buffer> nested write
        augroup END
    endif
endfunction
"▶1 f.cons.restore :: {f}, bvar
function s:f.cons.restore(plugdict, fdict, bvar)
    let [tabid, tabspec]=s:F.gettabspec(a:fdict)
    let sbuf=get(a:bvar, 'sbuf', -1)
    "▶2 Check sbuf existence
    if !bufexists(sbuf)
        if has_key(a:bvar, 'sbvar')
            return call(tabspec.unload, [a:bvar.sbvar], {})
        elseif has_key(s:_r.bufvars, sbuf)
            return call(tabspec.unload, [s:_r.bufvars[sbuf]], {})
        else
            call s:_f.throw('nsbvar')
        endif
    endif
    "▲2
    let sbvar=a:bvar.sbvar
    execute 'silent botright sbuffer' sbuf
    execute 'resize' s:F.getswheight(tabspec)
    call winrestview(a:bvar.winview)
    redraw!
    let w:aurum_winid=tabspec.layout.bottom
    setlocal bufhidden=wipe
    return 1
endfunction
"▶1 commitvimdiffcb
function s:F.commitvimdiffcb(file, bvar, hex)
    let bvar=s:_r.bufvars[bufnr('%')]
    let [tabid, tabspec]=s:F.gettabspec(a:bvar.fdict)
    let [lwnr, rwnr]=s:F.getlrwnrs(tabspec)

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
"▶1 commitfindwindow :: {f}
function s:F.commitfindwindow()
    let bvar=s:_r.bufvars[bufnr('%')]
    let [tabid, tabspec]=s:F.gettabspec(bvar.fdict)
    let lwnr=s:F.getlwnr(tabspec)
    execute lwnr.'wincmd w'
    return 1
endfunction
"▶1 f.cons.copen :: {f}, bvar, buf, keys, opts[, status[, files]]
function s:f.cons.copen(plugdict, fdict, bvar, buf, keys, opts, ...)
    if a:0
        let status=a:1
        if a:0>1
            let files=a:2
        else
            let files=[]
        endif
    else
        let status=a:bvar.repo.functions.status(a:bvar.repo)
        let files=[]
    endif
    return s:_r.commit.commit(
                \   a:bvar.repo,
                \   a:bvar.copts,
                \   files,
                \   status,
                \   a:keys,
                \   'silent edit',
                \   extend({
                \       'vimdiffcb'  : s:F.commitvimdiffcb,
                \       'findwindow' : s:F.commitfindwindow,
                \       'bwfunc'     : a:plugdict.g._f.tab.restore,
                \       'sbvar'      : a:bvar,
                \       'sbuf'       : a:buf,
                \       'winview'    : winsaveview(),
                \       'fdict'      : a:fdict,
                \   }, a:opts),
                \)
endfunction
"▶1 f.cons.unload :: {f}
function s:f.cons.unload(plugdict, fdict, tabid, bvar)
    "▶2 Check argument
    if type(a:tabid)!=type('') || !has_key(a:fdict, a:tabid)
        call s:_f.throw('tidukn')
    endif
    "▲2
    let [tabid, tabspec]=s:F.gettabspec(a:fdict, 1)
    if tabid is 0
        unlet tabspec
        if s:F.find(a:tabid)
            let [tabid, tabspec]=s:F.gettabspec(a:fdict, 1)
        endif
        if tabid is 0
            return 1
        endif
    endif
    let swnr=s:F.getswnr(tabspec)
    if !swnr
        let sbuf=0
        let sbvar=get(a:bvar, 'sbvar', a:bvar)
    else
        let sbuf=winbufnr(swnr)
        let sbvar=s:_r.bufvars[sbuf]
    endif
    call tabspec.unload(sbvar)
    if sbuf isnot 0 && bufexists(sbuf)
        unlet sbvar.bwfunc
        execute 'bwipeout!' sbuf
    endif
    if has_key(sbvar, 'savedopts')
        for [o, val] in items(sbvar.savedopts)
            execute 'let &g:'.o.'=val'
        endfor
    endif
    if bufexists(sbvar.bufnr)
        call setbufvar(sbvar.bufnr, '&modified', 0)
    endif
    call s:F.close(tabid, tabspec)
endfunction
"▶1 f.unloadpre :: {f}
function s:f.unloadpre(plugdict, fdict)
    for tabnr in range(1, tabpagenr('$'))
        let tabid=gettabvar(tabnr, 'aurum_tabid')
        if type(tabid)==type('') && has_key(a:fdict, tabid)
            execute 'tabnext' tabnr
            let tabspec=a:fdict[tabid]
            call s:F.tabunload(tabspec)
        endif
    endfor
    call map(keys(a:fdict), 'remove(s:tabs, v:val)')
endfunction
"▶1 Post resource
call s:_f.newfeature('tab', s:f)
"▶1
call frawor#Lockvar(s:, 'tabs,prevtabs,last_prevtabmark,_options,_r')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
