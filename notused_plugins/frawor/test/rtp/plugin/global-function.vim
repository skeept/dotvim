execute frawor#Setup('0.0', {})

function TestFunction()
    echo 1
endfunction
let s:_functions+=['TestFunction']

function s:testFunction()
    echo 2
endfunction
let s:_functions+=['s:testFunction']
