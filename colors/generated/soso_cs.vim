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
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=#e4e4e4 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=254 ctermfg=160 gui=NONE guibg=bg guifg=#b30000
    CSAHi Function term=NONE cterm=NONE ctermbg=254 ctermfg=30 gui=NONE guibg=bg guifg=#117777
    CSAHi SpecialKey term=bold cterm=bold ctermbg=253 ctermfg=244 gui=bold guibg=grey86 guifg=grey50
    CSAHi NonText term=bold cterm=bold ctermbg=253 ctermfg=244 gui=bold guibg=grey86 guifg=grey50
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=fg gui=NONE guibg=#fff999 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=253 ctermfg=244 gui=NONE guibg=grey86 guifg=grey50
    CSAHi ShowPairsHLe term=NONE cterm=NONE ctermbg=210 ctermfg=fg gui=NONE guibg=#ff5555 guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=230 ctermfg=fg gui=NONE guibg=#ffffcc guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=187 ctermfg=fg gui=NONE guibg=#ddddaa guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=144 ctermfg=fg gui=NONE guibg=#999966 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=249 ctermfg=fg gui=underline guibg=grey70 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=188 gui=reverse guibg=grey80 guifg=black
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi ShowPairsHLp term=NONE cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#c4f0c4 guifg=fg
    CSAHi ShowPairsHL term=NONE cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=254 gui=bold guibg=black guifg=bg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=254 gui=NONE guibg=grey40 guifg=bg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#ccccdd guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=188 ctermfg=254 gui=NONE guibg=#ccccdd guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=254 ctermfg=19 gui=NONE guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=254 ctermfg=171 gui=NONE guibg=bg guifg=#c033ff
    CSAHi Special term=bold cterm=NONE ctermbg=254 ctermfg=111 gui=NONE guibg=bg guifg=#6688ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi PreProc term=underline cterm=bold ctermbg=254 ctermfg=67 gui=bold guibg=bg guifg=#335588
    CSAHi Type term=underline cterm=bold ctermbg=254 ctermfg=72 gui=bold guibg=bg guifg=#338855
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=254 ctermfg=124 gui=NONE guibg=bg guifg=#990000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#c0ffe0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#cfefff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=225 ctermfg=217 gui=bold guibg=#ffe0f7 guifg=#ff8097
    CSAHi DiffText term=reverse cterm=bold ctermbg=189 ctermfg=fg gui=bold guibg=#bfdfff guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=160 gui=undercurl guibg=bg guifg=#cc0000 guisp=#cc0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=77 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=magenta guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=#e4e4e4 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=254 ctermfg=160 gui=NONE guibg=bg guifg=#b30000
    CSAHi Function term=NONE cterm=NONE ctermbg=254 ctermfg=37 gui=NONE guibg=bg guifg=#117777
    CSAHi SpecialKey term=bold cterm=bold ctermbg=253 ctermfg=145 gui=bold guibg=grey86 guifg=grey50
    CSAHi NonText term=bold cterm=bold ctermbg=253 ctermfg=145 gui=bold guibg=grey86 guifg=grey50
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=230 ctermfg=fg gui=NONE guibg=#fff999 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=253 ctermfg=145 gui=NONE guibg=grey86 guifg=grey50
    CSAHi ShowPairsHLe term=NONE cterm=NONE ctermbg=210 ctermfg=fg gui=NONE guibg=#ff5555 guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffcc guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=230 ctermfg=fg gui=NONE guibg=#ddddaa guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=186 ctermfg=fg gui=NONE guibg=#999966 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=249 ctermfg=fg gui=underline guibg=grey70 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=252 gui=reverse guibg=grey80 guifg=black
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi ShowPairsHLp term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#c4f0c4 guifg=fg
    CSAHi ShowPairsHL term=NONE cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=254 gui=bold guibg=black guifg=bg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=254 gui=NONE guibg=grey40 guifg=bg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ccccdd guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=231 ctermfg=254 gui=NONE guibg=#ccccdd guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=254 ctermfg=20 gui=NONE guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=254 ctermfg=207 gui=NONE guibg=bg guifg=#c033ff
    CSAHi Special term=bold cterm=NONE ctermbg=254 ctermfg=111 gui=NONE guibg=bg guifg=#6688ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi PreProc term=underline cterm=bold ctermbg=254 ctermfg=67 gui=bold guibg=bg guifg=#335588
    CSAHi Type term=underline cterm=bold ctermbg=254 ctermfg=72 gui=bold guibg=bg guifg=#338855
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=254 ctermfg=160 gui=NONE guibg=bg guifg=#990000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#c0ffe0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#cfefff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=218 gui=bold guibg=#ffe0f7 guifg=#ff8097
    CSAHi DiffText term=reverse cterm=bold ctermbg=195 ctermfg=fg gui=bold guibg=#bfdfff guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=#cc0000 guisp=#cc0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=83 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=magenta guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=254 ctermfg=16 gui=NONE guibg=#e4e4e4 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=254 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=254 ctermfg=124 gui=NONE guibg=bg guifg=#b30000
    CSAHi Function term=NONE cterm=NONE ctermbg=254 ctermfg=30 gui=NONE guibg=bg guifg=#117777
    CSAHi SpecialKey term=bold cterm=bold ctermbg=253 ctermfg=244 gui=bold guibg=grey86 guifg=grey50
    CSAHi NonText term=bold cterm=bold ctermbg=253 ctermfg=244 gui=bold guibg=grey86 guifg=grey50
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=228 ctermfg=fg gui=NONE guibg=#fff999 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=253 ctermfg=244 gui=NONE guibg=grey86 guifg=grey50
    CSAHi ShowPairsHLe term=NONE cterm=NONE ctermbg=203 ctermfg=fg gui=NONE guibg=#ff5555 guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=230 ctermfg=fg gui=NONE guibg=#ffffcc guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=187 ctermfg=fg gui=NONE guibg=#ddddaa guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=101 ctermfg=fg gui=NONE guibg=#999966 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=249 ctermfg=fg gui=underline guibg=grey70 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=252 gui=reverse guibg=grey80 guifg=black
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi ShowPairsHLp term=NONE cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#c4f0c4 guifg=fg
    CSAHi ShowPairsHL term=NONE cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=254 gui=bold guibg=black guifg=bg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=254 gui=NONE guibg=grey40 guifg=bg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=254 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#ccccdd guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=188 ctermfg=254 gui=NONE guibg=#ccccdd guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=254 ctermfg=135 gui=NONE guibg=bg guifg=#c033ff
    CSAHi Special term=bold cterm=NONE ctermbg=254 ctermfg=69 gui=NONE guibg=bg guifg=#6688ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi PreProc term=underline cterm=bold ctermbg=254 ctermfg=60 gui=bold guibg=bg guifg=#335588
    CSAHi Type term=underline cterm=bold ctermbg=254 ctermfg=65 gui=bold guibg=bg guifg=#338855
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=254 ctermfg=88 gui=NONE guibg=bg guifg=#990000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=158 ctermfg=fg gui=NONE guibg=#c0ffe0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#cfefff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=225 ctermfg=210 gui=bold guibg=#ffe0f7 guifg=#ff8097
    CSAHi DiffText term=reverse cterm=bold ctermbg=153 ctermfg=fg gui=bold guibg=#bfdfff guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=160 gui=undercurl guibg=bg guifg=#cc0000 guisp=#cc0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=40 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=magenta guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#e4e4e4 guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=87 ctermfg=48 gui=NONE guibg=bg guifg=#b30000
    CSAHi Function term=NONE cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=#117777
    CSAHi SpecialKey term=bold cterm=bold ctermbg=86 ctermfg=82 gui=bold guibg=grey86 guifg=grey50
    CSAHi NonText term=bold cterm=bold ctermbg=86 ctermfg=82 gui=bold guibg=grey86 guifg=grey50
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=fg gui=NONE guibg=#fff999 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=86 ctermfg=82 gui=NONE guibg=grey86 guifg=grey50
    CSAHi ShowPairsHLe term=NONE cterm=NONE ctermbg=69 ctermfg=fg gui=NONE guibg=#ff5555 guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=78 ctermfg=fg gui=NONE guibg=#ffffcc guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=57 ctermfg=fg gui=NONE guibg=#ddddaa guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#999966 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=85 ctermfg=fg gui=underline guibg=grey70 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=58 gui=reverse guibg=grey80 guifg=black
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=fg guifg=bg
    CSAHi ShowPairsHLp term=NONE cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=#c4f0c4 guifg=fg
    CSAHi ShowPairsHL term=NONE cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=87 gui=bold guibg=black guifg=bg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=grey40 guifg=bg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=Magenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#ccccdd guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=58 ctermfg=87 gui=NONE guibg=#ccccdd guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=#c4ffc4 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=bg guifg=#000099
    CSAHi Constant term=underline cterm=NONE ctermbg=87 ctermfg=51 gui=NONE guibg=bg guifg=#c033ff
    CSAHi Special term=bold cterm=NONE ctermbg=87 ctermfg=39 gui=NONE guibg=bg guifg=#6688ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=DarkCyan
    CSAHi Statement term=bold cterm=bold ctermbg=87 ctermfg=16 gui=bold guibg=bg guifg=black
    CSAHi PreProc term=underline cterm=bold ctermbg=87 ctermfg=21 gui=bold guibg=bg guifg=#335588
    CSAHi Type term=underline cterm=bold ctermbg=87 ctermfg=21 gui=bold guibg=bg guifg=#338855
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=87 ctermfg=32 gui=NONE guibg=bg guifg=#990000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=#c0ffe0 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=63 ctermfg=fg gui=NONE guibg=#cfefff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=75 ctermfg=69 gui=bold guibg=#ffe0f7 guifg=#ff8097
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=fg gui=bold guibg=#bfdfff guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=48 gui=undercurl guibg=bg guifg=#cc0000 guisp=#cc0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=24 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=magenta guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
