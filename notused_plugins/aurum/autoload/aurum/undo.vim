"▶1 
scriptencoding utf-8
execute frawor#Setup('1.0', {'@/resources': '0.0',
            \                  '@/options': '0.0',})
let s:_messages={
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
            \ 'uchngs': 'Found changes done manually. Resetting buffer, '.
            \           'please retry.',
            \ 'noundo': 'Your vim is too old, thus undo is not supported. '.
            \           'Update to version of Vim that has undotree() '.
            \           'function available',
        \}
let s:r={}
let s:hasundo=exists('*undotree')
let s:_options={
            \'fullundo':     {'default': 1,
            \                  'filter': 'bool'},
        \}
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
"▶1 r.setup
function s:r.setup(bvar)
    let a:bvar.undo_start=s:F.curundo()
    let a:bvar.undo_ct=b:changedtick
    let a:bvar.undo_full=(s:hasundo && s:_f.getoption('fullundo'))
    if a:bvar.undo_full
        let a:bvar.undo_tree={a:bvar.undo_start : {}}
    endif
    let a:bvar.undo_reset=0
endfunction
"▶1 r.reset
function s:r.reset(bvar)
    setlocal modifiable
    call a:bvar.resetlines(a:bvar)
    let a:bvar.undo_ct=b:changedtick
    let a:bvar.undo_reset=1
    if s:hasundo
        let a:bvar.undo_start=s:F.curundo()
        let savedundolevels=&undolevels
        setglobal undolevels=-1
        try
            execute "normal! A \<BS>\e"
        finally
            let &undolevels=savedundolevels
        endtry
        if a:bvar.undo_full
            let a:bvar.undo_tree={a:bvar.undo_start : {}}
        endif
    endif
    setlocal nomodifiable
endfunction
"▶1 supdate
function s:F.supdate(bvar, prevundo)
    if b:changedtick!=a:bvar.undo_ct
        let a:bvar.undo_ct=b:changedtick
        if a:bvar.undo_reset
            let a:bvar.undo_reset=0
        endif
        let curundo=s:F.curundo()
        if              a:bvar.undo_full
                    \&& has_key(a:bvar.undo_tree, a:prevundo)
                    \&& curundo!=a:prevundo
                    \&& !has_key(a:bvar.undo_tree, curundo)
            let a:bvar.undo_tree[curundo]=copy(a:bvar.undo_tree[a:prevundo])
        endif
    endif
endfunction
"▶1 r.doaction
function s:r.doaction(bvar, update, fun, ...)
    let prevundo=s:F.curundo()
    setlocal modifiable
    let buf=bufnr('%')
    try
        let supdate=call(a:fun, [a:bvar]+a:000, {})
    finally
        call setbufvar(buf, '&modifiable', 0)
    endtry
    if buf==bufnr('%')
        if a:update && supdate && s:F.curundo()!=prevundo
            call s:F.undoup(a:bvar)
        endif
        call s:F.supdate(a:bvar, prevundo)
    endif
endfunction
"▶1 undoup
function s:F.undoup(bvar)
    call a:bvar.pulllines(a:bvar)
    if a:bvar.undo_full
        let curundo=s:F.curundo()
        if !has_key(a:bvar.undo_tree, curundo)
            call s:r.reset(a:bvar)
            call s:_f.throw('noutree')
        endif
        call a:bvar.procundoleaf(a:bvar, a:bvar.undo_tree[curundo])
    endif
endfunction
"▶1 r.postundo
function s:r.postundo(bvar)
    let curundo=s:F.curundo()
    if curundo<a:bvar.undo_start
        while curundo<a:bvar.undo_start
            let pundo=curundo
            silent redo
            let curundo=s:F.curundo()
            if curundo==pundo
                call s:_f.throw('tooundo')
                call s:r.reset(a:bvar)
                setlocal nomodifiable
                return 0
            endif
        endwhile
    endif
    return 1
endfunction
"▶1 r.updatetree
function s:r.updatetree(bvar, oundoleafpart)
    call map(a:bvar.undo_tree, 'extend(v:val, a:oundoleafpart, "keep")')
endfunction
"▶1 r.preaction
function s:r.preaction(bvar)
    if b:changedtick!=a:bvar.undo_ct
        if a:bvar.undo_full && has_key(a:bvar.undo_tree, s:F.curundo())
            call s:F.undoup(a:bvar)
        else
            call s:_f.warn('uchngs')
            call s:r.reset(a:bvar)
            return 0
        endif
    endif
    return 1
endfunction
"▶1 r.preundoaction
function s:r.preundoaction(bvar, action)
    if !s:hasundo
        call s:_f.warn('noundo')
        return 0
    endif
    if a:bvar.undo_reset
        setlocal nomodifiable
        call s:_f.warn(a:action.'na')
        return 0
    endif
    return 1
endfunction
"▶1 r.getundoleaf
function s:r.getundoleaf(bvar)
    return a:bvar.undo_tree[s:F.curundo()]
endfunction
"▶1 Post resource
call s:_f.postresource('undo', s:r)
"▶1
call frawor#Lockvar(s:, '_r,_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
