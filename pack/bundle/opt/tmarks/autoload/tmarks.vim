" tmarks.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2009-03-29.
" @Last Change: 2013-09-25.
" @Revision:    0.0.135


if !exists('g:tmarks_handlers') "{{{2
    let g:tmarks_handlers = [
            \ {'key':  4, 'agent': 'tmarks#AgentDeleteMark', 'key_name': '<c-d>', 'help': 'Delete mark'},
            \ ]
            " \ {'pick_last_item': 0},
endif


function! s:UpdateQFS() "{{{3
    if !exists('*QuickfixsignsUpdate')
                \ || index(keys(g:quickfixsigns_lists), 'marks') == -1
                \ || exists("b:noquickfixsigns")
                \ || expand('%:t') =~ g:quickfixsigns_blacklist_buffer
                \ || (exists('b:quickfixsigns_ignore') && index(b:quickfixsigns_ignore, 'marks') != -1)
        return
    endif
    call QuickfixsignsUpdate('marks')
endf


" :nodoc:
function! tmarks#AgentDeleteMark(world, selected) "{{{3
    for l in a:selected
        call s:DelMark(s:GetMark(l))
    endfor
    call s:UpdateQFS()
    let a:world.base  = s:GetList()
    let a:world.state = 'display'
    return a:world
endf


function! s:DelMark(m) "{{{3
    exec 'delmarks '. escape(a:m, '"\')
endf


function! s:GetList() "{{{3
    return tlib#cmd#OutputAsList('marks')[1:-1]
endf


function! s:GetLocalMarks(key_is_mark) "{{{3
    let local_marks = s:GetList()
    call filter(local_marks, 'v:val =~ '' \l ''')
    let marks = {}
    for line in local_marks
        let ml = matchlist(line, '^\s\(\l\)\s\+\(\d\+\)')[1:2]
        if !empty(ml)
            let marks[ml[!a:key_is_mark]] = ml[!!a:key_is_mark]
        endif
    endfor
    return marks
endf


function! s:GetMark(line) "{{{3
    return matchstr(a:line, '^ \+\zs\S')
endf


" :nodoc:
function! tmarks#List() "{{{3
    keepjumps let m = tlib#input#List('s', 'Marks', s:GetList(), g:tmarks_handlers)
    if !empty(m)
        exec 'norm! `'. s:GetMark(m)
    endif
endf


" Delete all (lower-case) marks at the specified line.
" :display: tmarks#DeleteInRange(?line1=line('.'), ?line2=line('.'))
" :nodoc:
function! tmarks#DeleteInRange(...) "{{{3
    TVarArg ['line1', line('.')], ['line2', line('.')]
    for [line, mark] in items(s:GetLocalMarks(0))
        if line >= line1 && line <= line2
            call s:DelMark(mark)
        endif
    endfor
    call s:UpdateQFS()
endf


" Delete all (lower-case) marks for the current buffer.
" :nodoc:
function! tmarks#DeleteAllMarks() "{{{3
    for mark in keys(s:GetLocalMarks(1))
        call s:DelMark(mark)
    endfor
    call s:UpdateQFS()
endf


let s:local_marks = split('abcdefghijklmnopqrstuvwxyz', '\zs')


" :display: tmarks#ToggleMarkAtLine(?line='.')
" Toggle the mark at line.
function! tmarks#ToggleMarkAtLine(...) "{{{3
    TVarArg ['line', line('.')]
    if line =~ '^\.\?$'
        let line = line('.')
    endif
    let lines = s:GetLocalMarks(0)
    " TLogVAR lines, marks
    if has_key(lines, line)
        let mark = lines[line]
        call s:DelMark(mark)
        echom 'Remove mark' mark 'at line' line
        call s:UpdateQFS()
        return
    else
        let marks = s:GetLocalMarks(1)
        for mark in s:local_marks
            if !has_key(marks, mark)
                exec line .'mark '. mark
                echom 'Set mark' mark 'at line' line
                call s:UpdateQFS()
                return
            endif
        endfor
    endif
    echohl Error
    echom 'TMarks: No mark available'
    echohl None
endf


function! tmarks#Next(count) "{{{3
    let cul = line('.')
    " TLogVAR a:count, cul
    let lines = keys(s:GetLocalMarks(0))
    if !empty(lines)
        call map(lines, 'printf("%99s", v:val)')
        call sort(lines)
        call map(lines, '0 + matchstr(v:val, ''\d\+'')')
        " TLogVAR lines
        if a:count > 0
            let lines = filter(copy(lines), 'v:val > cul')
                        \ + filter(copy(lines), 'v:val <= cul')
            exec lines[(a:count - 1) % len(lines)]
        elseif a:count < 0
            let lines = reverse(filter(copy(lines), 'v:val < cul'))
                        \ + reverse(filter(copy(lines), 'v:val >= cul'))
            exec lines[(-a:count - 1) % len(lines)]
        endif
    endif
endf


