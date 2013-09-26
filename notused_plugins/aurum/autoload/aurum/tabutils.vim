"▶1 
scriptencoding utf-8
execute frawor#Setup('0.0', {})
let s:_messages={
            \'tidnstr': 'Tab identifier must be a non-empty string',
            \'tidreg' : 'Tab identifier “%s” was already registered '.
            \           'by plugin %s',
            \'layinv' : "Invalid layout: it must\n".
            \           " - be a dictionary\n".
            \           " - that has only “top” and “bottom” keys\n".
            \           " - with “top” key value being a non-empty ".
            \              "list of unique strings\n".
            \           " - and “bottom” key value being a string not present ".
            \              "in “top” list",
            \'bhfncal': 'botheightfun argument is not callable',
            \'unlncal': 'unload argument is not callable',
            \'tidukn' : 'Unknown tabid or tabid is not a string',
            \'botncal': 'botfun argument is not callable',
            \'barnlst': 'botargs argument is not a list',
            \  'tabex': 'There already is tab with id “%s”',
        \}
let s:f={'cons': {}}
"▶1 getids
function s:F.getids(layout)
    return a:layout.top + [a:layout.bottom]
endfunction
"▶1 f.cons.new :: {f}, tabid, layout, botheightfun, unload → + s:tabs, fdict
let s:tabs={}
function s:f.cons.new(plugdict, fdict, tabid, layout, botheightfun, unload)
    "▶2 Check arguments
    if type(a:tabid)!=type('') || empty(a:tabid)
        call s:_f.throw('tidnstr')
    elseif has_key(s:tabs, a:tabid)
        call s:_f.throw('tidreg', a:tabid, s:tabs[a:tabid])
    elseif          type(a:layout)!=type({})
                \|| sort(keys(a:layout)) !=# ['bottom', 'top']
                \|| type(a:layout.bottom)!=type('')
                \|| type(a:layout.top)!=type([])
                \|| empty(a:layout.top)
                \|| !empty(filter(copy(a:layout.top), 'type(v:val)!='.type('')))
                \|| !empty(filter(a:layout.top[1:],
                \          'index(a:layout.top[:(v:key)], v:val)!=-1'))
                \|| index(a:layout.top, a:layout.bottom)!=-1
        call s:_f.throw('layinv')
    elseif !exists('*a:botheightfun')
        call s:_f.throw('gshncal')
    elseif !exists('*a:unload')
        call s:_f.throw('unlncal')
    endif
    "▶2 tabdesc
    let a:fdict[a:tabid]={
                \'layout': deepcopy(a:layout),
                \'botheightfun': a:botheightfun,
                \'unload': a:unload,
                \'ids': s:F.getids(a:layout),
                \'id': a:tabid,
            \}
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
"▶1 f.cons.getwnrs :: {f} → ([topid] + bottomids)
function s:f.cons.getwnrs(plugdict, fdict)
    let tabid=gettabvar(tabpagenr(), 'aurum_tabid')
    "▶2 Check tabid
    if type(tabid)!=type('') || !has_key(a:fdict, tabid)
        call s:_f.throw('tidukn')
    endif
    "▲2
    let tabspec=a:fdict[tabid]
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
        execute 'resize' call(tabspec.botheightfun, [], {})
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
    let height=call(tabspec.botheightfun, [], {})
    call call(a:botfun, ['silent botright '.height.'split'] + a:botargs,
                \{})
    setlocal bufhidden=wipe
    let w:aurum_winid=tabspec.layout.bottom
    let s:prevtabs[tabspec.id]=tabmark
endfunction
"▶1 f.cons.find :: {f}, tabid
function s:f.cons.find(plugdict, fdict, tabid)
    "▶2 Check argument
    if type(a:tabid)!=type('') || !has_key(a:fdict, a:tabid)
        call s:_f.throw('tidukn')
    endif
    "▲2
    for tabnr in range(1, tabpagenr('$'))
        if gettabvar(tabnr, 'aurum_tabid') is# a:tabid
            execute 'tabnext' tabnr
            return tabnr
        endif
    endfor
    return 0
endfunction
"▶1 f.cons.close :: {f}
function s:f.cons.close(plugdict, fdict)
    let tabid=gettabvar(tabpagenr(), 'aurum_tabid')
    "▶2 Check tabid
    if type(tabid)!=type('') || !has_key(a:fdict, tabid)
        call s:_f.throw('tidukn')
    endif
    "▲2
    let tabspec=a:fdict[tabid]
    unlet t:aurum_tabid
    if tabpagenr('$')>1
        tabclose!
        if has_key(s:prevtabs, tabid)
            let tabmark=s:prevtabs[tabid]
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
                if index(tabspec.ids, getwinvar(wnr, 'aurum_winid'))
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
    if has_key(s:prevtabs, tabid)
        unlet s:prevtabs[tabid]
    endif
    return 1
endfunction
"▶1 f.unloadpre :: {f}
function s:f.unloadpre(plugdict, fdict)
    for tabnr in range(1, tabpagenr('$'))
        let tabid=gettabvar(tabnr, 'aurum_tabid')
        if type(tabid)==type('') && has_key(a:fdict, tabid)
            execute 'tabnext' tabnr
            let tabspec=a:fdict[tabid]
            call call(tabspec.unload, [], {})
        endif
    endfor
    call map(keys(a:fdict), 'remove(s:tabs, v:val)')
endfunction
"▶1 Post resource
call s:_f.newfeature('tab', s:f)
"▶1
call frawor#Lockvar(s:, 'tabs,prevtabs,last_prevtabmark')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
