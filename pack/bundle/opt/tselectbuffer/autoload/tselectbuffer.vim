" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    59

" call tlog#Log('Load: '. expand('<sfile>')) " vimtlib-sfile

if !exists('loaded_tlib') || loaded_tlib < 127
    echoerr 'tlib >= 1.27 is required'
    finish
endif


function! s:SNR() abort
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSNR$')
endf


" For possible values please see the documentation of 
" |tlib#buffer#GetList()|'s order argument.
TLet g:tselectbuffer#order = 'mru'

" If non-null, automatically pick the last item in the list. I.e. if you 
" start typing a name and there is only one item left matching that name 
" it is automatically picked and you don't have to type <cr>.
TLet g:tselectbuffer#autopick = 1


if !exists('g:tselectbuffer#handlers')
    let g:tselectbuffer#handlers = [
                \ {'key':  4, 'agent': s:SNR().'AgentDeleteBuffer', 'key_name': '<c-d>', 'help': 'Delete buffer(s)'},
                \ {'key': 21, 'agent': s:SNR().'AgentRenameBuffer', 'key_name': '<c-u>', 'help': 'Rename buffer(s)'},
                \ {'key': 19, 'agent': s:SNR().'AgentSplitBuffer',  'key_name': '<c-s>', 'help': 'Show in split window'},
                \ {'key': 20, 'agent': s:SNR().'AgentTabBuffer',    'key_name': '<c-t>', 'help': 'Show in tab'},
                \ {'key': 22, 'agent': s:SNR().'AgentVSplitBuffer', 'key_name': '<c-v>', 'help': 'Show in vsplit window'},
                \ {'key': 23, 'agent': s:SNR().'AgentOpenBufferInWindow',   'key_name': '<c-w>', 'help': 'View in current window'},
                \ {'return_agent': s:SNR() .'AgentGotoBuffer'},
                \ ]
    if !g:tselectbuffer#autopick
        call add(g:tselectbuffer#handlers, {'pick_last_item': 0})
    endif
endif

function! s:PrepareSelectBuffer() abort
    let [s:selectbuffer_nr, s:selectbuffer_list] = tlib#buffer#GetList(s:selectbuffer_hidden, 1, g:tselectbuffer#order)
    if g:tselectbuffer#order ==# 'mru'
        let s:selectbuffer_alternate_n = len(s:selectbuffer_nr) > 1 ? 2 : 1
    else
        let s:selectbuffer_alternate_n = 0
        for b in s:selectbuffer_list
            let s:selectbuffer_alternate_n -= 1
            if b =~# '^\s*\d\+\s\+#'
                let s:selectbuffer_alternate_n = -s:selectbuffer_alternate_n
                break
            endif
        endfor
        if s:selectbuffer_alternate_n < 0
            let s:selectbuffer_alternate_n = 0
        endif
    endif
    return s:selectbuffer_list
endf


function! s:GetBufNr(buffer) abort
    " TLogVAR a:buffer
    let bi = index(s:selectbuffer_list, a:buffer)
    " TLogVAR bi
    let bx = s:selectbuffer_nr[bi]
    " TLogVAR bx
    return bx
endf


function! s:RenameThisBuffer(buffer) abort
    let bx = s:GetBufNr(a:buffer)
    let on = bufname(bx)
    let nn = input('Rename buffer: ', on)
    if !empty(nn) && nn != on
        exec 'buffer '. bx
        if filereadable(on) && &buftype !~# '\<nofile\>'
            " if filewritable(nn)
                call rename(on, nn)
                echom 'Rename file: '. on .' -> '. nn
            " else
            "     echoerr 'File cannot be renamed: '. nn
            " endif
        endif
        exec 'file! '. escape(nn, ' %#')
        echom 'Rename buffer: '. on .' -> '. nn
        return 1
    endif
    return 0
endf


function! s:AgentRenameBuffer(world, selected) abort
    call a:world.CloseScratch()
    for buffer in a:selected
        call s:RenameThisBuffer(buffer)
    endfor
    let a:world.state = 'reset'
    let a:world.base  = s:PrepareSelectBuffer()
    " let a:world.index_table = s:selectbuffer_nr
    return a:world
endf


function! s:DeleteThisBuffer(buffer) abort
    let bx = s:GetBufNr(a:buffer)
    if s:delete_this_buffer_default =~# '^a'
        let doit = 'y'
    else
        call inputsave()
        let doit = input('Delete buffer "'. bufname(bx) .'"? (yes/Yes/no/None/all) ', s:delete_this_buffer_default)
        call inputrestore()
    endif
    if doit =~? '^\(y\%[es]\|a\%[ll]\)$'
        if doit =~# '^Y' || doit =~# '^a'
            let s:delete_this_buffer_default = doit
        endif
        if bufloaded(bx)
            exec 'bdelete '. bx
            echom 'Delete buffer '. bx .': '. a:buffer
        else
            exec 'bwipeout '. bx
            echom 'Wipe out buffer '. bx .': '. a:buffer
        end
    elseif doit =~# '^N\%[one]$'
        return 0
    endif
    return 1
endf


function! s:AgentDeleteBuffer(world, selected) abort
    call a:world.CloseScratch(0)
    let s:delete_this_buffer_default = ''
    for buffer in a:selected
        " TLogVAR buffer
        if !s:DeleteThisBuffer(buffer)
            break
        endif
    endfor
    let a:world.state = 'reset'
    let a:world.base  = s:PrepareSelectBuffer()
    " let a:world.index_table = s:selectbuffer_nr
    return a:world
endf


function! s:GetBufferNames(selected) abort "{{{3
    return map(copy(a:selected), 'fnamemodify(bufname(s:GetBufNr(v:val)), ":p")')
endf


function! s:AgentSplitBuffer(world, selected) abort
    return tlib#agent#EditFileInSplit(a:world, s:GetBufferNames(a:selected))
endf


function! s:AgentVSplitBuffer(world, selected) abort
    return tlib#agent#EditFileInVSplit(a:world, s:GetBufferNames(a:selected))
endf


function! s:AgentOpenBufferInWindow(world, selected) abort
    return tlib#agent#ViewBufferInWindow(a:world, s:GetBufferNames(a:selected))
endf


function! s:AgentTabBuffer(world, selected) abort
    return tlib#agent#EditFileInTab(a:world, s:GetBufferNames(a:selected))
endf


function! s:AgentGotoBuffer(world, selected) abort "{{{3
    call a:world.CloseScratch(1)
    for b in a:selected
        let bi = s:GetBufNr(b)
        let bn = bufname(bi)
        if empty(bn)
            exec 'buffer' bi
        else
            call tlib#file#Edit(bn)
        endif
    endfor
    call a:world.SetOrigin()
    return a:world
endf


function! tselectbuffer#Select(show_hidden) abort
    let s:selectbuffer_hidden = a:show_hidden
    let bs  = s:PrepareSelectBuffer()
    let bhs = copy(g:tselectbuffer#handlers)
    " call add(bhs, {'index_table': s:selectbuffer_nr})
    if !empty(s:selectbuffer_alternate_n)
        call add(bhs, {'initial_index': s:selectbuffer_alternate_n})
    endif
    let msg = printf('Select buffer (%s)', g:tselectbuffer#order)
    let b = tlib#input#List('m', msg, bs, bhs)
endf

