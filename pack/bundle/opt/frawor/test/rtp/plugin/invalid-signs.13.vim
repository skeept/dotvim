execute frawor#Setup('0.0', {'@/signs': '0.0'})
call s:_f.sign.new('abc', {'text': '<>'})
try
    call s:_f.sign.place('abc', 10, 1)
finally
    call s:_f.sign.delete('abc')
endtry
