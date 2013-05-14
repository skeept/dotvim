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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=grey15 guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=220 gui=bold guibg=bg guifg=gold
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=navajowhite
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=68 gui=bold guibg=grey15 guifg=RoyalBlue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=46 ctermfg=16 gui=reverse guibg=black guifg=green
    CSAHi Search term=reverse cterm=NONE ctermbg=179 ctermfg=224 gui=NONE guibg=peru guifg=wheat
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=goldenrod
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=grey50
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=229 ctermfg=109 gui=NONE guibg=khaki guifg=slategrey
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=187 ctermfg=102 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=187 ctermfg=102 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=220 gui=bold guibg=bg guifg=gold
    CSAHi Visual term=reverse cterm=NONE ctermbg=107 ctermfg=229 gui=NONE guibg=olivedrab guifg=khaki
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=black guifg=grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=grey40
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=darkkhaki
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=salmon
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi PreProc term=underline cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=white guifg=red
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=green
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=black guifg=grey20
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=255 gui=NONE guibg=grey15 guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=208 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=gold
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=navajowhite
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=105 gui=bold guibg=grey15 guifg=RoyalBlue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=46 ctermfg=16 gui=reverse guibg=black guifg=green
    CSAHi Search term=reverse cterm=NONE ctermbg=215 ctermfg=230 gui=NONE guibg=peru guifg=wheat
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=goldenrod
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=grey50
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=229 ctermfg=145 gui=NONE guibg=khaki guifg=slategrey
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=224 ctermfg=241 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=224 ctermfg=241 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=gold
    CSAHi Visual term=reverse cterm=NONE ctermbg=143 ctermfg=229 gui=NONE guibg=olivedrab guifg=khaki
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=241 gui=NONE guibg=black guifg=grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=darkkhaki
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=salmon
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=white guifg=red
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=green
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=236 gui=NONE guibg=black guifg=grey20
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=grey15 guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=220 gui=bold guibg=bg guifg=gold
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=navajowhite
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=62 gui=bold guibg=grey15 guifg=RoyalBlue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=46 ctermfg=16 gui=reverse guibg=black guifg=green
    CSAHi Search term=reverse cterm=NONE ctermbg=173 ctermfg=223 gui=NONE guibg=peru guifg=wheat
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=178 gui=bold guibg=bg guifg=goldenrod
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=grey50
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=222 ctermfg=66 gui=NONE guibg=khaki guifg=slategrey
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=red
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=241 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=241 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=220 gui=bold guibg=bg guifg=gold
    CSAHi Visual term=reverse cterm=NONE ctermbg=64 ctermfg=222 gui=NONE guibg=olivedrab guifg=khaki
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=241 gui=NONE guibg=black guifg=grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=grey40
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=darkkhaki
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=salmon
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi PreProc term=underline cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=white guifg=red
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=green
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=236 gui=NONE guibg=black guifg=grey20
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=grey15 guifg=White
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=grey40
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=64 gui=NONE guibg=yellow2 guifg=orangered
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=SkyBlue
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=gold
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=navajowhite
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=yellowgreen
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=22 gui=bold guibg=grey15 guifg=RoyalBlue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=28 ctermfg=16 gui=reverse guibg=black guifg=green
    CSAHi Search term=reverse cterm=NONE ctermbg=52 ctermfg=74 gui=NONE guibg=peru guifg=wheat
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=goldenrod
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=grey50
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=73 ctermfg=37 gui=NONE guibg=khaki guifg=slategrey
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=red
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=springgreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=black
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=57 ctermfg=81 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=57 ctermfg=81 gui=NONE guibg=#c2bfa5 guifg=grey40
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=gold
    CSAHi Visual term=reverse cterm=NONE ctermbg=36 ctermfg=73 gui=NONE guibg=olivedrab guifg=khaki
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=black guifg=grey40
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=grey40
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=darkkhaki
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=salmon
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi PreProc term=underline cterm=NONE ctermbg=79 ctermfg=64 gui=NONE guibg=white guifg=red
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=CornflowerBlue
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=green
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=80 gui=NONE guibg=black guifg=grey20
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
