" This scheme was created by CSApproxSnapshot
" on Thu, 27 May 2010

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=188 gui=NONE guibg=#2e3436 guifg=#d3d7cf
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#f57900
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=172 ctermfg=255 gui=NONE guibg=#ce5c00 guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=102 gui=bold guibg=#2e3436 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=228 ctermfg=178 gui=reverse guibg=#c4a000 guifg=#fce94f
    CSAHi Search term=reverse cterm=NONE ctermbg=228 ctermfg=178 gui=NONE guibg=#fce94f guifg=#c4a000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=172 gui=bold guibg=bg guifg=#ce5c00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=172 gui=bold guibg=bg guifg=#ce5c00
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=188 ctermfg=102 gui=NONE guibg=#babdb6 guifg=#555753
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=NONE guibg=#eeeeec guifg=#2e3436
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#212628 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=#aabbcc
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=59 gui=NONE guibg=#555753 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=59 gui=NONE guibg=#555753 guifg=#2e3436
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=215 ctermfg=172 gui=NONE guibg=#fcaf3e guifg=#ce5c00
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#555753
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#888a85
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=172 gui=bold guibg=bg guifg=#ce5c00
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#2e3436 guifg=#d3d7cf
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#f57900
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=208 ctermfg=255 gui=NONE guibg=#ce5c00 guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=102 gui=bold guibg=#2e3436 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=228 ctermfg=220 gui=reverse guibg=#c4a000 guifg=#fce94f
    CSAHi Search term=reverse cterm=NONE ctermbg=228 ctermfg=220 gui=NONE guibg=#fce94f guifg=#c4a000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=208 gui=bold guibg=bg guifg=#ce5c00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=208 gui=bold guibg=bg guifg=#ce5c00
    CSAHi LineNr term=underline cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=188 ctermfg=102 gui=NONE guibg=#babdb6 guifg=#555753
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=NONE guibg=#eeeeec guifg=#2e3436
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#212628 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#aabbcc
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=59 gui=NONE guibg=#555753 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=59 gui=NONE guibg=#555753 guifg=#2e3436
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=221 ctermfg=208 gui=NONE guibg=#fcaf3e guifg=#ce5c00
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#555753
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#babdb6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#888a85
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=208 gui=bold guibg=bg guifg=#ce5c00
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=188 gui=NONE guibg=#2e3436 guifg=#d3d7cf
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#f57900
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=166 ctermfg=255 gui=NONE guibg=#ce5c00 guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi NonText term=bold cterm=bold ctermbg=23 ctermfg=59 gui=bold guibg=#2e3436 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=221 ctermfg=178 gui=reverse guibg=#c4a000 guifg=#fce94f
    CSAHi Search term=reverse cterm=NONE ctermbg=221 ctermfg=178 gui=NONE guibg=#fce94f guifg=#c4a000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=166 gui=bold guibg=bg guifg=#ce5c00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=166 gui=bold guibg=bg guifg=#ce5c00
    CSAHi LineNr term=underline cterm=NONE ctermbg=23 ctermfg=59 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=145 ctermfg=59 gui=NONE guibg=#babdb6 guifg=#555753
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=255 ctermfg=23 gui=NONE guibg=#eeeeec guifg=#2e3436
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#212628 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=145 ctermfg=23 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#aabbcc
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=17 gui=NONE guibg=#555753 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=23 gui=NONE guibg=#555753 guifg=#2e3436
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=215 ctermfg=166 gui=NONE guibg=#fcaf3e guifg=#ce5c00
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=145 ctermfg=23 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#555753
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#babdb6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=102 gui=bold guibg=bg guifg=#888a85
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=166 gui=bold guibg=bg guifg=#ce5c00
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=23 ctermfg=59 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=21 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=86 gui=NONE guibg=#2e3436 guifg=#d3d7cf
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#f57900
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=52 ctermfg=87 gui=NONE guibg=#ce5c00 guifg=#eeeeec
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=81 gui=bold guibg=#2e3436 guifg=#555753
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=77 ctermfg=52 gui=reverse guibg=#c4a000 guifg=#fce94f
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=52 gui=NONE guibg=#fce94f guifg=#c4a000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=#ce5c00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=#ce5c00
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=85 ctermfg=81 gui=NONE guibg=#babdb6 guifg=#555753
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#eeeeec guifg=#2e3436
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#212628 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=85 ctermfg=80 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=42 gui=bold guibg=bg guifg=#aabbcc
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=81 ctermfg=80 gui=NONE guibg=#555753 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=81 ctermfg=80 gui=NONE guibg=#555753 guifg=#2e3436
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=87 gui=bold guibg=bg guifg=#eeeeec
    CSAHi Visual term=reverse cterm=NONE ctermbg=72 ctermfg=52 gui=NONE guibg=#fcaf3e guifg=#ce5c00
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=#555753 guifg=#eeeeec
    CSAHi lCursor term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=85 ctermfg=80 gui=NONE guibg=#babdb6 guifg=#2e3436
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#555753
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#babdb6
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#ce5c00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#888a85
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#eeeeec
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=#ce5c00
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=#2e3436 guifg=#555753
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=LightBlue guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=63 ctermfg=19 gui=bold guibg=LightCyan guifg=Blue
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
