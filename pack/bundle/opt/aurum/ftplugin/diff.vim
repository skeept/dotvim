"▶1 
scriptencoding utf-8
if !has('folding')
    finish
endif
if !exists('s:_sid')
    function s:Eval(expr)
        return eval(a:expr)
    endfunction
    let s:_sid=matchstr(s:Eval('expand("<sfile>")'), '\v\d+')
endif
let &l:foldexpr='<SNR>'.s:_sid.'_FoldExpr(v:lnum)'
let &l:foldtext='<SNR>'.s:_sid.'_FoldText(v:foldstart, v:foldend, v:foldlevel)'
"▶1 foldexpr
let s:dstartchars=[' ', '+', '-', '@', '']
function! s:FoldExpr(lnum)
    let line=getline(a:lnum)
    let nextline=getline(a:lnum+1)
    if nextline[:2] is# '@@ '
        return '<2'
    elseif line[:2] is# '@@ '
        return 2
    elseif nextline[:4] is# 'diff ' || nextline[:6] is# 'Index: ' ||
                \nextline[:3] is# '=== '
        return '<1'
    elseif line[:4] is# 'diff ' || line[:6] is# 'Index: ' || line[:3] is# '=== '
        return 1
    elseif index(s:dstartchars, nextline[0])==-1
        return '<1'
    elseif index(s:dstartchars, line[0])==-1
        if a:lnum==1 || index(s:dstartchars, getline(a:lnum-1))==-1
            return 1
        endif
    endif
    return '='
endfunction
"▶1 foldtext
function! s:FoldText(foldstart, foldend, foldlevel)
    let line=getline(a:foldstart)
    let r=printf('%*u lines: ', len(line('$')), a:foldend-a:foldstart)
    if a:foldlevel==1
        if line =~# '\v^diff%(\ --git)?\ a\/(.{-})\ b\/\1'
            let r.=matchlist(line, '\C\v^diff%(\ --git)\ a\/(.{-})\ b\/\1')[1]
        elseif line =~# '\v^diff%(\ \-r\ \x+){1,2}'
            let r.=substitute(line, '\C\v^diff%(\ \-r\ \x+){1,2}\ ', '', '')
        elseif line[:4] is# 'diff '
            let r.=line[5:]
        elseif line[:6] is# 'Index: '
            let r.=line[7:]
        elseif line[:3] is# '=== '
            let r.=matchstr(line, '\v\C%(%(file|directory)\ \'')@<=.{-}'.
                        \             '%(''%( |$))@=', 4)
        else
            let r.=line
        endif
    elseif a:foldlevel==2
        let r='+'.r.matchstr(line, '\m\(@@ \)\@<=.*', 3)
    endif
    return r
endfunction
"▶1
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
