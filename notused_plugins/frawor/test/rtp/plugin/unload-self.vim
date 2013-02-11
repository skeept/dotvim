execute frawor#Setup('0.0', {'@ignoredeps-feature': '0',
            \                '@unload-self-feature': '0'})
call s:_f.unload()
if !empty(s:)
    throw "s: is not empty"
endif
