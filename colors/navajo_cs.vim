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
    CSAHi Normal term=NONE cterm=NONE ctermbg=181 ctermfg=16 gui=NONE guibg=#ba9c80 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=181 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=181 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=244 ctermfg=16 gui=bold guibg=#808080 guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=181 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=181 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=58 ctermfg=231 gui=reverse guibg=white guifg=#404010
    CSAHi Match term=reverse,bold cterm=bold ctermbg=226 ctermfg=21 gui=reverse,bold guibg=blue guifg=yellow
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=242 ctermfg=224 gui=bold guibg=#707070 guifg=LightRed
    CSAHi VertSplit term=reverse cterm=bold ctermbg=242 ctermfg=231 gui=bold guibg=#707070 guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=127 gui=bold guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=black guifg=#c0c0c0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=250 ctermfg=231 gui=reverse guibg=white guifg=Grey
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=#907050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=181 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#181880
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=162 gui=NONE guibg=bg guifg=#c00058
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#404010
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#106060
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=131 gui=bold guibg=bg guifg=Brown
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=127 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=#c0c0c0 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=224 ctermfg=fg gui=NONE guibg=#edb5cd guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=230 ctermfg=153 gui=bold guibg=#f6e8d0 guifg=LightBlue
    CSAHi DiffText term=reverse cterm=bold ctermbg=216 ctermfg=fg gui=bold guibg=#ff8060 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#ba9c80 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=187 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=244 ctermfg=16 gui=bold guibg=#808080 guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=187 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=187 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=100 ctermfg=255 gui=reverse guibg=white guifg=#404010
    CSAHi Match term=reverse,bold cterm=bold ctermbg=226 ctermfg=21 gui=reverse,bold guibg=blue guifg=yellow
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=242 ctermfg=224 gui=bold guibg=#707070 guifg=LightRed
    CSAHi VertSplit term=reverse cterm=bold ctermbg=242 ctermfg=255 gui=bold guibg=#707070 guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=127 gui=bold guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=black guifg=#c0c0c0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=250 ctermfg=255 gui=reverse guibg=white guifg=Grey
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#907050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=187 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#181880
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=198 gui=NONE guibg=bg guifg=#c00058
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=100 gui=NONE guibg=bg guifg=#404010
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#106060
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=167 gui=bold guibg=bg guifg=Brown
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=127 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=#c0c0c0 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=#edb5cd guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=195 gui=bold guibg=#f6e8d0 guifg=LightBlue
    CSAHi DiffText term=reverse cterm=bold ctermbg=216 ctermfg=fg gui=bold guibg=#ff8060 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=144 ctermfg=16 gui=NONE guibg=#ba9c80 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=144 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=244 ctermfg=16 gui=bold guibg=#808080 guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=144 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=144 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=58 ctermfg=231 gui=reverse guibg=white guifg=#404010
    CSAHi Match term=reverse,bold cterm=bold ctermbg=226 ctermfg=21 gui=reverse,bold guibg=blue guifg=yellow
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=242 ctermfg=217 gui=bold guibg=#707070 guifg=LightRed
    CSAHi VertSplit term=reverse cterm=bold ctermbg=242 ctermfg=231 gui=bold guibg=#707070 guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=90 gui=bold guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=black guifg=#c0c0c0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=250 ctermfg=231 gui=reverse guibg=white guifg=Grey
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=95 gui=NONE guibg=bg guifg=#907050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=144 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#181880
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=125 gui=NONE guibg=bg guifg=#c00058
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#404010
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#106060
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=Brown
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=90 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=#c0c0c0 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=218 ctermfg=fg gui=NONE guibg=#edb5cd guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=224 ctermfg=152 gui=bold guibg=#f6e8d0 guifg=LightBlue
    CSAHi DiffText term=reverse cterm=bold ctermbg=209 ctermfg=fg gui=bold guibg=#ff8060 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=53 ctermfg=16 gui=NONE guibg=#ba9c80 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=53 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=83 ctermfg=16 gui=bold guibg=#808080 guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=53 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=53 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=white guifg=#404010
    CSAHi Match term=reverse,bold cterm=bold ctermbg=76 ctermfg=19 gui=reverse,bold guibg=blue guifg=yellow
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=Black guifg=White
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=82 ctermfg=74 gui=bold guibg=#707070 guifg=LightRed
    CSAHi VertSplit term=reverse cterm=bold ctermbg=82 ctermfg=79 gui=bold guibg=#707070 guifg=White
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=black guifg=#c0c0c0
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=85 ctermfg=79 gui=reverse guibg=white guifg=Grey
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#907050
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=53 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#181880
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=#c00058
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#404010
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#106060
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=Brown
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=#c0c0c0 guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=White guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=74 ctermfg=fg gui=NONE guibg=#edb5cd guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=78 ctermfg=58 gui=bold guibg=#f6e8d0 guifg=LightBlue
    CSAHi DiffText term=reverse cterm=bold ctermbg=69 ctermfg=fg gui=bold guibg=#ff8060 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
