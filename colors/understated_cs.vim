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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=Black guifg=Grey
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=White
    CSAHi Ignore term=NONE cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=DarkGrey
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=DarkYellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=37 ctermfg=231 gui=NONE guibg=DarkCyan guifg=White
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=250 gui=reverse,bold guibg=Grey guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=250 gui=reverse guibg=Grey guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=248 gui=NONE guibg=White guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=231 ctermfg=248 gui=bold,underline guibg=White guifg=DarkGrey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGrey
    CSAHi Constant term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=DarkYellow
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=underline ctermbg=bg ctermfg=28 gui=underline guibg=bg guifg=DarkGreen
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=37 gui=underline guibg=bg guifg=DarkCyan
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=231 gui=NONE guibg=DarkGreen guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=184 ctermfg=231 gui=NONE guibg=DarkYellow guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=124 ctermfg=231 gui=bold guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=bold ctermbg=184 ctermfg=231 gui=bold guibg=DarkYellow guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=Black guifg=Grey
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=White
    CSAHi Ignore term=NONE cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=DarkGrey
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=DarkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=DarkYellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=37 ctermfg=255 gui=NONE guibg=DarkCyan guifg=White
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=250 gui=reverse,bold guibg=Grey guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=250 gui=reverse guibg=Grey guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=255 ctermfg=248 gui=NONE guibg=White guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=255 ctermfg=248 gui=bold,underline guibg=White guifg=DarkGrey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGrey
    CSAHi Constant term=underline cterm=underline ctermbg=bg ctermfg=255 gui=underline guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=DarkYellow
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=underline ctermbg=bg ctermfg=28 gui=underline guibg=bg guifg=DarkGreen
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=37 gui=underline guibg=bg guifg=DarkCyan
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=255 gui=NONE guibg=DarkGreen guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=184 ctermfg=255 gui=NONE guibg=DarkYellow guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=124 ctermfg=255 gui=bold guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=bold ctermbg=184 ctermfg=255 gui=bold guibg=DarkYellow guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=Black guifg=Grey
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=White
    CSAHi Ignore term=NONE cterm=bold ctermbg=bg ctermfg=248 gui=bold guibg=bg guifg=DarkGrey
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=DarkYellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=30 ctermfg=231 gui=NONE guibg=DarkCyan guifg=White
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=250 gui=reverse,bold guibg=Grey guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=250 gui=reverse guibg=Grey guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=248 gui=NONE guibg=White guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=231 ctermfg=248 gui=bold,underline guibg=White guifg=DarkGrey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=DarkGrey
    CSAHi Constant term=underline cterm=underline ctermbg=bg ctermfg=231 gui=underline guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=142 gui=NONE guibg=bg guifg=DarkYellow
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=30 gui=bold guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=underline ctermbg=bg ctermfg=22 gui=underline guibg=bg guifg=DarkGreen
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=30 gui=underline guibg=bg guifg=DarkCyan
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=231 gui=NONE guibg=DarkGreen guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=142 ctermfg=231 gui=NONE guibg=DarkYellow guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=88 ctermfg=231 gui=bold guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=bold ctermbg=142 ctermfg=231 gui=bold guibg=DarkYellow guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=85 gui=NONE guibg=Black guifg=Grey
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=79 gui=underline guibg=bg guifg=White
    CSAHi Ignore term=NONE cterm=bold ctermbg=bg ctermfg=84 gui=bold guibg=bg guifg=DarkGrey
    CSAHi Error term=reverse cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=DarkRed guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=56 ctermfg=16 gui=NONE guibg=DarkYellow guifg=Black
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=DarkRed guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=DarkCyan guifg=White
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=White guifg=Black
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=85 gui=reverse,bold guibg=Grey guifg=Black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=85 gui=reverse guibg=Grey guifg=Black
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=79 ctermfg=84 gui=NONE guibg=White guifg=DarkGrey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=79 ctermfg=84 gui=bold,underline guibg=White guifg=DarkGrey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=DarkGrey
    CSAHi Constant term=underline cterm=underline ctermbg=bg ctermfg=79 gui=underline guibg=bg guifg=White
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=DarkYellow
    CSAHi Identifier term=underline cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=DarkGreen
    CSAHi PreProc term=underline cterm=underline ctermbg=bg ctermfg=20 gui=underline guibg=bg guifg=DarkGreen
    CSAHi Type term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=DarkCyan
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=DarkGreen guifg=White
    CSAHi DiffChange term=bold cterm=NONE ctermbg=56 ctermfg=79 gui=NONE guibg=DarkYellow guifg=White
    CSAHi DiffDelete term=bold cterm=bold ctermbg=32 ctermfg=79 gui=bold guibg=DarkRed guifg=White
    CSAHi DiffText term=reverse cterm=bold ctermbg=56 ctermfg=79 gui=bold guibg=DarkYellow guifg=White
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
