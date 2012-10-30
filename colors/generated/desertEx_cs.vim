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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=250 gui=NONE guibg=grey17 guifg=gray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=Skyblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=159 ctermfg=68 gui=reverse guibg=#2050d0 guifg=#b0ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=67 ctermfg=188 gui=NONE guibg=#445599 guifg=gray80
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=burlywood3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=67 ctermfg=231 gui=NONE guibg=#445599 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=67 gui=NONE guibg=gray guifg=#445599
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=187 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=250 gui=NONE guibg=gray40 guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=102 gui=NONE guibg=gray40 guifg=gray40
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=indianred
    CSAHi Visual term=reverse cterm=NONE ctermbg=216 ctermfg=235 gui=NONE guibg=tan1 guifg=gray17
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=235 ctermfg=250 gui=NONE guibg=gray17 guifg=gray
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=116 gui=NONE guibg=grey30 guifg=DarkSlateGray3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=114 gui=italic guibg=bg guifg=PaleGreen3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=Skyblue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=lightgoldenrod2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=211 gui=NONE guibg=bg guifg=PaleVioletRed2
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=tan1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=187 gui=NONE guibg=grey30 guifg=tan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=wheat1 guifg=black
    CSAHi DiffChange term=bold cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=243 ctermfg=16 gui=NONE guibg=gray45 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=212 ctermfg=16 gui=NONE guibg=hotpink1 guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=250 gui=NONE guibg=grey17 guifg=gray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=208 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=Skyblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=195 ctermfg=69 gui=reverse guibg=#2050d0 guifg=#b0ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=104 ctermfg=252 gui=NONE guibg=#445599 guifg=gray80
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=burlywood3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=104 ctermfg=255 gui=NONE guibg=#445599 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=104 gui=NONE guibg=gray guifg=#445599
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=224 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=250 gui=NONE guibg=gray40 guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=gray40 guifg=gray40
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=indianred
    CSAHi Visual term=reverse cterm=NONE ctermbg=222 ctermfg=59 gui=NONE guibg=tan1 guifg=gray17
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=59 ctermfg=250 gui=NONE guibg=gray17 guifg=gray
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=159 gui=NONE guibg=grey30 guifg=DarkSlateGray3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=italic guibg=bg guifg=PaleGreen3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=aquamarine2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=Skyblue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=lightgoldenrod2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=PaleVioletRed2
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=tan1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=223 gui=NONE guibg=grey30 guifg=tan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=wheat1 guifg=black
    CSAHi DiffChange term=bold cterm=NONE ctermbg=159 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=243 ctermfg=16 gui=NONE guibg=gray45 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=218 ctermfg=16 gui=NONE guibg=hotpink1 guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=250 gui=NONE guibg=grey17 guifg=gray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=Skyblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=cyan
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=159 ctermfg=26 gui=reverse guibg=#2050d0 guifg=#b0ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=60 ctermfg=252 gui=NONE guibg=#445599 guifg=gray80
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=burlywood3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#445599 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=60 gui=NONE guibg=gray guifg=#445599
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=145 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=250 gui=NONE guibg=gray40 guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=gray40 guifg=gray40
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=indianred
    CSAHi Visual term=reverse cterm=NONE ctermbg=215 ctermfg=235 gui=NONE guibg=tan1 guifg=gray17
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=235 ctermfg=250 gui=NONE guibg=gray17 guifg=gray
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=116 gui=NONE guibg=grey30 guifg=DarkSlateGray3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=cyan
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=114 gui=italic guibg=bg guifg=PaleGreen3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=aquamarine2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=Skyblue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=lightgoldenrod2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=211 gui=NONE guibg=bg guifg=PaleVioletRed2
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=tan1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=180 gui=NONE guibg=grey30 guifg=tan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=wheat1 guifg=black
    CSAHi DiffChange term=bold cterm=NONE ctermbg=117 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=243 ctermfg=16 gui=NONE guibg=gray45 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=205 ctermfg=16 gui=NONE guibg=hotpink1 guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=85 gui=NONE guibg=grey17 guifg=gray
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=64 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=Skyblue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=cyan
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=cyan
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=red guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=63 ctermfg=22 gui=reverse guibg=#2050d0 guifg=#b0ffff
    CSAHi Search term=reverse cterm=NONE ctermbg=21 ctermfg=58 gui=NONE guibg=#445599 guifg=gray80
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=burlywood3
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#445599 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=21 gui=NONE guibg=gray guifg=#445599
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=85 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=85 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=57 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=81 ctermfg=85 gui=NONE guibg=gray40 guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=81 ctermfg=81 gui=NONE guibg=gray40 guifg=gray40
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=indianred
    CSAHi Visual term=reverse cterm=NONE ctermbg=69 ctermfg=80 gui=NONE guibg=tan1 guifg=gray17
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=80 ctermfg=85 gui=NONE guibg=gray17 guifg=gray
    CSAHi Folded term=NONE cterm=NONE ctermbg=81 ctermfg=42 gui=NONE guibg=grey30 guifg=DarkSlateGray3
    CSAHi lCursor term=NONE cterm=NONE ctermbg=85 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=cyan
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=41 gui=italic guibg=bg guifg=PaleGreen3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=aquamarine2
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=Skyblue
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=lightgoldenrod2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=PaleVioletRed2
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=tan1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=81 ctermfg=57 gui=NONE guibg=grey30 guifg=tan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=78 ctermfg=16 gui=NONE guibg=wheat1 guifg=black
    CSAHi DiffChange term=bold cterm=NONE ctermbg=43 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=82 ctermfg=16 gui=NONE guibg=gray45 guifg=black
    CSAHi DiffText term=reverse cterm=NONE ctermbg=70 ctermfg=16 gui=NONE guibg=hotpink1 guifg=black
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
