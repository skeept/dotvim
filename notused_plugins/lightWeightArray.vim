"
" Simple read-only array operations. Designed to be light-weight. Can be used
"  with Vim multivalued variables such as, tags, to extract the parts.
"

:function! NextIndex (string, pat, startPos)
:  " Because match () behaves this way.
:  if a:startPos < 0
:    let a:startPos = 0
:  endif
:  let remainingString = strpart (a:string, a:startPos, strlen (a:string))
:  let index = match (remainingString, a:pat)
:  if index != -1
:    let index = index + a:startPos
:  endif
:  return index
:endfunction 

:function! NextElement (array, sep, prevIndex)
:  if a:prevIndex == 0
:    let nextPos =  a:prevIndex
:  else
:    let nextPos =  a:prevIndex + strlen (a:sep)
:  endif
:  let nextIndex = NextIndex (a:array, a:sep, nextPos)
:  if nextIndex == -1 && (a:prevIndex + strlen (a:sep) < strlen (a:array))
:    let nextIndex = strlen (a:array) + 1
:  endif
:  if nextIndex != -1
:    return strpart (a:array, nextPos, (nextIndex - nextPos))
:  endif
:endfunction

" Test function.
" :function! PrintAll (array, sep)
" :  let prevIndex = 0
" :  let elementCount = 0
" :  while prevIndex != -1
" :    call input ("element (" . elementCount . ") = " . NextElement (a:array, a:sep, prevIndex))
" :    let prevIndex = NextIndex (a:array, a:sep, prevIndex + 1)
" :    let elementCount = elementCount + 1
" :  endwhile
" :endfunction

