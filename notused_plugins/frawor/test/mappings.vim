nnoremap h :call WriteFile("h")<CR>
nnoremap j :call WriteFile("j")<CR>
nnoremap l :call WriteFile("l")<CR>
nnoremap k :call WriteFile("k")<CR>
nnoremap a :call WriteFile("a")<CR>
nnoremap e :call WriteFile("e")<CR>
nnoremap d :call WriteFile("d")<CR>
let g:testfile="plugin/".g:curtest.".vim"
let g:maxcount=3
let g:frawormap_Mgroup2='P'
let g:frawormap_Mgroup3='"ap'
let g:frawormap_Mgroup3_kappa=['j', 'l']
let b:frawormap_Agroup_eta='g'
source test.vim
new +let\ b:frawormap_Mgroup2_epsilon='e'\|let\ b:frawormap_Mgroup3_iota='h'\|let\ b:frawormapOptions={'Mgroup_gamma':['"apj','"apl']}
wincmd w
