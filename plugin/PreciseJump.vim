"
" PreciseJump aka '[count] motion' on drugs
"
" required vim 7.2+
"
" author: Bartlomiej Podolak <bartlomiej (a) gmail com>

"
" TODO: W over multiple lines ?
" TODO: find & highlight only on visible text - not whole line ?
" TODO: customise target markers 'a'..'z' vs. 1 .. 9 vs. most convinient keys
"       on keyboard
" TODO: make it work as custom motion (:omap)
" TODO: handle Jump('.') better; maximum numer of marked targets?
" TODO: investigate what happens when user doesn't have highilithasdfasdts on
" TODO: should we search for a match in whole line or starting from cursor
"       position

" TODO: function shouldn't affect undo list
" DONE: make it work on 'not modifable' buffers
" DONE: ctrl-c during Fc execution can leave a mess
" DONE: check if match_rule can contain \\%_l only once
"

if exists('s:mdod_loaded')
    finish
endif

let s:mdod_loaded = 1

if version >= 702


if !exists('g:cmodMatchTargetHi')
    let g:cmodMatchTargetHi = 'ErrorMsg'
endif
if !exists('g:cmodMatchTargetShade')
    let g:cmodMatchTargetShade = 'String'
endif

let g:cmodShade = 0

function! JumpW()
    call Jump('\s\@<=[^\t\n ]', 1)
endfunction

function! JumpE()
    call Jump('[^\t\n ][\t\n ]', 1)
endfunction

function! JumpF()
    let re = nr2char( getchar() )
    call Jump(re, 1)
endfunction

function! JumpT()
    let re = '.' . nr2char( getchar() )
    call Jump(re, 1)
endfunction

" jump to n-th char in current line
function! JumpToChar(n)
    let ve = &virtualedit
    setl virtualedit=""
    normal! "0|"
    let n = a:n - 1
    execute "normal! " . n . "l"
    execute "silent setl virtualedit=" . ve
endfunction

" return lists of targets where re matches in line
function! FindTargets(re, line, start_column)
    let targets = []
    let column = match(a:line, a:re, a:start_column)
    while column != -1
        call add(targets, column + 1)
        let column = match(a:line, a:re, column + 1)
    endwhile
    return targets
endfunction

function! Jump(re, ...)
    let targets = {}
    let start_ch = char2nr('a')
    let re = a:re

    let org_line = getline('.')
    let line_arr = split(org_line, '\zs')
    let iter_count = 0
    let start_column = ( a:0 > 0 ? col('.') : 0 ) "FIXME

    let targets_list = FindTargets(re, org_line, start_column)

    " create targets hash + line with markers
    for t in targets_list
        let targets[ nr2char(start_ch + iter_count) ] = t
        let line_arr[t - 1] = nr2char(start_ch + iter_count)
        let iter_count += 1
    endfor

    if len(targets) == 1
        call JumpToChar(targets[nr2char(start_ch)])
    elseif len(targets) > 0
        let match_rule = join( map( values(targets), ' "\\%" . v:val . "c" ' ), '\|' )
        let match_rule = '\%' . line('.') . 'l\(' . match_rule . '\)'

        " fun
        if g:cmodShade
            let shade_rule = '\%<' . line('.') . 'l\|\%>' . line('.') . 'l'
        endif

        let c = ''
        let modifiable = &modifiable
        let readonly = &readonly
        try
            let match_id = matchadd(g:cmodMatchTargetHi, match_rule, -1)
            if g:cmodShade
                let shade_id = matchadd(g:cmodMatchTargetShade, shade_rule, -1)
            endif
            if modifiable == 0
                silent setl modifiable
            endif
            if readonly == 1
                silent setl noreadonly
            endif
            call setline('.', join(line_arr, ''))
            redraw
            echo "Fc(" . re . ") [" . join( keys(targets), '') . "] ?"
            let c = nr2char( getchar() )
        finally
            "call setline('.', org_line)
            silent normal! u
            call matchdelete(match_id)
            if g:cmodShade
                call matchdelete(shade_id)
            endif
            if c != '' && has_key(targets, c)
                call JumpToChar(targets[c])
            endif
            if modifiable == 0
                silent setl nomodifiable
            endif
            if readonly == 1
                silent setl readonly
            endif
        endtry
    else
    endif
    echo
endfunction

nmap _f :call JumpF()<cr>
nmap _w :call JumpW()<cr>
nmap _e :call JumpE()<cr>
nmap _t :call JumpT()<cr>

" Are you brave enough to uncomment those?
"nmap f :call JumpF()<cr>
"nmap w :call JumpW()<cr>
"nmap e :call JumpE()<cr>
"nmap t :call JumpT()<cr>

"" !! EXPERIMENTAL !!
" omap _f :call JumpF()<cr>
" omap _w :call JumpW()<cr>
" omap _t :call JumpT()<cr>

endif " if version >= 702
