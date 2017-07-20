execute frawor#Setup('0.0', {'@/signs': '0.0'})
let s:sgopts1={'text': '<>'}
let s:sgopts2={'text': '><'}

let s:sign1=s:_f.sign.new(   0,   s:sgopts1)
let s:sign2=s:_f.sign.new('test', s:sgopts2)

call WriteFile('name of sign2: '.s:sign2)

call WriteFile('sign1: '.string(items(s:_r.sign.getdef(s:sign1))),
            \  'sign2: '.string(items(s:_r.sign.getdef(s:sign2))))

vnew

call WriteFile('buf1signs: '.string(s:_r.sign.getbuf(1)),
            \  'buf2signs: '.string(s:_r.sign.getbuf(2)))

call s:_f.sign.place(s:sign1, 0, 1)
call s:_f.sign.place(s:sign2, 1, 1)

call WriteFile('buf1signs: '.string(s:_r.sign.getbuf(1)),
            \  'buf2signs: '.string(s:_r.sign.getbuf(2)))
call WriteFile('exists: '.s:_r.sign.exists(s:sign1).' '.s:_r.sign.exists(s:sign2))

call s:_f.sign.delete(s:sign1)

call WriteFile('buf1signs: '.string(s:_r.sign.getbuf(1)),
            \  'buf2signs: '.string(s:_r.sign.getbuf(2)))
call WriteFile('exists: '.s:_r.sign.exists(s:sign1).' '.s:_r.sign.exists(s:sign2))

call s:_f.sign.delete(s:sign2)

call WriteFile('buf1signs: '.string(s:_r.sign.getbuf(1)),
            \  'buf2signs: '.string(s:_r.sign.getbuf(2)))
call WriteFile('exists: '.s:_r.sign.exists(s:sign1).' '.s:_r.sign.exists(s:sign2))

sign define test2 text=--
sign place  1     line=1 name=test2 buffer=1
sign place  2     line=1 name=test2 buffer=2
call WriteFile('buf1signs: '.string(s:_r.sign.getbuf(1)),
            \  'buf2signs: '.string(s:_r.sign.getbuf(2)))

call s:_r.sign.delete('test2')
call WriteFile('buf1signs: '.string(s:_r.sign.getbuf(1)),
            \  'buf2signs: '.string(s:_r.sign.getbuf(2)))
