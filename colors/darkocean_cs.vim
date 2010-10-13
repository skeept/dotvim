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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=195 gui=NONE guibg=#000000 guifg=#e0ffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=243 gui=NONE guibg=bg guifg=#777777
    CSAHi Error term=reverse cterm=NONE ctermbg=131 ctermfg=230 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi Todo term=NONE cterm=NONE ctermbg=103 ctermfg=80 gui=NONE guibg=#507080 guifg=#3bcccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=bg guifg=#63b8ff
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=153 gui=NONE guibg=#0f0f0f guifg=#87cefa
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=131 ctermfg=230 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=152 ctermfg=195 gui=bold guibg=#8db6cd guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=103 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=180 gui=bold guibg=bg guifg=#bf9261
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi LineNr term=underline cterm=bold ctermbg=233 ctermfg=152 gui=bold guibg=#0f0f0f guifg=#8db6cd
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=195 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi TagName term=NONE cterm=NONE ctermbg=88 ctermfg=248 gui=NONE guibg=#660000 guifg=#a7a7a7
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=189 gui=NONE guibg=bg guifg=#ccccff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=222 gui=bold guibg=bg guifg=#f4bb7e
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=152 ctermfg=16 gui=bold guibg=#8db6cd guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=103 ctermfg=234 gui=NONE guibg=#607b8b guifg=#1a1a1a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=111 gui=bold guibg=bg guifg=#5cacee
    CSAHi Visual term=reverse cterm=NONE ctermbg=67 ctermfg=231 gui=reverse guibg=#ffffff guifg=#36648b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=74 ctermfg=195 gui=bold,underline guibg=#4682b4 guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=131 gui=bold guibg=bg guifg=#b22222
    CSAHi WildMenu term=NONE cterm=bold ctermbg=103 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi Folded term=NONE cterm=bold ctermbg=24 ctermfg=145 gui=bold guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=23 ctermfg=152 gui=NONE guibg=#102520 guifg=#8db6cd
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=167 gui=NONE guibg=bg guifg=#c34a2c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=bg guifg=#009acd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=111 gui=NONE guibg=bg guifg=#72a5ee
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=168 gui=NONE guibg=bg guifg=#c12869
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=bg guifg=#3b9c9c
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=66 ctermfg=152 gui=bold guibg=#305070 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=96 ctermfg=195 gui=bold guibg=#7e354d guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=23 ctermfg=166 gui=bold guibg=#103040 guifg=#cc3300
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=96 gui=reverse,bold guibg=#7e354d guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=167 ctermfg=195 gui=bold guibg=#d74141 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#e0ffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=243 gui=NONE guibg=bg guifg=#777777
    CSAHi Error term=reverse cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi Todo term=NONE cterm=NONE ctermbg=109 ctermfg=87 gui=NONE guibg=#507080 guifg=#3bcccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=bg guifg=#63b8ff
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=159 gui=NONE guibg=#0f0f0f guifg=#87cefa
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=80 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=153 ctermfg=231 gui=bold guibg=#8db6cd guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=109 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=180 gui=bold guibg=bg guifg=#bf9261
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi LineNr term=underline cterm=bold ctermbg=233 ctermfg=153 gui=bold guibg=#0f0f0f guifg=#8db6cd
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi TagName term=NONE cterm=NONE ctermbg=88 ctermfg=248 gui=NONE guibg=#660000 guifg=#a7a7a7
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=bg guifg=#ccccff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=223 gui=bold guibg=bg guifg=#f4bb7e
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=153 ctermfg=16 gui=bold guibg=#8db6cd guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=109 ctermfg=234 gui=NONE guibg=#607b8b guifg=#1a1a1a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=117 gui=bold guibg=bg guifg=#5cacee
    CSAHi Visual term=reverse cterm=NONE ctermbg=67 ctermfg=255 gui=reverse guibg=#ffffff guifg=#36648b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=110 ctermfg=231 gui=bold,underline guibg=#4682b4 guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=167 gui=bold guibg=bg guifg=#b22222
    CSAHi WildMenu term=NONE cterm=bold ctermbg=109 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi Folded term=NONE cterm=bold ctermbg=24 ctermfg=246 gui=bold guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=23 ctermfg=153 gui=NONE guibg=#102520 guifg=#8db6cd
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=209 gui=NONE guibg=bg guifg=#c34a2c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=bg guifg=#009acd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=bg guifg=#72a5ee
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=204 gui=NONE guibg=bg guifg=#c12869
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=80 gui=NONE guibg=bg guifg=#3b9c9c
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=67 ctermfg=195 gui=bold guibg=#305070 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=132 ctermfg=231 gui=bold guibg=#7e354d guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=24 ctermfg=202 gui=bold guibg=#103040 guifg=#cc3300
    CSAHi DiffDelete term=bold cterm=bold ctermbg=231 ctermfg=132 gui=reverse,bold guibg=#7e354d guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=210 ctermfg=231 gui=bold guibg=#d74141 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=195 gui=NONE guibg=#000000 guifg=#e0ffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=243 gui=NONE guibg=bg guifg=#777777
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=230 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi Todo term=NONE cterm=NONE ctermbg=60 ctermfg=80 gui=NONE guibg=#507080 guifg=#3bcccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=75 gui=NONE guibg=bg guifg=#63b8ff
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=117 gui=NONE guibg=#0f0f0f guifg=#87cefa
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=230 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=110 ctermfg=195 gui=bold guibg=#8db6cd guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=66 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=137 gui=bold guibg=bg guifg=#bf9261
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi LineNr term=underline cterm=bold ctermbg=233 ctermfg=110 gui=bold guibg=#0f0f0f guifg=#8db6cd
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=195 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi TagName term=NONE cterm=NONE ctermbg=52 ctermfg=248 gui=NONE guibg=#660000 guifg=#a7a7a7
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=189 gui=NONE guibg=bg guifg=#ccccff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=216 gui=bold guibg=bg guifg=#f4bb7e
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=110 ctermfg=16 gui=bold guibg=#8db6cd guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=66 ctermfg=234 gui=NONE guibg=#607b8b guifg=#1a1a1a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=75 gui=bold guibg=bg guifg=#5cacee
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=231 gui=reverse guibg=#ffffff guifg=#36648b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=67 ctermfg=195 gui=bold,underline guibg=#4682b4 guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=124 gui=bold guibg=bg guifg=#b22222
    CSAHi WildMenu term=NONE cterm=bold ctermbg=66 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi Folded term=NONE cterm=bold ctermbg=23 ctermfg=246 gui=bold guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=110 gui=NONE guibg=#102520 guifg=#8db6cd
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=130 gui=NONE guibg=bg guifg=#c34a2c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=32 gui=NONE guibg=bg guifg=#009acd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=75 gui=NONE guibg=bg guifg=#72a5ee
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=125 gui=NONE guibg=bg guifg=#c12869
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=bg guifg=#3b9c9c
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=59 ctermfg=152 gui=bold guibg=#305070 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=95 ctermfg=195 gui=bold guibg=#7e354d guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=23 ctermfg=166 gui=bold guibg=#103040 guifg=#cc3300
    CSAHi DiffDelete term=bold cterm=bold ctermbg=195 ctermfg=95 gui=reverse,bold guibg=#7e354d guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=167 ctermfg=195 gui=bold guibg=#d74141 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=63 gui=NONE guibg=#000000 guifg=#e0ffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=82 gui=NONE guibg=bg guifg=#777777
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=78 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi Todo term=NONE cterm=NONE ctermbg=37 ctermfg=26 gui=NONE guibg=#507080 guifg=#3bcccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=bg guifg=#63b8ff
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#0f0f0f guifg=#87cefa
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=25 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=78 gui=NONE guibg=#b22222 guifg=#ffffe0
    CSAHi IncSearch term=reverse cterm=bold ctermbg=42 ctermfg=63 gui=bold guibg=#8db6cd guifg=fg
    CSAHi Search term=reverse cterm=bold ctermbg=37 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=53 gui=bold guibg=bg guifg=#bf9261
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi LineNr term=underline cterm=bold ctermbg=16 ctermfg=42 gui=bold guibg=#0f0f0f guifg=#8db6cd
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=63 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=63 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi TagName term=NONE cterm=NONE ctermbg=32 ctermfg=84 gui=NONE guibg=#660000 guifg=#a7a7a7
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#add8e6 guifg=#000000
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=bg guifg=#ccccff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=73 gui=bold guibg=bg guifg=#f4bb7e
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=42 ctermfg=16 gui=bold guibg=#8db6cd guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=37 ctermfg=80 gui=NONE guibg=#607b8b guifg=#1a1a1a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=16 ctermfg=39 gui=bold guibg=bg guifg=#5cacee
    CSAHi Visual term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=reverse guibg=#ffffff guifg=#36648b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=38 ctermfg=63 gui=bold,underline guibg=#4682b4 guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=48 gui=bold guibg=bg guifg=#b22222
    CSAHi WildMenu term=NONE cterm=bold ctermbg=37 ctermfg=16 gui=bold guibg=#607b8b guifg=#000000
    CSAHi Folded term=NONE cterm=bold ctermbg=17 ctermfg=84 gui=bold guibg=#003366 guifg=#999999
    CSAHi lCursor term=NONE cterm=NONE ctermbg=63 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=42 gui=NONE guibg=#102520 guifg=#8db6cd
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=52 gui=NONE guibg=bg guifg=#c34a2c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=22 gui=NONE guibg=bg guifg=#009acd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=39 gui=NONE guibg=bg guifg=#72a5ee
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=49 gui=NONE guibg=bg guifg=#c12869
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=bg guifg=#3b9c9c
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=21 ctermfg=58 gui=bold guibg=#305070 guifg=#b0d0e0
    CSAHi DiffAdd term=bold cterm=bold ctermbg=33 ctermfg=63 gui=bold guibg=#7e354d guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=16 ctermfg=48 gui=bold guibg=#103040 guifg=#cc3300
    CSAHi DiffDelete term=bold cterm=bold ctermbg=63 ctermfg=33 gui=reverse,bold guibg=#7e354d guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=48 ctermfg=63 gui=bold guibg=#d74141 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
