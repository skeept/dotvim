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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#f0f2f0 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=127 gui=underline guibg=bg guifg=darkmagenta
    CSAHi Ignore term=italic cterm=NONE ctermbg=255 ctermfg=250 gui=NONE guibg=bg guifg=grey
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=bold cterm=bold ctermbg=188 ctermfg=70 gui=bold guibg=#ddd9b8 guifg=#229900
    CSAHi Function term=bold cterm=NONE ctermbg=255 ctermfg=32 gui=NONE guibg=bg guifg=#0055cc
    CSAHi SpecialKey term=italic cterm=NONE ctermbg=255 ctermfg=153 gui=NONE guibg=bg guifg=lightblue
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=251 gui=NONE guibg=bg guifg=#c6c6c6
    CSAHi Directory term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=DarkRed guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=71 ctermfg=226 gui=NONE guibg=#449944 guifg=yellow
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=255 ctermfg=28 gui=NONE guibg=bg guifg=darkgreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=151 ctermfg=28 gui=NONE guibg=#aaccaa guifg=#007700
    CSAHi LineNr term=reverse cterm=NONE ctermbg=252 ctermfg=131 gui=NONE guibg=lightgrey guifg=brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=red guifg=black
    CSAHi Question term=bold cterm=NONE ctermbg=255 ctermfg=28 gui=NONE guibg=bg guifg=darkgreen
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=188 ctermfg=138 gui=NONE guibg=#ddd9b8 guifg=#80624d
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=248 gui=NONE guibg=#d7d7d2 guifg=darkgrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=251 gui=NONE guibg=#d7d7d2 guifg=#c7c7c2
    CSAHi Title term=bold cterm=NONE ctermbg=255 ctermfg=127 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=lightgreen guifg=black
    CSAHi VisualNOS term=bold cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=black guifg=grey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=bold cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=lightyellow guifg=black
    CSAHi Folded term=reverse cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=lightgrey guifg=darkblue
    CSAHi lCursor term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=Cyan guifg=black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=italic cterm=NONE ctermbg=255 ctermfg=181 gui=NONE guibg=bg guifg=#ccaaaa
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=174 gui=NONE guibg=bg guifg=#bb6666
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=37 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=37 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Statement term=bold cterm=NONE ctermbg=255 ctermfg=71 gui=NONE guibg=bg guifg=#44aa44
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=248 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Type term=NONE cterm=NONE ctermbg=255 ctermfg=178 gui=NONE guibg=bg guifg=#bb9900
    CSAHi FoldColumn term=reverse cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=grey guifg=darkblue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=65 ctermfg=157 gui=NONE guibg=#447744 guifg=#aaeeaa
    CSAHi DiffChange term=bold cterm=NONE ctermbg=186 ctermfg=230 gui=NONE guibg=#ddbb55 guifg=lightyellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=151 ctermfg=65 gui=NONE guibg=#aaccaa guifg=#336633
    CSAHi DiffText term=reverse cterm=NONE ctermbg=173 ctermfg=230 gui=NONE guibg=#cc7733 guifg=lightyellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#f0f2f0 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=127 gui=underline guibg=bg guifg=darkmagenta
    CSAHi Ignore term=italic cterm=NONE ctermbg=255 ctermfg=250 gui=NONE guibg=bg guifg=grey
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=bold cterm=bold ctermbg=230 ctermfg=76 gui=bold guibg=#ddd9b8 guifg=#229900
    CSAHi Function term=bold cterm=NONE ctermbg=255 ctermfg=33 gui=NONE guibg=bg guifg=#0055cc
    CSAHi SpecialKey term=italic cterm=NONE ctermbg=255 ctermfg=195 gui=NONE guibg=bg guifg=lightblue
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=251 gui=NONE guibg=bg guifg=#c6c6c6
    CSAHi Directory term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=255 gui=NONE guibg=DarkRed guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=114 ctermfg=226 gui=NONE guibg=#449944 guifg=yellow
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=255 ctermfg=28 gui=NONE guibg=bg guifg=darkgreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=194 ctermfg=34 gui=NONE guibg=#aaccaa guifg=#007700
    CSAHi LineNr term=reverse cterm=NONE ctermbg=231 ctermfg=167 gui=NONE guibg=lightgrey guifg=brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=red guifg=black
    CSAHi Question term=bold cterm=NONE ctermbg=255 ctermfg=28 gui=NONE guibg=bg guifg=darkgreen
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=230 ctermfg=138 gui=NONE guibg=#ddd9b8 guifg=#80624d
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=248 gui=NONE guibg=#d7d7d2 guifg=darkgrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=251 gui=NONE guibg=#d7d7d2 guifg=#c7c7c2
    CSAHi Title term=bold cterm=NONE ctermbg=255 ctermfg=127 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=157 ctermfg=16 gui=NONE guibg=lightgreen guifg=black
    CSAHi VisualNOS term=bold cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=black guifg=grey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=lightyellow guifg=black
    CSAHi Folded term=reverse cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=lightgrey guifg=darkblue
    CSAHi lCursor term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=Cyan guifg=black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=italic cterm=NONE ctermbg=255 ctermfg=224 gui=NONE guibg=bg guifg=#ccaaaa
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=174 gui=NONE guibg=bg guifg=#bb6666
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=37 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=37 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Statement term=bold cterm=NONE ctermbg=255 ctermfg=114 gui=NONE guibg=bg guifg=#44aa44
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=248 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Type term=NONE cterm=NONE ctermbg=255 ctermfg=184 gui=NONE guibg=bg guifg=#bb9900
    CSAHi FoldColumn term=reverse cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=grey guifg=darkblue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=108 ctermfg=194 gui=NONE guibg=#447744 guifg=#aaeeaa
    CSAHi DiffChange term=bold cterm=NONE ctermbg=222 ctermfg=231 gui=NONE guibg=#ddbb55 guifg=lightyellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=194 ctermfg=65 gui=NONE guibg=#aaccaa guifg=#336633
    CSAHi DiffText term=reverse cterm=NONE ctermbg=215 ctermfg=231 gui=NONE guibg=#cc7733 guifg=lightyellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#f0f2f0 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=90 gui=underline guibg=bg guifg=darkmagenta
    CSAHi Ignore term=italic cterm=NONE ctermbg=255 ctermfg=250 gui=NONE guibg=bg guifg=grey
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=bold cterm=bold ctermbg=187 ctermfg=28 gui=bold guibg=#ddd9b8 guifg=#229900
    CSAHi Function term=bold cterm=NONE ctermbg=255 ctermfg=26 gui=NONE guibg=bg guifg=#0055cc
    CSAHi SpecialKey term=italic cterm=NONE ctermbg=255 ctermfg=152 gui=NONE guibg=bg guifg=lightblue
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=251 gui=NONE guibg=bg guifg=#c6c6c6
    CSAHi Directory term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=DarkRed guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=65 ctermfg=226 gui=NONE guibg=#449944 guifg=yellow
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=255 ctermfg=22 gui=NONE guibg=bg guifg=darkgreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=151 ctermfg=28 gui=NONE guibg=#aaccaa guifg=#007700
    CSAHi LineNr term=reverse cterm=NONE ctermbg=252 ctermfg=124 gui=NONE guibg=lightgrey guifg=brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=red guifg=black
    CSAHi Question term=bold cterm=NONE ctermbg=255 ctermfg=22 gui=NONE guibg=bg guifg=darkgreen
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=187 ctermfg=95 gui=NONE guibg=#ddd9b8 guifg=#80624d
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=248 gui=NONE guibg=#d7d7d2 guifg=darkgrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=251 gui=NONE guibg=#d7d7d2 guifg=#c7c7c2
    CSAHi Title term=bold cterm=NONE ctermbg=255 ctermfg=90 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=120 ctermfg=16 gui=NONE guibg=lightgreen guifg=black
    CSAHi VisualNOS term=bold cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=black guifg=grey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=bold cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=lightyellow guifg=black
    CSAHi Folded term=reverse cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=lightgrey guifg=darkblue
    CSAHi lCursor term=reverse cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=Cyan guifg=black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=italic cterm=NONE ctermbg=255 ctermfg=181 gui=NONE guibg=bg guifg=#ccaaaa
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=131 gui=NONE guibg=bg guifg=#bb6666
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=30 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=30 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Statement term=bold cterm=NONE ctermbg=255 ctermfg=71 gui=NONE guibg=bg guifg=#44aa44
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=248 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Type term=NONE cterm=NONE ctermbg=255 ctermfg=136 gui=NONE guibg=bg guifg=#bb9900
    CSAHi FoldColumn term=reverse cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=grey guifg=darkblue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=65 ctermfg=157 gui=NONE guibg=#447744 guifg=#aaeeaa
    CSAHi DiffChange term=bold cterm=NONE ctermbg=179 ctermfg=230 gui=NONE guibg=#ddbb55 guifg=lightyellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=151 ctermfg=59 gui=NONE guibg=#aaccaa guifg=#336633
    CSAHi DiffText term=reverse cterm=NONE ctermbg=173 ctermfg=230 gui=NONE guibg=#cc7733 guifg=lightyellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#f0f2f0 guifg=Black
    CSAHi Underlined term=underline cterm=underline ctermbg=87 ctermfg=33 gui=underline guibg=bg guifg=darkmagenta
    CSAHi Ignore term=italic cterm=NONE ctermbg=87 ctermfg=85 gui=NONE guibg=bg guifg=grey
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=bold cterm=bold ctermbg=58 ctermfg=20 gui=bold guibg=#ddd9b8 guifg=#229900
    CSAHi Function term=bold cterm=NONE ctermbg=87 ctermfg=22 gui=NONE guibg=bg guifg=#0055cc
    CSAHi SpecialKey term=italic cterm=NONE ctermbg=87 ctermfg=58 gui=NONE guibg=bg guifg=lightblue
    CSAHi NonText term=bold cterm=NONE ctermbg=87 ctermfg=58 gui=NONE guibg=bg guifg=#c6c6c6
    CSAHi Directory term=NONE cterm=NONE ctermbg=87 ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=DarkRed guifg=white
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=20 ctermfg=76 gui=NONE guibg=#449944 guifg=yellow
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=yellow guifg=black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=87 ctermfg=20 gui=NONE guibg=bg guifg=darkgreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=41 ctermfg=20 gui=NONE guibg=#aaccaa guifg=#007700
    CSAHi LineNr term=reverse cterm=NONE ctermbg=86 ctermfg=32 gui=NONE guibg=lightgrey guifg=brown
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=64 ctermfg=16 gui=NONE guibg=red guifg=black
    CSAHi Question term=bold cterm=NONE ctermbg=87 ctermfg=20 gui=NONE guibg=bg guifg=darkgreen
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#ddd9b8 guifg=#80624d
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=86 ctermfg=84 gui=NONE guibg=#d7d7d2 guifg=darkgrey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=86 ctermfg=58 gui=NONE guibg=#d7d7d2 guifg=#c7c7c2
    CSAHi Title term=bold cterm=NONE ctermbg=87 ctermfg=33 gui=NONE guibg=bg guifg=DarkMagenta
    CSAHi Visual term=reverse cterm=NONE ctermbg=45 ctermfg=16 gui=NONE guibg=lightgreen guifg=black
    CSAHi VisualNOS term=bold cterm=NONE ctermbg=16 ctermfg=85 gui=NONE guibg=black guifg=grey
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=87 ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=bold cterm=NONE ctermbg=78 ctermfg=16 gui=NONE guibg=lightyellow guifg=black
    CSAHi Folded term=reverse cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=lightgrey guifg=darkblue
    CSAHi lCursor term=reverse cterm=NONE ctermbg=31 ctermfg=16 gui=NONE guibg=Cyan guifg=black
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=italic cterm=NONE ctermbg=87 ctermfg=53 gui=NONE guibg=bg guifg=#ccaaaa
    CSAHi Constant term=underline cterm=NONE ctermbg=87 ctermfg=53 gui=NONE guibg=bg guifg=#bb6666
    CSAHi Special term=bold cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Identifier term=underline cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=bg guifg=darkcyan
    CSAHi Statement term=bold cterm=NONE ctermbg=87 ctermfg=20 gui=NONE guibg=bg guifg=#44aa44
    CSAHi PreProc term=underline cterm=NONE ctermbg=87 ctermfg=84 gui=NONE guibg=bg guifg=darkgrey
    CSAHi Type term=NONE cterm=NONE ctermbg=87 ctermfg=52 gui=NONE guibg=bg guifg=#bb9900
    CSAHi FoldColumn term=reverse cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=grey guifg=darkblue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#447744 guifg=#aaeeaa
    CSAHi DiffChange term=bold cterm=NONE ctermbg=57 ctermfg=78 gui=NONE guibg=#ddbb55 guifg=lightyellow
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=41 ctermfg=20 gui=NONE guibg=#aaccaa guifg=#336633
    CSAHi DiffText term=reverse cterm=NONE ctermbg=52 ctermfg=78 gui=NONE guibg=#cc7733 guifg=lightyellow
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
