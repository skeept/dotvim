execute frawor#Setup("0.0", {'autoload/frawor/mappings': '0.0'})
nnoremap          a :call WriteFile('"'.v:register)<CR>
if v:version>703 || (v:version==703 && has('patch32'))
    nnoremap <expr>   b WriteFile('"'.v:register." b")
        nmap <expr>   c '"aa'
else
    nnoremap          b :call WriteFile('"'.v:register.' b')<CR>
        nmap          c "aa
endif
nnoremap          d :call WriteFile("D")<CR>
nnoremap <buffer> d :call WriteFile("d")<CR>
 noremap          e <C-\><C-n>:call WriteFile("e")<CR>

W: just mapped
let keys="abcde"
execute "normal" keys."ve\<C-\>\<C-n>"

let d={}
for k in split(keys, '\v.@=')
    let d[k]=s:_r.map.maparg(k, 0, 'n')
    call s:_r.map.unmap(d[k])
endfor

W: unmapped
execute "normal" keys."ve\<C-\>\<C-n>"

for m in values(d)
    call s:_r.map.map(m)
endfor

W: mapped again
execute "normal" keys."ve\<C-\>\<C-n>"

W: other buffer
new
execute "normal" keys."ve\<C-\>\<C-n>"
