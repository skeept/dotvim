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
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#1c1c1c guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#dfdf00 guifg=#000000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#dfaf87
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#5fdf5f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=#a8a8a8
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=#ffdfaf guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#afdf5f guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#949494 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=243 ctermfg=16 gui=NONE guibg=#767676 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=243 ctermfg=fg gui=NONE guibg=#767676 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=252 ctermfg=252 gui=reverse guibg=#d0d0d0 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=102 ctermfg=252 gui=underline guibg=#666666 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=102 ctermfg=252 gui=underline guibg=#666666 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=214 ctermfg=234 gui=NONE guibg=#ffaf00 guifg=bg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#df8787
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=239 ctermfg=fg gui=bold guibg=#4e4e4e guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3a3a3a guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=237 ctermfg=237 gui=NONE guibg=#3a3a3a guifg=#3a3a3a
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=31 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=153 ctermfg=31 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=184 ctermfg=16 gui=bold guibg=#dfdf00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=103 ctermfg=255 gui=NONE guibg=#5f5f87 guifg=#eeeeee
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=110 ctermfg=253 gui=bold guibg=#5f87df guifg=#dfdfdf
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=#df8787
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#dfafdf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#87afdf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=151 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#afafdf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=248 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=151 ctermfg=234 gui=NONE guibg=#afdfaf guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=181 ctermfg=234 gui=NONE guibg=#dfafaf guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=246 ctermfg=234 gui=NONE guibg=#949494 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=181 ctermfg=234 gui=NONE guibg=#df8787 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=248 gui=NONE guibg=Grey guifg=#a8a8a8
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#1c1c1c guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=45 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#dfdf00 guifg=#000000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#dfaf87
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#5fdf5f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=#a8a8a8
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=#ffdfaf guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=192 ctermfg=16 gui=NONE guibg=#afdf5f guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#949494 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=243 ctermfg=16 gui=NONE guibg=#767676 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=243 ctermfg=fg gui=NONE guibg=#767676 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=252 ctermfg=252 gui=reverse guibg=#d0d0d0 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=241 ctermfg=252 gui=underline guibg=#666666 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=241 ctermfg=252 gui=underline guibg=#666666 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=220 ctermfg=234 gui=NONE guibg=#ffaf00 guifg=bg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#df8787
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=239 ctermfg=fg gui=bold guibg=#4e4e4e guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3a3a3a guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=237 ctermfg=237 gui=NONE guibg=#3a3a3a guifg=#3a3a3a
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=195 ctermfg=31 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=195 ctermfg=31 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#dfdf00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=103 ctermfg=255 gui=NONE guibg=#5f5f87 guifg=#eeeeee
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=111 ctermfg=253 gui=bold guibg=#5f87df guifg=#dfdfdf
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#df8787
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#dfafdf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#87afdf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#afafdf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=248 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=234 gui=NONE guibg=#afdfaf guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=224 ctermfg=234 gui=NONE guibg=#dfafaf guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=246 ctermfg=234 gui=NONE guibg=#949494 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=217 ctermfg=234 gui=NONE guibg=#df8787 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=248 gui=NONE guibg=Grey guifg=#a8a8a8
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#1c1c1c guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=238 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#dfdf00 guifg=#000000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#dfaf87
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#5fdf5f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=#a8a8a8
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=#ffdfaf guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=149 ctermfg=16 gui=NONE guibg=#afdf5f guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#949494 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=243 ctermfg=16 gui=NONE guibg=#767676 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=243 ctermfg=fg gui=NONE guibg=#767676 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=252 ctermfg=252 gui=reverse guibg=#d0d0d0 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=241 ctermfg=252 gui=underline guibg=#666666 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=241 ctermfg=252 gui=underline guibg=#666666 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=214 ctermfg=234 gui=NONE guibg=#ffaf00 guifg=bg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#df8787
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=239 ctermfg=fg gui=bold guibg=#4e4e4e guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3a3a3a guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=237 ctermfg=237 gui=NONE guibg=#3a3a3a guifg=#3a3a3a
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=24 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=153 ctermfg=24 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=184 ctermfg=16 gui=bold guibg=#dfdf00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=60 ctermfg=255 gui=NONE guibg=#5f5f87 guifg=#eeeeee
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=234 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=68 ctermfg=253 gui=bold guibg=#5f87df guifg=#dfdfdf
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#df8787
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#dfafdf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#87afdf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#afafdf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=234 ctermfg=248 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=151 ctermfg=234 gui=NONE guibg=#afdfaf guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=181 ctermfg=234 gui=NONE guibg=#dfafaf guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=246 ctermfg=234 gui=NONE guibg=#949494 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=174 ctermfg=234 gui=NONE guibg=#df8787 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=248 gui=NONE guibg=Grey guifg=#a8a8a8
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=86 gui=NONE guibg=#1c1c1c guifg=#d0d0d0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=27 gui=underline guibg=bg guifg=#00afff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#444444
    CSAHi Error term=reverse cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=56 ctermfg=16 gui=NONE guibg=#dfdf00 guifg=#000000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#dfaf87
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#5fdf5f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=84 gui=bold guibg=bg guifg=#a8a8a8
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#800000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=#ffdfaf guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#afdf5f guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#949494 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=82 ctermfg=16 gui=NONE guibg=#767676 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=82 ctermfg=fg gui=NONE guibg=#767676 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=86 ctermfg=86 gui=reverse guibg=#d0d0d0 guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=81 ctermfg=86 gui=underline guibg=#666666 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=81 ctermfg=86 gui=underline guibg=#666666 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#444444 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=72 ctermfg=80 gui=NONE guibg=#ffaf00 guifg=bg
    CSAHi diffRemoved term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#df8787
    CSAHi diffAdded term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=81 ctermfg=fg gui=bold guibg=#4e4e4e guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#3a3a3a guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#3a3a3a guifg=#3a3a3a
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=21 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=59 ctermfg=21 gui=NONE guibg=#afdfff guifg=#005f87
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=56 ctermfg=16 gui=bold guibg=#dfdf00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=37 ctermfg=87 gui=NONE guibg=#5f5f87 guifg=#eeeeee
    CSAHi lCursor term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=38 ctermfg=87 gui=bold guibg=#5f87df guifg=#dfdfdf
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#df8787
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#dfafdf
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#87afdf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#afdf87
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#afafdf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=84 gui=NONE guibg=bg guifg=#a8a8a8
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=#afdfaf guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=#dfafaf guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=83 ctermfg=80 gui=NONE guibg=#949494 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=53 ctermfg=80 gui=NONE guibg=#df8787 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=84 gui=NONE guibg=Grey guifg=#a8a8a8
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
