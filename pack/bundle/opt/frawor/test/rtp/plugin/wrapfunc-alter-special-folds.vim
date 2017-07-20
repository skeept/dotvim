execute frawor#Setup('0.0', {'@/functions': '0.0',
            \     '@/decorators/altervars': '0.0'})
append
{{{1 1
{{{2 2
{{{3 3
4
5
6
{{{3 7
8
9
{{{2 a
b
c
d
{{{1 e
f
.
setlocal foldmethod=marker foldmarker={{{,}}}
setlocal foldtext=foldtext()
function s:F.printfolds()
    let r=[]
    let lline=line('$')
    let line=1
    while line<=lline
        if foldclosed(line)!=-1
            let r+=['F'.foldtextresult(line)]
            let line=foldclosedend(line)
        else
            let r+=[' '.getline(line)]
        endif
        let line+=1
    endwhile
    call WriteFile(r)
endfunction
function s:F.wrappedfunc(...)
    normal! zR
    call s:F.printfolds()
endfunction
call s:_f.addextfunctions({'Function': {'function': s:F.wrappedfunc,
            \                         '@altervars': [['+folds']]}})
normal! zMggzojjzo
call s:F.printfolds()
W>>>
call Function()
W<<<
call s:F.printfolds()
