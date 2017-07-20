execute frawor#Setup('0.0', {'@/base64': '0.0'})
W: Testing base64. Test should not output anything
let tests=[
            \['', ''],
            \['QQ==', 'A'],
            \['QUJ=', 'AB'],
            \['QUJD', 'ABC'],
            \['QUJDRA==', 'ABCD'],
            \["AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8gISIj\nJCUmJygpKissLS4vMDEyMzQ1Njc4OTo7PD0+P0BBQkNERUZH\nSElKS0xNTk9QUVJTVFVWV1hZWltcXV5fYGFiY2RlZmdoaWpr\nbG1ub3BxcnN0dXZ3eHl6e3x9fn+AgYKDhIWGh4iJiouMjY6P\nkJGSk5SVlpeYmZqbnJ2en6ChoqOkpaanqKmqq6ytrq+wsbKz\ntLW2t7i5uru8vb6/wMHCw8TFxsfIycrLzM3Oz9DR0tPU1dbX\n2Nna29zd3t/g4eLj5OXm5+jp6uvs7e7v8PHy8/T19vf4+fr7\n/P3+/w==                                        ",
            \ range(0, 0xFF)],
            \['QUJDAApBQkMAREVGCgBBQkM=', ["ABC\n", "ABC\nDEF", "\nABC"]],
        \]
let i=0
for [in, out] in tests
    if type(out)==type([])
        if type(out[0])==type('')
            let d=s:_r.base64.decodelines(in)
            let e=s:_r.base64.encodelines(d)
            let d2=s:_r.base64.decodelines(e)
        else
            let d=s:_r.base64.decode(in, 1)
            let e=s:_r.base64.encode(d)
            let d2=s:_r.base64.decode(e, 1)
        endif
    else
        let d=s:_r.base64.decode(in)
        let e=s:_r.base64.encode(d)
        let d2=s:_r.base64.decode(e)
    endif
    if d!=#out
        echom 'Failed '.i.':'
        echom ' in: '.in
        echom '  d: '.string(d)
        echom 'out: '.string(out)
    endif
    if d2!=#out
        echom 'Failed(2) '.i.':'
        echom ' in: '.in
        echom '  d: '.string(d)
        echom 'out: '.string(out)
    endif
    unlet d e d2
    unlet in out
    let i+=1
endfor
unlet i
let base64=s:_r.base64
