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
    CSAHi Normal term=NONE cterm=NONE ctermbg=58 ctermfg=144 gui=NONE guibg=#332412 guifg=#9b8f78
    CSAHi Underlined term=underline cterm=underline ctermbg=58 ctermfg=108 gui=underline guibg=bg guifg=#66996d
    CSAHi Ignore term=NONE cterm=NONE ctermbg=58 ctermfg=58 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=61 ctermfg=144 gui=underline guibg=#413399 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=175 ctermfg=58 gui=underline guibg=#cc668b guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=58 ctermfg=186 gui=NONE guibg=bg guifg=#becc66
    CSAHi NonText term=bold cterm=underline ctermbg=58 ctermfg=58 gui=underline guibg=#2c2210 guifg=#2c2210
    CSAHi Directory term=bold cterm=NONE ctermbg=58 ctermfg=95 gui=NONE guibg=bg guifg=#774b44
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=176 ctermfg=58 gui=underline guibg=#dd66bb guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=180 ctermfg=58 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=130 ctermfg=58 gui=underline guibg=#994113 guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=131 ctermfg=58 gui=underline guibg=#983235 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=137 ctermfg=58 gui=underline guibg=#997433 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=52 ctermfg=102 gui=underline guibg=#1c1200 guifg=#756664
    CSAHi htmlBold term=NONE cterm=underline ctermbg=139 ctermfg=58 gui=underline guibg=#aa668f guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=58 ctermfg=139 gui=underline guibg=bg guifg=#aa668f
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=179 ctermfg=58 gui=underline guibg=#cc8a44 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=58 ctermfg=179 gui=underline guibg=bg guifg=#cc8a44
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=132 ctermfg=58 gui=underline guibg=#aa3355 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=58 ctermfg=132 gui=underline guibg=bg guifg=#aa3355
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=58 ctermfg=144 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=144 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=144 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=180 ctermfg=58 gui=underline guibg=#cc9069 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=58 ctermfg=144 gui=underline guibg=bg guifg=#aaa366
    CSAHi CursorIM term=NONE cterm=underline ctermbg=136 ctermfg=144 gui=underline guibg=#887900 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=131 ctermfg=58 gui=underline guibg=#983235 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=52 ctermfg=144 gui=underline guibg=#1c1200 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=52 ctermfg=59 gui=underline guibg=#1c1200 guifg=#3c2e2c
    CSAHi VertSplit term=reverse cterm=underline ctermbg=52 ctermfg=58 gui=underline guibg=#1c1200 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=94 ctermfg=144 gui=underline guibg=#553614 guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=137 ctermfg=58 gui=underline guibg=#886b46 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=175 ctermfg=58 gui=underline guibg=#cc668b guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=180 ctermfg=58 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=102 gui=NONE guibg=bg guifg=#756664
    CSAHi lCursor term=NONE cterm=NONE ctermbg=144 ctermfg=58 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=58 ctermfg=136 gui=NONE guibg=bg guifg=#887900
    CSAHi Constant term=underline cterm=NONE ctermbg=58 ctermfg=137 gui=NONE guibg=bg guifg=#885222
    CSAHi Special term=bold cterm=NONE ctermbg=58 ctermfg=180 gui=NONE guibg=bg guifg=#bb9466
    CSAHi Identifier term=underline cterm=NONE ctermbg=58 ctermfg=174 gui=NONE guibg=bg guifg=#be7569
    CSAHi Statement term=bold cterm=NONE ctermbg=58 ctermfg=139 gui=NONE guibg=bg guifg=#aa668f
    CSAHi PreProc term=underline cterm=NONE ctermbg=58 ctermfg=102 gui=NONE guibg=bg guifg=#775a55
    CSAHi Type term=underline cterm=NONE ctermbg=58 ctermfg=173 gui=NONE guibg=bg guifg=#bb7b22
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=58 ctermfg=102 gui=NONE guibg=bg guifg=#756664
    CSAHi DiffAdd term=bold cterm=underline ctermbg=168 ctermfg=58 gui=underline guibg=#cc2270 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=138 ctermfg=58 gui=underline guibg=#aa6155 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=137 ctermfg=58 gui=NONE guibg=#aa7922 guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=217 ctermfg=58 gui=underline guibg=#ffa799 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=58 ctermfg=181 gui=NONE guibg=#332412 guifg=#9b8f78
    CSAHi Underlined term=underline cterm=underline ctermbg=58 ctermfg=115 gui=underline guibg=bg guifg=#66996d
    CSAHi Ignore term=NONE cterm=NONE ctermbg=58 ctermfg=58 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=98 ctermfg=181 gui=underline guibg=#413399 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=211 ctermfg=58 gui=underline guibg=#cc668b guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=58 ctermfg=192 gui=NONE guibg=bg guifg=#becc66
    CSAHi NonText term=bold cterm=underline ctermbg=58 ctermfg=58 gui=underline guibg=#2c2210 guifg=#2c2210
    CSAHi Directory term=bold cterm=NONE ctermbg=58 ctermfg=138 gui=NONE guibg=bg guifg=#774b44
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=212 ctermfg=58 gui=underline guibg=#dd66bb guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=216 ctermfg=58 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=172 ctermfg=58 gui=underline guibg=#994113 guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=167 ctermfg=58 gui=underline guibg=#983235 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=179 ctermfg=58 gui=underline guibg=#997433 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=52 ctermfg=138 gui=underline guibg=#1c1200 guifg=#756664
    CSAHi htmlBold term=NONE cterm=underline ctermbg=175 ctermfg=58 gui=underline guibg=#aa668f guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=58 ctermfg=175 gui=underline guibg=bg guifg=#aa668f
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=216 ctermfg=58 gui=underline guibg=#cc8a44 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=58 ctermfg=216 gui=underline guibg=bg guifg=#cc8a44
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=168 ctermfg=58 gui=underline guibg=#aa3355 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=58 ctermfg=168 gui=underline guibg=bg guifg=#aa3355
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=58 ctermfg=181 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=181 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=181 ctermfg=58 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=216 ctermfg=58 gui=underline guibg=#cc9069 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=58 ctermfg=186 gui=underline guibg=bg guifg=#aaa366
    CSAHi CursorIM term=NONE cterm=underline ctermbg=142 ctermfg=181 gui=underline guibg=#887900 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=167 ctermfg=58 gui=underline guibg=#983235 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=52 ctermfg=181 gui=underline guibg=#1c1200 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=52 ctermfg=59 gui=underline guibg=#1c1200 guifg=#3c2e2c
    CSAHi VertSplit term=reverse cterm=underline ctermbg=52 ctermfg=58 gui=underline guibg=#1c1200 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=94 ctermfg=181 gui=underline guibg=#553614 guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=144 ctermfg=58 gui=underline guibg=#886b46 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=211 ctermfg=58 gui=underline guibg=#cc668b guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=216 ctermfg=58 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=138 gui=NONE guibg=bg guifg=#756664
    CSAHi lCursor term=NONE cterm=NONE ctermbg=181 ctermfg=58 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=58 ctermfg=142 gui=NONE guibg=bg guifg=#887900
    CSAHi Constant term=underline cterm=NONE ctermbg=58 ctermfg=137 gui=NONE guibg=bg guifg=#885222
    CSAHi Special term=bold cterm=NONE ctermbg=58 ctermfg=180 gui=NONE guibg=bg guifg=#bb9466
    CSAHi Identifier term=underline cterm=NONE ctermbg=58 ctermfg=180 gui=NONE guibg=bg guifg=#be7569
    CSAHi Statement term=bold cterm=NONE ctermbg=58 ctermfg=175 gui=NONE guibg=bg guifg=#aa668f
    CSAHi PreProc term=underline cterm=NONE ctermbg=58 ctermfg=138 gui=NONE guibg=bg guifg=#775a55
    CSAHi Type term=underline cterm=NONE ctermbg=58 ctermfg=179 gui=NONE guibg=bg guifg=#bb7b22
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=58 ctermfg=138 gui=NONE guibg=bg guifg=#756664
    CSAHi DiffAdd term=bold cterm=underline ctermbg=205 ctermfg=58 gui=underline guibg=#cc2270 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=174 ctermfg=58 gui=underline guibg=#aa6155 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=179 ctermfg=58 gui=NONE guibg=#aa7922 guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=224 ctermfg=58 gui=underline guibg=#ffa799 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=52 ctermfg=102 gui=NONE guibg=#332412 guifg=#9b8f78
    CSAHi Underlined term=underline cterm=underline ctermbg=52 ctermfg=65 gui=underline guibg=bg guifg=#66996d
    CSAHi Ignore term=NONE cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=60 ctermfg=102 gui=underline guibg=#413399 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=168 ctermfg=52 gui=underline guibg=#cc668b guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=52 ctermfg=149 gui=NONE guibg=bg guifg=#becc66
    CSAHi NonText term=bold cterm=underline ctermbg=16 ctermfg=16 gui=underline guibg=#2c2210 guifg=#2c2210
    CSAHi Directory term=bold cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=bg guifg=#774b44
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=169 ctermfg=52 gui=underline guibg=#dd66bb guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=173 ctermfg=52 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=94 ctermfg=52 gui=underline guibg=#994113 guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=95 ctermfg=52 gui=underline guibg=#983235 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=101 ctermfg=52 gui=underline guibg=#997433 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=16 ctermfg=95 gui=underline guibg=#1c1200 guifg=#756664
    CSAHi htmlBold term=NONE cterm=underline ctermbg=132 ctermfg=52 gui=underline guibg=#aa668f guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=52 ctermfg=132 gui=underline guibg=bg guifg=#aa668f
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=173 ctermfg=52 gui=underline guibg=#cc8a44 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=52 ctermfg=173 gui=underline guibg=bg guifg=#cc8a44
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=131 ctermfg=52 gui=underline guibg=#aa3355 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=52 ctermfg=131 gui=underline guibg=bg guifg=#aa3355
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=52 ctermfg=102 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=102 ctermfg=52 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=102 ctermfg=52 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=173 ctermfg=52 gui=underline guibg=#cc9069 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=52 ctermfg=143 gui=underline guibg=bg guifg=#aaa366
    CSAHi CursorIM term=NONE cterm=underline ctermbg=100 ctermfg=102 gui=underline guibg=#887900 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=95 ctermfg=52 gui=underline guibg=#983235 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=16 ctermfg=102 gui=underline guibg=#1c1200 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=16 ctermfg=52 gui=underline guibg=#1c1200 guifg=#3c2e2c
    CSAHi VertSplit term=reverse cterm=underline ctermbg=16 ctermfg=52 gui=underline guibg=#1c1200 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=58 ctermfg=102 gui=underline guibg=#553614 guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=95 ctermfg=52 gui=underline guibg=#886b46 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=168 ctermfg=52 gui=underline guibg=#cc668b guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=173 ctermfg=52 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=bg guifg=#756664
    CSAHi lCursor term=NONE cterm=NONE ctermbg=102 ctermfg=52 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=52 ctermfg=100 gui=NONE guibg=bg guifg=#887900
    CSAHi Constant term=underline cterm=NONE ctermbg=52 ctermfg=94 gui=NONE guibg=bg guifg=#885222
    CSAHi Special term=bold cterm=NONE ctermbg=52 ctermfg=137 gui=NONE guibg=bg guifg=#bb9466
    CSAHi Identifier term=underline cterm=NONE ctermbg=52 ctermfg=137 gui=NONE guibg=bg guifg=#be7569
    CSAHi Statement term=bold cterm=NONE ctermbg=52 ctermfg=132 gui=NONE guibg=bg guifg=#aa668f
    CSAHi PreProc term=underline cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=bg guifg=#775a55
    CSAHi Type term=underline cterm=NONE ctermbg=52 ctermfg=136 gui=NONE guibg=bg guifg=#bb7b22
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=52 ctermfg=95 gui=NONE guibg=bg guifg=#756664
    CSAHi DiffAdd term=bold cterm=underline ctermbg=161 ctermfg=52 gui=underline guibg=#cc2270 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=131 ctermfg=52 gui=underline guibg=#aa6155 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=136 ctermfg=52 gui=NONE guibg=#aa7922 guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=216 ctermfg=52 gui=underline guibg=#ffa799 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#332412 guifg=#9b8f78
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=#66996d
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=underline ctermbg=17 ctermfg=37 gui=underline guibg=#413399 guifg=fg
    CSAHi Todo term=NONE cterm=underline ctermbg=53 ctermfg=16 gui=underline guibg=#cc668b guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=bg guifg=#becc66
    CSAHi NonText term=bold cterm=underline ctermbg=16 ctermfg=16 gui=underline guibg=#2c2210 guifg=#2c2210
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=bg guifg=#774b44
    CSAHi ErrorMsg term=NONE cterm=underline ctermbg=54 ctermfg=16 gui=underline guibg=#dd66bb guifg=bg
    CSAHi IncSearch term=reverse cterm=underline ctermbg=53 ctermfg=16 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Search term=reverse cterm=underline ctermbg=32 ctermfg=16 gui=underline guibg=#994113 guifg=bg
    CSAHi MoreMsg term=bold cterm=underline ctermbg=32 ctermfg=16 gui=underline guibg=#983235 guifg=bg
    CSAHi ModeMsg term=bold cterm=underline ctermbg=36 ctermfg=16 gui=underline guibg=#997433 guifg=bg
    CSAHi LineNr term=underline cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=#1c1200 guifg=#756664
    CSAHi htmlBold term=NONE cterm=underline ctermbg=37 ctermfg=16 gui=underline guibg=#aa668f guifg=bg
    CSAHi htmlBoldUnderline term=NONE cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=#aa668f
    CSAHi htmlItalic term=NONE cterm=underline ctermbg=52 ctermfg=16 gui=underline guibg=#cc8a44 guifg=bg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=16 ctermfg=52 gui=underline guibg=bg guifg=#cc8a44
    CSAHi htmlBoldItalic term=NONE cterm=underline ctermbg=33 ctermfg=16 gui=underline guibg=#aa3355 guifg=bg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=underline ctermbg=16 ctermfg=33 gui=underline guibg=bg guifg=#aa3355
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=underline ctermbg=53 ctermfg=16 gui=underline guibg=#cc9069 guifg=bg
    CSAHi htmlLink term=NONE cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=bg guifg=#aaa366
    CSAHi CursorIM term=NONE cterm=underline ctermbg=36 ctermfg=37 gui=underline guibg=#887900 guifg=fg
    CSAHi Question term=NONE cterm=underline ctermbg=32 ctermfg=16 gui=underline guibg=#983235 guifg=bg
    CSAHi StatusLine term=reverse,bold cterm=underline ctermbg=16 ctermfg=37 gui=underline guibg=#1c1200 guifg=fg
    CSAHi StatusLineNC term=reverse cterm=underline ctermbg=16 ctermfg=80 gui=underline guibg=#1c1200 guifg=#3c2e2c
    CSAHi VertSplit term=reverse cterm=underline ctermbg=16 ctermfg=16 gui=underline guibg=#1c1200 guifg=bg
    CSAHi Title term=bold cterm=underline ctermbg=32 ctermfg=37 gui=underline guibg=#553614 guifg=fg
    CSAHi Visual term=reverse cterm=underline ctermbg=37 ctermfg=16 gui=underline guibg=#886b46 guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=underline ctermbg=53 ctermfg=16 gui=underline guibg=#cc668b guifg=bg
    CSAHi WildMenu term=NONE cterm=underline ctermbg=53 ctermfg=16 gui=underline guibg=#cc9069 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#756664
    CSAHi lCursor term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=bg guifg=#887900
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=bg guifg=#885222
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=53 gui=NONE guibg=bg guifg=#bb9466
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=53 gui=NONE guibg=bg guifg=#be7569
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#aa668f
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#775a55
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=52 gui=NONE guibg=bg guifg=#bb7b22
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#756664
    CSAHi DiffAdd term=bold cterm=underline ctermbg=49 ctermfg=16 gui=underline guibg=#cc2270 guifg=bg
    CSAHi DiffChange term=bold cterm=underline ctermbg=37 ctermfg=16 gui=underline guibg=#aa6155 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=36 ctermfg=16 gui=NONE guibg=#aa7922 guifg=bg
    CSAHi DiffText term=reverse cterm=underline ctermbg=69 ctermfg=16 gui=underline guibg=#ffa799 guifg=bg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
