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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#fffdfa guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=21 gui=underline guibg=bg guifg=blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=bg guifg=#999999
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=124 gui=NONE guibg=bg guifg=#aa0000
    CSAHi String term=NONE cterm=NONE ctermbg=231 ctermfg=25 gui=italic guibg=bg guifg=#003399
    CSAHi Character term=NONE cterm=NONE ctermbg=231 ctermfg=25 gui=italic guibg=bg guifg=#003399
    CSAHi Number term=NONE cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=bg guifg=#003399
    CSAHi Boolean term=NONE cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=bg guifg=#003399
    CSAHi Float term=NONE cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=bg guifg=#003399
    CSAHi Function term=NONE cterm=bold ctermbg=231 ctermfg=31 gui=bold guibg=bg guifg=#0055aa
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=19 gui=bold guibg=#eafaea guifg=#000099
    CSAHi Directory term=bold cterm=NONE ctermbg=231 ctermfg=64 gui=NONE guibg=bg guifg=#337700
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=231 ctermfg=160 gui=bold guibg=bg guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=231 ctermfg=25 gui=NONE guibg=bg guifg=#003399
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=bg guifg=#999999
    CSAHi Titled term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=137 ctermfg=230 gui=bold guibg=#aa7733 guifg=#ffeebb
    CSAHi Conditional term=NONE cterm=bold ctermbg=231 ctermfg=137 gui=bold guibg=bg guifg=#aa7733
    CSAHi Repeat term=NONE cterm=bold ctermbg=231 ctermfg=137 gui=bold guibg=bg guifg=#aa5544
    CSAHi Operator term=NONE cterm=bold ctermbg=231 ctermfg=137 gui=bold guibg=bg guifg=#aa7733
    CSAHi Exception term=NONE cterm=bold ctermbg=231 ctermfg=72 gui=bold guibg=bg guifg=#228877
    CSAHi Include term=NONE cterm=bold ctermbg=231 ctermfg=106 gui=bold guibg=bg guifg=#558811
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=230 ctermfg=16 gui=bold guibg=#ffeebb guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=144 ctermfg=230 gui=NONE guibg=#aa8866 guifg=#f8e8cc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=144 ctermfg=224 gui=NONE guibg=#aa8866 guifg=#ffe0bb
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=#fff8cc guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=231 ctermfg=160 gui=bold guibg=bg guifg=#cc0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=194 ctermfg=22 gui=NONE guibg=#ddeedd guifg=#002200
    CSAHi Constant term=underline cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=bg guifg=#003399
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=25 gui=NONE guibg=bg guifg=#003399
    CSAHi Statement term=bold cterm=NONE ctermbg=231 ctermfg=25 gui=NONE guibg=bg guifg=#003399
    CSAHi PreProc term=underline cterm=bold ctermbg=231 ctermfg=137 gui=bold guibg=bg guifg=#aa7733
    CSAHi Type term=underline cterm=bold ctermbg=231 ctermfg=28 gui=bold guibg=bg guifg=#007700
    CSAHi Typedef term=NONE cterm=NONE ctermbg=231 ctermfg=34 gui=italic guibg=bg guifg=#009900
    CSAHi Tag term=NONE cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=bg guifg=#003399
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=253 ctermfg=124 gui=NONE guibg=#dddddd guifg=#aa0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#fffdfa guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=21 gui=underline guibg=bg guifg=blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=255 ctermfg=160 gui=NONE guibg=bg guifg=#aa0000
    CSAHi String term=NONE cterm=NONE ctermbg=255 ctermfg=26 gui=italic guibg=bg guifg=#003399
    CSAHi Character term=NONE cterm=NONE ctermbg=255 ctermfg=26 gui=italic guibg=bg guifg=#003399
    CSAHi Number term=NONE cterm=bold ctermbg=255 ctermfg=26 gui=bold guibg=bg guifg=#003399
    CSAHi Boolean term=NONE cterm=bold ctermbg=255 ctermfg=26 gui=bold guibg=bg guifg=#003399
    CSAHi Float term=NONE cterm=bold ctermbg=255 ctermfg=26 gui=bold guibg=bg guifg=#003399
    CSAHi Function term=NONE cterm=bold ctermbg=255 ctermfg=32 gui=bold guibg=bg guifg=#0055aa
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=20 gui=bold guibg=#eafaea guifg=#000099
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=70 gui=NONE guibg=bg guifg=#337700
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=255 ctermfg=196 gui=bold guibg=bg guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=255 ctermfg=26 gui=NONE guibg=bg guifg=#003399
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi Titled term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=179 ctermfg=230 gui=bold guibg=#aa7733 guifg=#ffeebb
    CSAHi Conditional term=NONE cterm=bold ctermbg=255 ctermfg=179 gui=bold guibg=bg guifg=#aa7733
    CSAHi Repeat term=NONE cterm=bold ctermbg=255 ctermfg=174 gui=bold guibg=bg guifg=#aa5544
    CSAHi Operator term=NONE cterm=bold ctermbg=255 ctermfg=179 gui=bold guibg=bg guifg=#aa7733
    CSAHi Exception term=NONE cterm=bold ctermbg=255 ctermfg=73 gui=bold guibg=bg guifg=#228877
    CSAHi Include term=NONE cterm=bold ctermbg=255 ctermfg=106 gui=bold guibg=bg guifg=#558811
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=230 ctermfg=16 gui=bold guibg=#ffeebb guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=180 ctermfg=231 gui=NONE guibg=#aa8866 guifg=#f8e8cc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=180 ctermfg=230 gui=NONE guibg=#aa8866 guifg=#ffe0bb
    CSAHi Title term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#fff8cc guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=255 ctermfg=196 gui=bold guibg=bg guifg=#cc0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=22 gui=NONE guibg=#ddeedd guifg=#002200
    CSAHi Constant term=underline cterm=bold ctermbg=255 ctermfg=26 gui=bold guibg=bg guifg=#003399
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=26 gui=NONE guibg=bg guifg=#003399
    CSAHi Statement term=bold cterm=NONE ctermbg=255 ctermfg=26 gui=NONE guibg=bg guifg=#003399
    CSAHi PreProc term=underline cterm=bold ctermbg=255 ctermfg=179 gui=bold guibg=bg guifg=#aa7733
    CSAHi Type term=underline cterm=bold ctermbg=255 ctermfg=34 gui=bold guibg=bg guifg=#007700
    CSAHi Typedef term=NONE cterm=NONE ctermbg=255 ctermfg=40 gui=italic guibg=bg guifg=#009900
    CSAHi Tag term=NONE cterm=bold ctermbg=255 ctermfg=26 gui=bold guibg=bg guifg=#003399
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=253 ctermfg=160 gui=NONE guibg=#dddddd guifg=#aa0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#fffdfa guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=21 gui=underline guibg=bg guifg=blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=124 gui=NONE guibg=bg guifg=#aa0000
    CSAHi String term=NONE cterm=NONE ctermbg=231 ctermfg=24 gui=italic guibg=bg guifg=#003399
    CSAHi Character term=NONE cterm=NONE ctermbg=231 ctermfg=24 gui=italic guibg=bg guifg=#003399
    CSAHi Number term=NONE cterm=bold ctermbg=231 ctermfg=24 gui=bold guibg=bg guifg=#003399
    CSAHi Boolean term=NONE cterm=bold ctermbg=231 ctermfg=24 gui=bold guibg=bg guifg=#003399
    CSAHi Float term=NONE cterm=bold ctermbg=231 ctermfg=24 gui=bold guibg=bg guifg=#003399
    CSAHi Function term=NONE cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=bg guifg=#0055aa
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=194 ctermfg=18 gui=bold guibg=#eafaea guifg=#000099
    CSAHi Directory term=bold cterm=NONE ctermbg=231 ctermfg=64 gui=NONE guibg=bg guifg=#337700
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=231 ctermfg=160 gui=bold guibg=bg guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=231 ctermfg=24 gui=NONE guibg=bg guifg=#003399
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=246 gui=NONE guibg=bg guifg=#999999
    CSAHi Titled term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=137 ctermfg=229 gui=bold guibg=#aa7733 guifg=#ffeebb
    CSAHi Conditional term=NONE cterm=bold ctermbg=231 ctermfg=137 gui=bold guibg=bg guifg=#aa7733
    CSAHi Repeat term=NONE cterm=bold ctermbg=231 ctermfg=131 gui=bold guibg=bg guifg=#aa5544
    CSAHi Operator term=NONE cterm=bold ctermbg=231 ctermfg=137 gui=bold guibg=bg guifg=#aa7733
    CSAHi Exception term=NONE cterm=bold ctermbg=231 ctermfg=30 gui=bold guibg=bg guifg=#228877
    CSAHi Include term=NONE cterm=bold ctermbg=231 ctermfg=64 gui=bold guibg=bg guifg=#558811
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=229 ctermfg=16 gui=bold guibg=#ffeebb guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=137 ctermfg=224 gui=NONE guibg=#aa8866 guifg=#f8e8cc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=137 ctermfg=223 gui=NONE guibg=#aa8866 guifg=#ffe0bb
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=#fff8cc guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=231 ctermfg=160 gui=bold guibg=bg guifg=#cc0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=194 ctermfg=16 gui=NONE guibg=#ddeedd guifg=#002200
    CSAHi Constant term=underline cterm=bold ctermbg=231 ctermfg=24 gui=bold guibg=bg guifg=#003399
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=24 gui=NONE guibg=bg guifg=#003399
    CSAHi Statement term=bold cterm=NONE ctermbg=231 ctermfg=24 gui=NONE guibg=bg guifg=#003399
    CSAHi PreProc term=underline cterm=bold ctermbg=231 ctermfg=137 gui=bold guibg=bg guifg=#aa7733
    CSAHi Type term=underline cterm=bold ctermbg=231 ctermfg=28 gui=bold guibg=bg guifg=#007700
    CSAHi Typedef term=NONE cterm=NONE ctermbg=231 ctermfg=28 gui=italic guibg=bg guifg=#009900
    CSAHi Tag term=NONE cterm=bold ctermbg=231 ctermfg=24 gui=bold guibg=bg guifg=#003399
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=253 ctermfg=124 gui=NONE guibg=#dddddd guifg=#aa0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#fffdfa guifg=black
    CSAHi Underlined term=underline cterm=underline ctermbg=79 ctermfg=19 gui=underline guibg=bg guifg=blue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=79 ctermfg=84 gui=NONE guibg=bg guifg=#999999
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=red guifg=white
    CSAHi Todo term=NONE cterm=NONE ctermbg=79 ctermfg=32 gui=NONE guibg=bg guifg=#aa0000
    CSAHi String term=NONE cterm=NONE ctermbg=79 ctermfg=17 gui=italic guibg=bg guifg=#003399
    CSAHi Character term=NONE cterm=NONE ctermbg=79 ctermfg=17 gui=italic guibg=bg guifg=#003399
    CSAHi Number term=NONE cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=bg guifg=#003399
    CSAHi Boolean term=NONE cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=bg guifg=#003399
    CSAHi Float term=NONE cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=bg guifg=#003399
    CSAHi Function term=NONE cterm=bold ctermbg=79 ctermfg=21 gui=bold guibg=bg guifg=#0055aa
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi NonText term=bold cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=#eafaea guifg=#000099
    CSAHi Directory term=bold cterm=NONE ctermbg=79 ctermfg=20 gui=NONE guibg=bg guifg=#337700
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=79 ctermfg=48 gui=bold guibg=bg guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=63 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi Search term=reverse cterm=NONE ctermbg=63 ctermfg=16 gui=NONE guibg=#c8e8ff guifg=black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=79 ctermfg=17 gui=NONE guibg=bg guifg=#003399
    CSAHi LineNr term=underline cterm=NONE ctermbg=79 ctermfg=84 gui=NONE guibg=bg guifg=#999999
    CSAHi Titled term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=36 ctermfg=78 gui=bold guibg=#aa7733 guifg=#ffeebb
    CSAHi Conditional term=NONE cterm=bold ctermbg=79 ctermfg=36 gui=bold guibg=bg guifg=#aa7733
    CSAHi Repeat term=NONE cterm=bold ctermbg=79 ctermfg=36 gui=bold guibg=bg guifg=#aa5544
    CSAHi Operator term=NONE cterm=bold ctermbg=79 ctermfg=36 gui=bold guibg=bg guifg=#aa7733
    CSAHi Exception term=NONE cterm=bold ctermbg=79 ctermfg=21 gui=bold guibg=bg guifg=#228877
    CSAHi Include term=NONE cterm=bold ctermbg=79 ctermfg=36 gui=bold guibg=bg guifg=#558811
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=78 ctermfg=16 gui=bold guibg=#ffeebb guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=37 ctermfg=78 gui=NONE guibg=#aa8866 guifg=#f8e8cc
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=37 ctermfg=74 gui=NONE guibg=#aa8866 guifg=#ffe0bb
    CSAHi Title term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=78 ctermfg=16 gui=NONE guibg=#fff8cc guifg=black
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=79 ctermfg=48 gui=bold guibg=bg guifg=#cc0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#ddeedd guifg=#002200
    CSAHi Constant term=underline cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=bg guifg=#003399
    CSAHi Special term=bold cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=bg guifg=fg
    CSAHi Identifier term=underline cterm=NONE ctermbg=79 ctermfg=17 gui=NONE guibg=bg guifg=#003399
    CSAHi Statement term=bold cterm=NONE ctermbg=79 ctermfg=17 gui=NONE guibg=bg guifg=#003399
    CSAHi PreProc term=underline cterm=bold ctermbg=79 ctermfg=36 gui=bold guibg=bg guifg=#aa7733
    CSAHi Type term=underline cterm=bold ctermbg=79 ctermfg=20 gui=bold guibg=bg guifg=#007700
    CSAHi Typedef term=NONE cterm=NONE ctermbg=79 ctermfg=20 gui=italic guibg=bg guifg=#009900
    CSAHi Tag term=NONE cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=bg guifg=#003399
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=bg guifg=fg
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=87 ctermfg=32 gui=NONE guibg=#dddddd guifg=#aa0000
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
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
