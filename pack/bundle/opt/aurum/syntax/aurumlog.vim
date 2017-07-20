if exists('b:current_syntax')
    finish
endif
try
    " Used to get diff* hlgroups, nothing more
    syntax include @Diff syntax/diff.vim
catch /\V\^Vim(syntax):E484:/
    " Ignore error if diff syntax file was not found
endtry

hi def link auLogSkipBefore_hex    Comment
hi def link auLog_rev_suf          Comment

hi def link auLogPatchFile         diffFile
hi def link auLogPatchNewFile      diffNewFile
hi def link auLogPatchOldFile      diffOldFile
hi def link auLogPatchAdded        diffAdded
hi def link auLogPatchRemoved      diffRemoved
hi def link auLogPatchChunkHeader  diffLine
hi def link auLogPatchSect         diffSubname

hi auLog_rev           ctermfg=LightBlue   guifg=LightBlue
hi auLogStatTIns       ctermfg=Green       guifg=Green
hi auLogStatTDel       ctermfg=Red         guifg=Red
hi auLog_branch        ctermfg=DarkRed     guifg=DarkRed
if &background is# 'dark'
    hi auLogSkipBefore_rev ctermfg=Yellow      guifg=Yellow
    hi auLogHexStart       ctermfg=Yellow      guifg=Yellow
else
    hi auLogSkipBefore_rev ctermfg=DarkYellow  guifg=DarkYellow
    hi auLogHexStart       ctermfg=DarkYellow  guifg=DarkYellow
endif
hi def link auLog_hex auLogHexStart
hi def link auLogHexStart_hex auLogHexStart
hi def link auLogHexEnd_hex   auLogHexStart

hi def link auLogHexEnd_parents_  auLogHexStart_parents_
hi def link auLogHexEnd_children_ auLogHexStart_children_

let b:current_syntax=expand('<sfile>:t:r')
if exists('s:_pluginloaded')
    call s:F.syndef()
    finish
endif
execute frawor#Setup('0.0', {'@%aurum/log/templates': '0.0',
            \                      '@%aurum/bufvars': '0.0',})
function s:F.syndef()
    let buf=bufnr('%')
    if !has_key(s:_r.bufvars, buf)
        return
    endif
    let bvar=s:_r.bufvars[buf]
    call s:_r.template.gettemplatelist(bvar)
    let bvar.templatesyn=s:_r.template.syntax(bvar.templatelist, bvar.opts,
                \                             bvar.repo)
    for line in bvar.templatesyn
        execute line
    endfor
endfunction
call s:F.syndef()
