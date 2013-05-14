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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=184 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=Black guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=236 ctermfg=221 gui=NONE guibg=#2E2E2E guifg=#FFE13F
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=187 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=184 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=184 gui=bold guibg=bg guifg=#ddbb00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=184 ctermfg=16 gui=bold guibg=#ddbb00 guifg=Black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#978345
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=184 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=184 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=208 ctermfg=16 gui=NONE guibg=#FF5E06 guifg=bg
    CSAHi Menu term=NONE cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=black guifg=#ffddaa
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=16 ctermfg=184 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=223 gui=bold guibg=bg guifg=#ffddaa
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=236 ctermfg=143 gui=bold guibg=#2E2E2E guifg=#978345
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=237 gui=reverse guibg=#3E3E3E guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=143 gui=reverse guibg=#978345 guifg=#2E2E2E
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=187 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Visual term=reverse cterm=NONE ctermbg=184 ctermfg=248 gui=reverse guibg=DarkGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=236 ctermfg=214 gui=NONE guibg=#2E2E2E guifg=orange
    CSAHi lCursor term=NONE cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#978345
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#DBCA98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=#FFE13F
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=220 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=Black guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=236 ctermfg=227 gui=NONE guibg=#2E2E2E guifg=#FFE13F
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=220 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=220 gui=bold guibg=bg guifg=#ddbb00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=220 ctermfg=16 gui=bold guibg=#ddbb00 guifg=Black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#978345
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=220 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=208 ctermfg=16 gui=NONE guibg=#FF5E06 guifg=bg
    CSAHi Menu term=NONE cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=black guifg=#ffddaa
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=16 ctermfg=220 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#ffddaa
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=236 ctermfg=180 gui=bold guibg=#2E2E2E guifg=#978345
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=237 gui=reverse guibg=#3E3E3E guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=180 gui=reverse guibg=#978345 guifg=#2E2E2E
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Visual term=reverse cterm=NONE ctermbg=220 ctermfg=248 gui=reverse guibg=DarkGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=236 ctermfg=220 gui=NONE guibg=#2E2E2E guifg=orange
    CSAHi lCursor term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#978345
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#DBCA98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=#FFE13F
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=178 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=Black guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=236 ctermfg=221 gui=NONE guibg=#2E2E2E guifg=#FFE13F
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=178 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=178 gui=bold guibg=bg guifg=#ddbb00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=178 ctermfg=16 gui=bold guibg=#ddbb00 guifg=Black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=#978345
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=178 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=178 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=202 ctermfg=16 gui=NONE guibg=#FF5E06 guifg=bg
    CSAHi Menu term=NONE cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=black guifg=#ffddaa
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=16 ctermfg=178 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=223 gui=bold guibg=bg guifg=#ffddaa
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=236 ctermfg=101 gui=bold guibg=#2E2E2E guifg=#978345
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=250 ctermfg=237 gui=reverse guibg=#3E3E3E guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=101 gui=reverse guibg=#978345 guifg=#2E2E2E
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Visual term=reverse cterm=NONE ctermbg=178 ctermfg=248 gui=reverse guibg=DarkGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=236 ctermfg=214 gui=NONE guibg=#2E2E2E guifg=orange
    CSAHi lCursor term=NONE cterm=NONE ctermbg=178 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=#978345
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#DBCA98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=#FFE13F
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=56 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=Black guifg=Red
    CSAHi Todo term=NONE cterm=NONE ctermbg=80 ctermfg=72 gui=NONE guibg=#2E2E2E guifg=#FFE13F
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=56 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=white
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=56 gui=bold guibg=bg guifg=#ddbb00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=56 ctermfg=16 gui=bold guibg=#ddbb00 guifg=Black
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#978345
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=56 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=56 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=#FF5E06 guifg=bg
    CSAHi Menu term=NONE cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=black guifg=#ffddaa
    CSAHi Scrollbar term=NONE cterm=NONE ctermbg=16 ctermfg=56 gui=NONE guibg=black guifg=#ddbb00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=73 gui=bold guibg=bg guifg=#ffddaa
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=80 ctermfg=36 gui=bold guibg=#2E2E2E guifg=#978345
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=85 ctermfg=80 gui=reverse guibg=#3E3E3E guifg=grey
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=36 gui=reverse guibg=#978345 guifg=#2E2E2E
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=#DBCA98
    CSAHi Visual term=reverse cterm=NONE ctermbg=56 ctermfg=84 gui=reverse guibg=DarkGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=68 gui=NONE guibg=#2E2E2E guifg=orange
    CSAHi lCursor term=NONE cterm=NONE ctermbg=56 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#978345
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#DBCA98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffddaa
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#FFE13F
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
