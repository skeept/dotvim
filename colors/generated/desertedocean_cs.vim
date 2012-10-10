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
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=225 gui=NONE guibg=#122130 guifg=#FFE0FA
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00CCBB
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=66 gui=bold guibg=#2A374A guifg=#285960
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=109 ctermfg=223 gui=reverse guibg=#FFDFB0 guifg=slategrey
    CSAHi Search term=reverse cterm=NONE ctermbg=109 ctermfg=224 gui=NONE guibg=slategrey guifg=#FFDABB
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#00AACC
    CSAHi LineNr term=underline cterm=NONE ctermbg=31 ctermfg=195 gui=NONE guibg=#006688 guifg=#CCF0FF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=110 gui=NONE guibg=#222f3d guifg=#6Aa0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=38 ctermfg=231 gui=NONE guibg=#0088bb guifg=#FFFFFF
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=225 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=225 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=31 ctermfg=44 gui=NONE guibg=#007799 guifg=#00D0D0
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=#AABBCC
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=39 ctermfg=232 gui=NONE guibg=#00A5EA guifg=#050709
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=31 ctermfg=59 gui=NONE guibg=#1079B0 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=187 ctermfg=244 gui=NONE guibg=#c2bfa5 guifg=grey50
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#00aBdF
    CSAHi Visual term=reverse cterm=NONE ctermbg=81 ctermfg=38 gui=NONE guibg=#33DFEF guifg=#008FBF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=67 ctermfg=188 gui=NONE guibg=#337799 guifg=#BBDDCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=225 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6Aa0e0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=#EE8aB5
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8cf0ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#FFe0bd
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#eF7a7a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=211 gui=NONE guibg=bg guifg=#FF7A9a
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=181 gui=bold guibg=bg guifg=#dAa0b0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=67 ctermfg=45 gui=NONE guibg=#337799 guifg=#00CCFF
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#122130 guifg=#FFE0FA
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=208 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=50 gui=NONE guibg=bg guifg=#00CCBB
    CSAHi NonText term=bold cterm=bold ctermbg=60 ctermfg=66 gui=bold guibg=#2A374A guifg=#285960
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=145 ctermfg=230 gui=reverse guibg=#FFDFB0 guifg=slategrey
    CSAHi Search term=reverse cterm=NONE ctermbg=145 ctermfg=230 gui=NONE guibg=slategrey guifg=#FFDABB
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00AACC
    CSAHi LineNr term=underline cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#006688 guifg=#CCF0FF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=117 gui=NONE guibg=#222f3d guifg=#6Aa0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=38 ctermfg=255 gui=NONE guibg=#0088bb guifg=#FFFFFF
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=38 ctermfg=51 gui=NONE guibg=#007799 guifg=#00D0D0
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#AABBCC
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=45 ctermfg=232 gui=NONE guibg=#00A5EA guifg=#050709
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=38 ctermfg=59 gui=NONE guibg=#1079B0 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=224 ctermfg=145 gui=NONE guibg=#c2bfa5 guifg=grey50
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00aBdF
    CSAHi Visual term=reverse cterm=NONE ctermbg=87 ctermfg=38 gui=NONE guibg=#33DFEF guifg=#008FBF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=74 ctermfg=195 gui=NONE guibg=#337799 guifg=#BBDDCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#6Aa0e0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=#EE8aB5
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8cf0ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#FFe0bd
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=217 gui=bold guibg=bg guifg=#eF7a7a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=#FF7A9a
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=224 gui=bold guibg=bg guifg=#dAa0b0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=74 ctermfg=51 gui=NONE guibg=#337799 guifg=#00CCFF
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=225 gui=NONE guibg=#122130 guifg=#FFE0FA
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#00CCBB
    CSAHi NonText term=bold cterm=bold ctermbg=23 ctermfg=23 gui=bold guibg=#2A374A guifg=#285960
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=66 ctermfg=223 gui=reverse guibg=#FFDFB0 guifg=slategrey
    CSAHi Search term=reverse cterm=NONE ctermbg=66 ctermfg=223 gui=NONE guibg=slategrey guifg=#FFDABB
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#00AACC
    CSAHi LineNr term=underline cterm=NONE ctermbg=24 ctermfg=195 gui=NONE guibg=#006688 guifg=#CCF0FF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=17 ctermfg=74 gui=NONE guibg=#222f3d guifg=#6Aa0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#0088bb guifg=#FFFFFF
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=225 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=225 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=30 ctermfg=44 gui=NONE guibg=#007799 guifg=#00D0D0
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#AABBCC
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=38 ctermfg=232 gui=NONE guibg=#00A5EA guifg=#050709
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=31 ctermfg=17 gui=NONE guibg=#1079B0 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=244 gui=NONE guibg=#c2bfa5 guifg=grey50
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#00aBdF
    CSAHi Visual term=reverse cterm=NONE ctermbg=81 ctermfg=31 gui=NONE guibg=#33DFEF guifg=#008FBF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=66 ctermfg=152 gui=NONE guibg=#337799 guifg=#BBDDCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=225 ctermfg=17 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#6Aa0e0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=211 gui=NONE guibg=bg guifg=#EE8aB5
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#8cf0ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#FFe0bd
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#eF7a7a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#FF7A9a
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=181 gui=bold guibg=bg guifg=#dAa0b0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=66 ctermfg=45 gui=NONE guibg=#337799 guifg=#00CCFF
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=75 gui=NONE guibg=#122130 guifg=#FFE0FA
    CSAHi Underlined term=underline cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#20b0eF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=64 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#00CCBB
    CSAHi NonText term=bold cterm=bold ctermbg=17 ctermfg=21 gui=bold guibg=#2A374A guifg=#285960
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#bbd0df
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=37 ctermfg=74 gui=reverse guibg=#FFDFB0 guifg=slategrey
    CSAHi Search term=reverse cterm=NONE ctermbg=37 ctermfg=74 gui=NONE guibg=slategrey guifg=#FFDABB
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#00AACC
    CSAHi LineNr term=underline cterm=NONE ctermbg=21 ctermfg=63 gui=NONE guibg=#006688 guifg=#CCF0FF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=38 gui=NONE guibg=#222f3d guifg=#6Aa0e0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#0088bb guifg=#FFFFFF
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=75 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=75 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=21 ctermfg=26 gui=NONE guibg=#007799 guifg=#00D0D0
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=42 gui=bold guibg=bg guifg=#AABBCC
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=23 ctermfg=16 gui=NONE guibg=#00A5EA guifg=#050709
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=22 ctermfg=80 gui=NONE guibg=#1079B0 guifg=#272334
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=57 ctermfg=82 gui=NONE guibg=#c2bfa5 guifg=grey50
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#00aBdF
    CSAHi Visual term=reverse cterm=NONE ctermbg=27 ctermfg=22 gui=NONE guibg=#33DFEF guifg=#008FBF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=21 ctermfg=58 gui=NONE guibg=#337799 guifg=#BBDDCC
    CSAHi lCursor term=NONE cterm=NONE ctermbg=75 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6Aa0e0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=70 gui=NONE guibg=bg guifg=#EE8aB5
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#8cf0ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#FFe0bd
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#eF7a7a
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#FF7A9a
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=54 gui=bold guibg=bg guifg=#dAa0b0
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=21 ctermfg=27 gui=NONE guibg=#337799 guifg=#00CCFF
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
