" toptions.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=vim-toptions)
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-04-02.
" @Last Change: 2010-09-12.
" @Revision:    0.1.20

if &cp || exists("loaded_toptions")
    finish
endif
let loaded_toptions = 1

"""""""" Custom Options.  {{{1

if !exists('g:toptions_timefmt')
    " A string for |strftime()|. If empty, don't display a time stamp in the status line.
    let g:toptions_timefmt = ''   "{{{2
    " let g:toptions_timefmt = '%d-%b-%Y %H:%M'
endif

let g:toptions = {}
let g:toptions_etc = []
let g:toptions_labels = {
            \ 'fdl': 'F', 
			\ }
			" \ 'et': {'type': 'bool'},
			" \ 'bin': {'type': 'bool'},
			" \ 'ai': {'type': 'bool'},

fun s:SetOptionLabel(option, field, value)
    if !has_key(g:toptions_labels, a:option)
        let g:toptions_labels[a:option] = {}
    endif
    let g:toptions_labels[a:option][a:field] = a:value
endf

fun! TResetOptions(options)
    if empty(a:options)
        let options = keys(g:toptions)
    else
        let options = a:options
    endif
    for name in options
        exec 'let &'. name .' = g:toptions[name]'
    endfor
endf

command! -nargs=* -bar TResetOptions :call TResetOptions([<f-args>])
command! -nargs=+ TSet let s:tmlargs=[<f-args>] 
            \ | for arg in s:tmlargs[1:-1]
                \ | if arg =~ '^[+-]\?='
                    \ | exec 'set '.s:tmlargs[0] . arg
                \ | elseif arg =~ '^:='
                    \ | call s:SetOptionLabel(s:tmlargs[0], 'type', 'bool')
                    \ | if arg =~ '^:=yes'
                        \ | exec 'set '.s:tmlargs[0]
                    \ | elseif arg =~ ':=no'
                        \ | exec 'set no'.s:tmlargs[0]
                    \ | endif
                \ | else
                    \ | exec 'let &'.s:tmlargs[0] .'='. arg
                \ | endif
            \ | endfor
            \ | exec 'let g:toptions[s:tmlargs[0]] = &'. s:tmlargs[0]
            \ | unlet s:tmlargs
" TSet cpo +=my -=M
" TSet ts 4
" TSet tw

" Diese Funktion wird von der Statuszeile gebraucht - da sie nur hier
" und sonst nirgends gebraucht wird, ist sie hier (sonst gehörte sie
" zu den Makros). Diese Funktion gibt in einem String zurück, welche
" der hier ausgewählten Funktionen gesetzt sind -> sieht nett aus, auf
" der Statuszeile.
fun! TOptionsSummary(...)
    let opt = "<". &syntax ."/". &fileformat .">"

    for [o, v] in items(g:toptions)
        exec 'let ov = &'.o
        if ov != v
            let type = ''
            if has_key(g:toptions_labels, o)
                let ol = g:toptions_labels[o]
				if type(ol) == 3 && type(o) == 0
                    let lab  = get(ol, o, '')
                elseif type(ol) == 4
					let type = get(ol, 'type', '')
					let lab  = get(ol, 'label', '')
				else
					let lab = ol
				endif
                unlet ol
            else
                let lab = o.'='
            endif
            if type == 'bool'
                if empty(lab)
                    " let opt .= ' ['. (ov ? '' : 'no') . o .']'
                    let opt .= ' '. (ov ? '+' : '-') . o
                else
                    let opt .= ' '. lab
                endif
            else
                let opt .= ' '. lab . ov
            endif
        endif
    endfor

    for o in g:toptions_etc
        exec o
    endfor
    " if &co > 80
    if !empty(g:toptions_timefmt)
        let opt=opt." | ".strftime(a:0 >= 1 ? a:1 : g:toptions_timefmt)
    endif
    return opt
endf


let g:tstatusline1='%1*[%{winnr()}:%02n]%* %2t %(%M%R%H%W%k%) %=%{TOptionsSummary()} %3*<%l,%c%V,%p%%>%*'
let g:tstatusline0='%1*[%{winnr()}:%02n]%* %2t %(%M%R%H%W%k%) %=%3*<%l,%c%V,%p%%>%*'

" let g:trulerformat1='%-010.25(%Y%M%R %lx%c%V %P%)'
" let g:trulerformat1='%-010.25(%M%R %lx%c%V %P%)'
" let g:trulerformat1='%-010.25(B%n%R%M%W %lx%c%V %P%)'
let g:trulerformat1='%-010.25(%lx%c%V %P%R%M%W%)'
let g:trulerformat0=&rulerformat
" set rulerformat=%60(%=%{TmlStatusline('%H:%M')}\ %3*<%l,%c%V,%p%%>%*%)

command! -bang TStatus let statussel=empty("<bang>")
            \ | let &statusline  = g:tstatusline{statussel}
            \ | let &rulerformat = g:trulerformat{statussel}
            \ | unlet statussel


if has('vim_starting')
    augroup TOptions
        autocmd!
        autocmd VimEnter * TStatus
    augroup END
else
    TStatus
endif

