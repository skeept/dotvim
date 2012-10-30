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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#C0C0C0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=222 gui=NONE guibg=#EE0000 guifg=#FFDD60
    CSAHi Todo term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=#EEE000 guifg=#000000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#FFFFFF
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=#000000 guifg=#FFDDAA
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=252 gui=NONE guibg=#000000 guifg=#D0D0D0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=226 gui=NONE guibg=#CC0000 guifg=#FFEE00
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=172 ctermfg=220 gui=NONE guibg=#D05000 guifg=#FFE000
    CSAHi Search term=reverse cterm=NONE ctermbg=100 ctermfg=226 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=18 ctermfg=44 gui=NONE guibg=#000070 guifg=#00B8E0
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=#000000 guifg=#E8E8E8
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=218 gui=NONE guibg=#000000 guifg=#F0B0E0
    CSAHi rcursor term=NONE cterm=NONE ctermbg=45 ctermfg=16 gui=NONE guibg=#00CCFF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi ncursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi icursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#FFEE00 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=28 ctermfg=83 gui=NONE guibg=#005900 guifg=#40E840
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=233 ctermfg=227 gui=NONE guibg=#0f0f0f guifg=#eaea3a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=28 ctermfg=77 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=28 ctermfg=77 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=100 ctermfg=226 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=241 ctermfg=228 gui=NONE guibg=#5f5f5f guifg=#FFEE60
    CSAHi Folded term=NONE cterm=NONE ctermbg=96 ctermfg=188 gui=NONE guibg=#703070 guifg=#DDB8DD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=#40D040 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=#006699
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=44 gui=NONE guibg=#000000 guifg=#00B8E0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=182 gui=NONE guibg=#000000 guifg=#B899C8
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=216 gui=NONE guibg=#000000 guifg=#FFA850
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=227 gui=NONE guibg=#000000 guifg=#EEE840
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#000000 guifg=#00B098
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#40D040
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=161 ctermfg=255 gui=NONE guibg=#C4153B guifg=#F0F0F0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=NONE guibg=#707070 guifg=#F0F0F0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#C0C0C0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=228 gui=NONE guibg=#EE0000 guifg=#FFDD60
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#EEE000 guifg=#000000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#FFFFFF
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#FFDDAA
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=252 gui=NONE guibg=#000000 guifg=#D0D0D0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=226 gui=NONE guibg=#CC0000 guifg=#FFEE00
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=208 ctermfg=226 gui=NONE guibg=#D05000 guifg=#FFE000
    CSAHi Search term=reverse cterm=NONE ctermbg=142 ctermfg=226 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=19 ctermfg=45 gui=NONE guibg=#000070 guifg=#00B8E0
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=#000000 guifg=#E8E8E8
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=225 gui=NONE guibg=#000000 guifg=#F0B0E0
    CSAHi rcursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=#00CCFF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi ncursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi icursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#FFEE00 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=28 ctermfg=120 gui=NONE guibg=#005900 guifg=#40E840
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=233 ctermfg=227 gui=NONE guibg=#0f0f0f guifg=#eaea3a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=28 ctermfg=120 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=28 ctermfg=120 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=142 ctermfg=226 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=241 ctermfg=228 gui=NONE guibg=#5f5f5f guifg=#FFEE60
    CSAHi Folded term=NONE cterm=NONE ctermbg=133 ctermfg=225 gui=NONE guibg=#703070 guifg=#DDB8DD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=120 ctermfg=16 gui=NONE guibg=#40D040 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=32 gui=NONE guibg=#000000 guifg=#006699
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#000000 guifg=#00B8E0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=189 gui=NONE guibg=#000000 guifg=#B899C8
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=222 gui=NONE guibg=#000000 guifg=#FFA850
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=228 gui=NONE guibg=#000000 guifg=#EEE840
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=44 gui=NONE guibg=#000000 guifg=#00B098
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#40D040
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=197 ctermfg=255 gui=NONE guibg=#C4153B guifg=#F0F0F0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=NONE guibg=#707070 guifg=#F0F0F0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#C0C0C0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=221 gui=NONE guibg=#EE0000 guifg=#FFDD60
    CSAHi Todo term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=#EEE000 guifg=#000000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#FFFFFF
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=#000000 guifg=#FFDDAA
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=252 gui=NONE guibg=#000000 guifg=#D0D0D0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=226 gui=NONE guibg=#CC0000 guifg=#FFEE00
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=166 ctermfg=220 gui=NONE guibg=#D05000 guifg=#FFE000
    CSAHi Search term=reverse cterm=NONE ctermbg=58 ctermfg=226 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#000070 guifg=#00B8E0
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=254 gui=NONE guibg=#000000 guifg=#E8E8E8
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=218 gui=NONE guibg=#000000 guifg=#F0B0E0
    CSAHi rcursor term=NONE cterm=NONE ctermbg=45 ctermfg=16 gui=NONE guibg=#00CCFF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi ncursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi icursor term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#FFEE00 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=22 ctermfg=77 gui=NONE guibg=#005900 guifg=#40E840
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=233 ctermfg=185 gui=NONE guibg=#0f0f0f guifg=#eaea3a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=22 ctermfg=77 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=22 ctermfg=77 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=58 ctermfg=226 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=59 ctermfg=227 gui=NONE guibg=#5f5f5f guifg=#FFEE60
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=182 gui=NONE guibg=#703070 guifg=#DDB8DD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=#40D040 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#006699
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=#000000 guifg=#00B8E0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=140 gui=NONE guibg=#000000 guifg=#B899C8
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=215 gui=NONE guibg=#000000 guifg=#FFA850
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=221 gui=NONE guibg=#000000 guifg=#EEE840
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=#000000 guifg=#00B098
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#40D040
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=161 ctermfg=255 gui=NONE guibg=#C4153B guifg=#F0F0F0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=239 ctermfg=252 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=242 ctermfg=255 gui=NONE guibg=#707070 guifg=#F0F0F0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=85 gui=NONE guibg=#000000 guifg=#C0C0C0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=73 gui=NONE guibg=#EE0000 guifg=#FFDD60
    CSAHi Todo term=NONE cterm=NONE ctermbg=72 ctermfg=16 gui=NONE guibg=#EEE000 guifg=#000000
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#FFFFFF
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=#000000 guifg=#FFDDAA
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=86 gui=NONE guibg=#000000 guifg=#D0D0D0
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=76 gui=NONE guibg=#CC0000 guifg=#FFEE00
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=52 ctermfg=72 gui=NONE guibg=#D05000 guifg=#FFE000
    CSAHi Search term=reverse cterm=NONE ctermbg=36 ctermfg=76 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=17 ctermfg=26 gui=NONE guibg=#000070 guifg=#00B8E0
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#000000 guifg=#E8E8E8
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=74 gui=NONE guibg=#000000 guifg=#F0B0E0
    CSAHi rcursor term=NONE cterm=NONE ctermbg=27 ctermfg=16 gui=NONE guibg=#00CCFF guifg=#000000
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi ncursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi icursor term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#FFEE00 guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=20 ctermfg=28 gui=NONE guibg=#005900 guifg=#40E840
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#0f0f0f guifg=#eaea3a
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#1f1f1f guifg=#F0F0F0
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Visual term=reverse cterm=NONE ctermbg=20 ctermfg=24 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=20 ctermfg=24 gui=NONE guibg=#005900 guifg=#40C940
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=36 ctermfg=76 gui=NONE guibg=#707000 guifg=#FFFF00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=81 ctermfg=77 gui=NONE guibg=#5f5f5f guifg=#FFEE60
    CSAHi Folded term=NONE cterm=NONE ctermbg=33 ctermfg=58 gui=NONE guibg=#703070 guifg=#DDB8DD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=24 ctermfg=16 gui=NONE guibg=#40D040 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=#000000 guifg=#006699
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=26 gui=NONE guibg=#000000 guifg=#00B8E0
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=54 gui=NONE guibg=#000000 guifg=#B899C8
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=69 gui=NONE guibg=#000000 guifg=#FFA850
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#000000 guifg=#EEE840
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=25 gui=NONE guibg=#000000 guifg=#00B098
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#40D040
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=48 ctermfg=87 gui=NONE guibg=#C4153B guifg=#F0F0F0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=81 ctermfg=86 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffChange term=bold cterm=NONE ctermbg=81 ctermfg=86 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=81 ctermfg=86 gui=NONE guibg=#505050 guifg=#D0D0D0
    CSAHi DiffText term=reverse cterm=NONE ctermbg=82 ctermfg=87 gui=NONE guibg=#707070 guifg=#F0F0F0
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
