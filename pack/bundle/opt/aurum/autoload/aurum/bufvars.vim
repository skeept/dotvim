"▶1 
scriptencoding utf-8
execute frawor#Setup('0.0', {'@/resources': '0.0',})
let s:bufvars={}
"▶1 bufwipeout
function s:F.bufwipeout()
    let buf=+expand('<abuf>')
    if has_key(s:bufvars, buf)
        let bvar=s:bufvars[buf]
        if !has_key(bvar, 'command')
        elseif has_key(bvar, 'bwfunc')
            let eval='<SNR>'.s:_sid.'_Eval'
            call feedkeys("\<C-\>\<C-n>:call ".
                    \      "call(".eval."('s:bufvars[".buf."].bwfunc'), ".
                    \           "[".eval."('s:bufvars[".buf."]')], {}) | ".
                    \"call ".eval."('remove(s:bufvars, ".buf.")')\n\<C-l>", 'n')
            return
        endif
        unlet s:bufvars[buf]
    endif
endfunction
"▶1 AurumBufVars augroup
augroup AurumBufVars
    autocmd BufWipeOut * :call s:F.bufwipeout()
augroup END
let s:_augroups+=['AurumBufVars']
"▶1
call s:_f.postresource('bufvars', s:bufvars, 1)
"▶1
call frawor#Lockvar(s:, 'bufvars')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
