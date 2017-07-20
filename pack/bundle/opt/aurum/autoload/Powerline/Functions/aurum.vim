execute frawor#Setup('0.0', {'@%aurum': '0.1',
            \        '@%aurum/bufvars': '0.0',})
function Powerline#Functions#aurum#GetBranch(symbol)
    let r=aurum#branch()
    return empty(r) ? '' : a:symbol.' '.r
endfunction
let s:_functions+=['Powerline#Functions#aurum#GetBranch']
function Powerline#Functions#aurum#GetStatus()
    let r=aurum#status()
    return (empty(r) || r is# 'clean') ? '' : toupper(r[0])
endfunction
let s:_functions+=['Powerline#Functions#aurum#GetStatus']
function Powerline#Functions#aurum#GetRepoPath()
    let repo=aurum#repository()
    return empty(repo) ? '' : fnamemodify(repo.path, ':~')
endfunction
let s:_functions+=['Powerline#Functions#aurum#GetRepoPath']
function Powerline#Functions#aurum#GetOptions()
    return get(get(s:_r.bufvars, bufnr('%'), {}), 'ploptions', '')
endfunction
let s:_functions+=['Powerline#Functions#aurum#GetOptions']
function Powerline#Functions#aurum#GetProgress()
    if !exists('b:aurum_log_progress')
        return ''
    endif
    return printf('%-*s %3d%%', winwidth(0)-b:aurum_log_reservedwidth,
                \               repeat('#', b:aurum_log_barwidth),
                \               b:aurum_log_progress)
endfunction
let s:_functions+=['Powerline#Functions#aurum#GetProgress']
