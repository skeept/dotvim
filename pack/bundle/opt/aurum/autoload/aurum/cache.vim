"▶1
scriptencoding utf-8
execute frawor#Setup('2.4', {'@/resources': '0.0',
            \                  '@/options': '0.0',})
let s:_options={
            \'branchcachetime': {'default': 2, 'checker': 'range 0 inf'},
            \'cscachetime':     {'default': 3, 'checker': 'range 0 inf'},
            \'statuscachetime': {'default': 5, 'checker': 'range 0 inf'},
            \'repocachetime':   {'default': 7, 'checker': 'range 0 inf'},
        \}
let s:cachebvars={}
let s:r={}
let s:r.allkeys=['branch', 'changeset', 'repository', 'status']
let s:_messages={
            \ 'nfunc': 'Argument must be a callable function reference',
            \ 'pldef': 'Plugin has already defined one wiper function',
            \'dbldef': 'Function %s was already added by another plugin',
        \}
"▶1 bufwipeout
function s:F.bufwipeout()
    let buf=+expand('<abuf>')
    if has_key(s:cachebvars, buf)
        unlet s:cachebvars[buf]
    endif
endfunction
augroup AurumCacheBufVars
    autocmd BufWipeOut,BufFilePost * :call s:F.bufwipeout()
augroup END
let s:_augroups+=['AurumCacheBufVars']
"▶1 r.getcbvar ::  () + buf, cachebvars → cbvar + cachebvars?
function s:r.getcbvar()
    let buf=bufnr('%')
    if !has_key(s:cachebvars, buf)
        let s:cachebvars[buf]={}
    endif
    return s:cachebvars[buf]
endfunction
"▶1 r.get :: key, func, args, dict → val + cbvar
function s:r.get(key, Func, args, dict)
    let cbvar=s:r.getcbvar()
    if !(has_key(cbvar, a:key) &&
                \localtime()-cbvar['_time'.a:key]<cbvar['_maxtime'.a:key])
        let cbvar[a:key]=call(a:Func, a:args, a:dict)
        let cbvar['_time'.a:key]=localtime()
        if !has_key(cbvar, '_maxtime'.a:key)
            let cbvar['_maxtime'.a:key]=s:_f.getoption(a:key.'cachetime')
        endif
    endif
    return cbvar[a:key]
endfunction
"▶1 r.del :: key → + cbvar
function s:r.del(key)
    let buf=bufnr('%')
    if !has_key(s:cachebvars, buf)
        return
    endif
    let cbvar=s:cachebvars[buf]
    if has_key(cbvar, a:key)
        unlet cbvar[a:key]
    endif
endfunction
"▶1 r.wipe :: key → + cachebvars
function s:r.wipe(key)
    " empty() is here only to avoid possible “Using smth as a number” error
    call map(copy(s:cachebvars), 'has_key(v:val,a:key) && '.
                \                                  'empty(remove(v:val,a:key))')
    call map(copy(s:wipers), 'call(v:val, [a:key], {})')
endfunction
"▶1 r.getinterval
function s:r.getinterval(key)
    return s:_f.getoption(a:key.'cachetime')
endfunction
"▶1 addwiper feature
let s:wipers=[]
let s:feature={}
function s:feature.cons(plugdict, fdict, Func)
    if !exists('*a:Func')
        call s:_f.throw('nfunc')
    elseif has_key(a:fdict, 'func')
        call s:_f.throw('pldef', string(a:fdict.func))
    elseif index(s:wipers, a:Func)!=-1
        call s:_f.throw('dbldef', string(a:Func))
    endif
    let s:wipers+=[a:Func]
    let a:fdict.func=a:Func
endfunction
function s:feature.unload(plugdict, fdict)
    if has_key(a:fdict, 'func')
        call filter(s:wipers, 'v:val isnot# a:fdict.func')
    endif
endfunction
call s:_f.newfeature('addwiper', s:feature)
"▶1 Post cache resource
call s:_f.postresource('cache', s:r)
"▶1
call frawor#Lockvar(s:, '_pluginloaded,cachebvars,wipers')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
