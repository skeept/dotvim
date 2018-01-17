" Generic postprocessor to add `length` to `a:entry`.
" The pattern can be overridden on `self`, and should adhere to this:
"  - the matched word should be returned as the whole match (you can use \zs
"    and \ze).
"  - enclosing patterns should be returned as \1 and \2, where \1 is used as
"    offset when the first entry did not match.
" See tests/postprocess.vader for tests/examples.
function! neomake#postprocess#generic_length(entry) abort dict
    if a:entry.bufnr == bufnr('%') && a:entry.lnum > 0 && a:entry.col
        let pattern = get(self, 'pattern', '\v(["''`])\zs[^\1]{-}\ze(\1)')
        let start = 0
        let best = 0
        while 1
            let m = matchlist(a:entry.text, pattern, start)
            if empty(m)
                break
            endif
            let l = len(m[0])
            if l > best
                " Ensure that the text is there.
                if getline(a:entry.lnum)[a:entry.col-1 : a:entry.col-2+l] == m[0]
                    let best = l
                endif
            endif
            if exists('*matchstrpos')  " vim73
                let pos = matchstrpos(a:entry.text, pattern, start)
                if pos[1] == -1
                    break
                endif
                let start += pos[2] + len(m[2])
            else
                break
            endif
        endwhile
        if best
            let a:entry.length = best
        endif
    endif
endfunction

" Deprecated: renamed to neomake#postprocess#generic_length.
function! neomake#postprocess#GenericLengthPostprocess(entry) abort dict
    return neomake#postprocess#generic_length(a:entry)
endfunction

function! neomake#postprocess#compress_whitespace(entry) abort
    let text = a:entry.text
    let text = substitute(text, "\001", '', 'g')
    let text = substitute(text, '\r\?\n', ' ', 'g')
    let text = substitute(text, '\m\s\{2,}', ' ', 'g')
    let text = substitute(text, '\m^\s\+', '', '')
    let text = substitute(text, '\m\s\+$', '', '')
    let a:entry.text = text
endfunction
