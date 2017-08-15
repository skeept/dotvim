" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2010-01-03.
" @Last Change: 2017-08-13.
" @Revision:    12


if !exists('loaded_tlib') || loaded_tlib < 124
    echoerr 'tlib >= 1.24 is required'
    finish
endif

if exists(':Tlibtrace') != 2
    command! -nargs=+ -bang Tlibtrace :
endif


" Editing numbered registers doesn't make much sense as they change when 
" calling |:TRegister|.
TLet g:tregisters_ro = '~:.%#0123456789'

if !exists('g:tregisters_handlers') "{{{2
    let g:tregisters_handlers = [
            \ {'key':  5, 'agent': 'tregisters#AgentEditRegister', 'key_name': '<c-e>', 'help': 'Edit register'},
            \ {'key': 17, 'agent': 'tregisters#AgentRunRegister', 'key_name': '<c-q>', 'help': 'Run register'},
            \ {'pick_last_item': 0},
            \ {'return_agent': 'tregisters#ReturnAgent'},
            \ ]
endif


function! s:GetRegisters(...) "{{{3
    let regs = a:0 >= 1 && !empty(a:1) ? (' '. a:1) : ''
    let registers = tlib#cmd#OutputAsList('registers'.regs)
    call filter(registers, 'v:val =~ ''^"''')
    call map(registers, 'substitute(v:val, ''\s\+'', " ", "g")')
    return registers
endf


function! tregisters#AgentEditRegister(world, selected) "{{{3
    let reg = a:selected[0][1]
    if stridx(g:tregisters_ro, reg) == -1
        let world  = tlib#agent#Suspend(a:world, a:selected)
        let regval = getreg(reg)
        keepalt let world = tlib#input#EditW(world, 'Registers', regval, 'tregisters#EditCallback', [reg])
        return world
    else
        echom 'Read-only register'
        let a:world.state = 'redisplay'
        return a:world
    endif
endf


function! tregisters#AgentRunRegister(world, selected) "{{{3
    let sb = a:world.SwitchWindow('win')
    try
        for r in a:selected
            let rr = r[1]
            if stridx('%#=', rr) == -1
                exec 'norm! @'. rr
            endif
        endfor
    finally
        exec sb
    endtry
    let a:world.state = 'redisplay'
    return a:world
endf


function! tregisters#EditCallback(register, ok, text, world) "{{{3
    Tlibtrace "tregisters", a:register, a:ok, a:text
    if a:ok
        Tlibtrace "tregisters", g:tregisters_ro
        if stridx(g:tregisters_ro, a:register) == -1
            let success = setreg(a:register, a:text)
            Tlibtrace "tregisters", success, winnr(), win_getid(), bufnr('%')
            let a:world.base = s:GetRegisters()
            let a:world.state = 'display'
        else
            echom 'Read-only register'
        endif
    endif
    " call tlib#input#Resume("world", 0, a:world.scratch)
endf


function! tregisters#ReturnAgent(world, selected) "{{{3
    Tlibtrace "tregisters", a:selected
    if !empty(a:selected)
        let reg = a:selected[0][1]
        Tlibtrace "tregisters", reg
        exec 'put '. reg
    endif
endf


function! tregisters#List(...) "{{{3
    let regs = a:0 >= 1 ? a:1 : ''
    let s:registers = s:GetRegisters(regs)
    call tlib#input#List('s', 'Registers', s:registers, g:tregisters_handlers)
endf

