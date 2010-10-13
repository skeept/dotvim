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
    CSAHi Normal term=NONE cterm=NONE ctermbg=74 ctermfg=231 gui=NONE guibg=steelblue guifg=linen
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=grey29
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=navyblue
    CSAHi NonText term=bold cterm=NONE ctermbg=67 ctermfg=231 gui=NONE guibg=steelblue4 guifg=white
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=74 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=231 ctermfg=18 gui=bold guibg=#FFFFFF guifg=midnightblue
    CSAHi MoreMsg term=bold cterm=bold ctermbg=117 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi ModeMsg term=bold cterm=bold ctermbg=117 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=74 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=74 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=152 ctermfg=16 gui=bold guibg=lightblue3 guifg=black
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=snow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=skyblue3 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=19 ctermfg=231 gui=NONE guibg=navyblue guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=187 gui=bold guibg=bg guifg=bisque3
    CSAHi Visual term=reverse cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=royalblue4 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=145 ctermfg=131 gui=bold guibg=gray60 guifg=salmon4
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=122 ctermfg=16 gui=NONE guibg=aquamarine guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=19 ctermfg=231 gui=NONE guibg=darkblue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=74 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=turquoise
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightcyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=61 gui=bold guibg=bg guifg=royalblue4
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=lightgreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=lightgray guifg=navyblue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=110 ctermfg=231 gui=NONE guibg=steelblue guifg=linen
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=grey29
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=black guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=navyblue
    CSAHi NonText term=bold cterm=NONE ctermbg=67 ctermfg=255 gui=NONE guibg=steelblue4 guifg=white
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=110 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=255 ctermfg=61 gui=bold guibg=#FFFFFF guifg=midnightblue
    CSAHi MoreMsg term=bold cterm=bold ctermbg=117 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi ModeMsg term=bold cterm=bold ctermbg=117 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=110 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=110 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=lightblue3 guifg=black
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=snow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=skyblue3 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=159 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=19 ctermfg=255 gui=NONE guibg=navyblue guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=224 gui=bold guibg=bg guifg=bisque3
    CSAHi Visual term=reverse cterm=NONE ctermbg=67 ctermfg=255 gui=NONE guibg=royalblue4 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=246 ctermfg=137 gui=bold guibg=gray60 guifg=salmon4
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=159 ctermfg=16 gui=NONE guibg=aquamarine guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=19 ctermfg=255 gui=NONE guibg=darkblue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=110 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=123 gui=bold guibg=bg guifg=turquoise
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=lightcyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=royalblue4
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=lightgreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=lightgray guifg=navyblue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=67 ctermfg=230 gui=NONE guibg=steelblue guifg=linen
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=239 gui=NONE guibg=bg guifg=grey29
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=navyblue
    CSAHi NonText term=bold cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=steelblue4 guifg=white
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=67 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=231 ctermfg=17 gui=bold guibg=#FFFFFF guifg=midnightblue
    CSAHi MoreMsg term=bold cterm=bold ctermbg=75 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi ModeMsg term=bold cterm=bold ctermbg=75 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=67 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=230 ctermfg=67 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=110 ctermfg=16 gui=bold guibg=lightblue3 guifg=black
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=snow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=skyblue3 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=117 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=18 ctermfg=231 gui=NONE guibg=navyblue guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=181 gui=bold guibg=bg guifg=bisque3
    CSAHi Visual term=reverse cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=royalblue4 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=246 ctermfg=95 gui=bold guibg=gray60 guifg=salmon4
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=122 ctermfg=16 gui=NONE guibg=aquamarine guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=18 ctermfg=231 gui=NONE guibg=darkblue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=67 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=turquoise
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=lightcyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=royalblue4
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=lightgreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=lightgray guifg=navyblue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=38 ctermfg=78 gui=NONE guibg=steelblue guifg=linen
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=grey29
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=black guifg=white
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=navyblue
    CSAHi NonText term=bold cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=steelblue4 guifg=white
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=78 ctermfg=38 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=#FFFFFF guifg=midnightblue
    CSAHi MoreMsg term=bold cterm=bold ctermbg=43 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi ModeMsg term=bold cterm=bold ctermbg=43 ctermfg=16 gui=bold guibg=steelblue1 guifg=black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=78 ctermfg=38 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=78 ctermfg=38 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=42 ctermfg=16 gui=bold guibg=lightblue3 guifg=black
    CSAHi Subtitle term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=snow
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=skyblue3 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=43 ctermfg=16 gui=NONE guibg=skyblue1 guifg=black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=navyblue guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=bisque3
    CSAHi Visual term=reverse cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=royalblue4 guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=84 ctermfg=36 gui=bold guibg=gray60 guifg=salmon4
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=46 ctermfg=16 gui=NONE guibg=aquamarine guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=darkblue guifg=white
    CSAHi lCursor term=NONE cterm=NONE ctermbg=78 ctermfg=38 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=lightskyblue
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=26 gui=bold guibg=bg guifg=turquoise
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=navajowhite
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=lightcyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=royalblue4
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=lightgreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=lightgray guifg=navyblue
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
