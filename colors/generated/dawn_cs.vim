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
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=grey90 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=254 ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=254 ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=254 ctermfg=199 gui=NONE guibg=bg guifg=DeepPink1
    CSAHi String term=NONE cterm=NONE ctermbg=254 ctermfg=107 gui=NONE guibg=bg guifg=DarkOliveGreen4
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=188 ctermfg=21 gui=NONE guibg=grey80 guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=254 ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=LightGreen guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=254 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=188 ctermfg=131 gui=NONE guibg=grey80 guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=Green guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=254 ctermfg=135 gui=NONE guibg=bg guifg=Purple
    CSAHi Question term=NONE cterm=NONE ctermbg=254 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=249 ctermfg=19 gui=NONE guibg=grey70 guifg=DarkBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=249 ctermfg=254 gui=NONE guibg=grey70 guifg=grey90
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=249 ctermfg=249 gui=NONE guibg=grey70 guifg=grey70
    CSAHi Title term=bold cterm=NONE ctermbg=254 ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=fg guifg=Grey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=254 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=254 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=254 ctermfg=102 gui=NONE guibg=bg guifg=Grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=RoyalBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=254 ctermfg=145 gui=NONE guibg=bg guifg=azure4
    CSAHi Special term=bold cterm=NONE ctermbg=254 ctermfg=37 gui=NONE guibg=bg guifg=Cyan4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=254 ctermfg=61 gui=NONE guibg=bg guifg=SlateBlue4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=127 gui=NONE guibg=bg guifg=Magenta4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=Brown
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=21 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=MistyRose2 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=195 ctermfg=153 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=230 ctermfg=21 gui=NONE guibg=LightYellow guifg=Blue
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=254 ctermfg=199 gui=undercurl guibg=bg guifg=fg guisp=DeepPink1
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=254 ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=254 ctermfg=16 gui=undercurl guibg=bg guifg=fg guisp=Black
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=254 ctermfg=72 gui=undercurl guibg=bg guifg=fg guisp=SeaGreen
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=grey90 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=254 ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=254 ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=254 ctermfg=199 gui=NONE guibg=bg guifg=DeepPink1
    CSAHi String term=NONE cterm=NONE ctermbg=254 ctermfg=143 gui=NONE guibg=bg guifg=DarkOliveGreen4
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=252 ctermfg=21 gui=NONE guibg=grey80 guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=254 ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=LightGreen guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=254 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=252 ctermfg=167 gui=NONE guibg=grey80 guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=Green guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=254 ctermfg=171 gui=NONE guibg=bg guifg=Purple
    CSAHi Question term=NONE cterm=NONE ctermbg=254 ctermfg=72 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=249 ctermfg=19 gui=NONE guibg=grey70 guifg=DarkBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=249 ctermfg=254 gui=NONE guibg=grey70 guifg=grey90
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=249 ctermfg=249 gui=NONE guibg=grey70 guifg=grey70
    CSAHi Title term=bold cterm=NONE ctermbg=254 ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=fg guifg=Grey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=254 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=254 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=254 ctermfg=241 gui=NONE guibg=bg guifg=Grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=RoyalBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=254 ctermfg=145 gui=NONE guibg=bg guifg=azure4
    CSAHi Special term=bold cterm=NONE ctermbg=254 ctermfg=37 gui=NONE guibg=bg guifg=Cyan4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=254 ctermfg=97 gui=NONE guibg=bg guifg=SlateBlue4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=127 gui=NONE guibg=bg guifg=Magenta4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=Brown
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=MistyRose2 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=195 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=LightYellow guifg=Blue
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=254 ctermfg=199 gui=undercurl guibg=bg guifg=fg guisp=DeepPink1
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=254 ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=254 ctermfg=16 gui=undercurl guibg=bg guifg=fg guisp=Black
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=254 ctermfg=72 gui=undercurl guibg=bg guifg=fg guisp=SeaGreen
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=grey90 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=254 ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=254 ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=230 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=254 ctermfg=198 gui=NONE guibg=bg guifg=DeepPink1
    CSAHi String term=NONE cterm=NONE ctermbg=254 ctermfg=65 gui=NONE guibg=bg guifg=DarkOliveGreen4
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=252 ctermfg=21 gui=NONE guibg=grey80 guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=254 ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=230 ctermfg=196 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=120 ctermfg=16 gui=NONE guibg=LightGreen guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=254 ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=252 ctermfg=124 gui=NONE guibg=grey80 guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=46 ctermfg=fg gui=NONE guibg=Green guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=254 ctermfg=129 gui=NONE guibg=bg guifg=Purple
    CSAHi Question term=NONE cterm=NONE ctermbg=254 ctermfg=29 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=249 ctermfg=18 gui=NONE guibg=grey70 guifg=DarkBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=249 ctermfg=254 gui=NONE guibg=grey70 guifg=grey90
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=249 ctermfg=249 gui=NONE guibg=grey70 guifg=grey70
    CSAHi Title term=bold cterm=NONE ctermbg=254 ctermfg=201 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=fg guifg=Grey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=254 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=254 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=254 ctermfg=241 gui=NONE guibg=bg guifg=Grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=RoyalBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=254 ctermfg=102 gui=NONE guibg=bg guifg=azure4
    CSAHi Special term=bold cterm=NONE ctermbg=254 ctermfg=30 gui=NONE guibg=bg guifg=Cyan4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=254 ctermfg=60 gui=NONE guibg=bg guifg=SlateBlue4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=90 gui=NONE guibg=bg guifg=Magenta4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=Brown
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=21 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=MistyRose2 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=195 ctermfg=152 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=230 ctermfg=21 gui=NONE guibg=LightYellow guifg=Blue
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=254 ctermfg=198 gui=undercurl guibg=bg guifg=fg guisp=DeepPink1
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=254 ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=254 ctermfg=16 gui=undercurl guibg=bg guifg=fg guisp=Black
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=254 ctermfg=29 gui=undercurl guibg=bg guifg=fg guisp=SeaGreen
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=grey90 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=87 ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=87 ctermfg=87 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=78 ctermfg=64 gui=NONE guibg=Linen guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=87 ctermfg=65 gui=NONE guibg=bg guifg=DeepPink1
    CSAHi String term=NONE cterm=NONE ctermbg=87 ctermfg=36 gui=NONE guibg=bg guifg=DarkOliveGreen4
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=87 ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=NONE ctermbg=58 ctermfg=19 gui=NONE guibg=grey80 guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=87 ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=78 ctermfg=64 gui=NONE guibg=Linen guifg=Red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=45 ctermfg=16 gui=NONE guibg=LightGreen guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=58 ctermfg=32 gui=NONE guibg=grey80 guifg=Brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=28 ctermfg=fg gui=NONE guibg=Green guifg=fg
    CSAHi Operator term=NONE cterm=NONE ctermbg=87 ctermfg=35 gui=NONE guibg=bg guifg=Purple
    CSAHi Question term=NONE cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=grey70 guifg=DarkBlue
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=85 ctermfg=87 gui=NONE guibg=grey70 guifg=grey90
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=85 ctermfg=85 gui=NONE guibg=grey70 guifg=grey70
    CSAHi Title term=bold cterm=NONE ctermbg=87 ctermfg=67 gui=NONE guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=fg guifg=Grey
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=87 ctermfg=16 gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=87 ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=PeachPuff guifg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=87 ctermfg=81 gui=NONE guibg=bg guifg=Grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=RoyalBlue
    CSAHi Constant term=underline cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=bg guifg=azure4
    CSAHi Special term=bold cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=Cyan4
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=DodgerBlue3
    CSAHi Statement term=bold cterm=NONE ctermbg=87 ctermfg=33 gui=NONE guibg=bg guifg=SlateBlue4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=Magenta4
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=Brown
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=LightCyan guifg=Blue
    CSAHi DiffChange term=bold cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=MistyRose2 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=63 ctermfg=58 gui=NONE guibg=LightCyan guifg=LightBlue
    CSAHi DiffText term=reverse cterm=NONE ctermbg=78 ctermfg=19 gui=NONE guibg=LightYellow guifg=Blue
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=87 ctermfg=65 gui=undercurl guibg=bg guifg=fg guisp=DeepPink1
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=87 ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=87 ctermfg=16 gui=undercurl guibg=bg guifg=fg guisp=Black
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=87 ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=SeaGreen
endif

if 1
    delcommand CSAHi
endif
