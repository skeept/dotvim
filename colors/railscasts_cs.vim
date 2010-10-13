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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=224 gui=NONE guibg=#2B2B2B guifg=#E6E1DC
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#990000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=italic guibg=bg guifg=#BC9458
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=102 ctermfg=16 gui=NONE guibg=#5A647E guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=253 ctermfg=245 gui=NONE guibg=#DEDEDE guifg=#888888
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=150 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#FFFFFF guifg=bg
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=224 ctermfg=235 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=224 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=224 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=180 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=108 gui=NONE guibg=bg guifg=#519F50
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=224 gui=NONE guibg=#144212 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=88 ctermfg=224 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#2B2B2B guifg=#E6E1DC
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=255 gui=NONE guibg=#990000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=italic guibg=bg guifg=#BC9458
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=192 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=103 ctermfg=16 gui=NONE guibg=#5A647E guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=253 ctermfg=245 gui=NONE guibg=#DEDEDE guifg=#888888
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=192 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=103 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=NONE guibg=#FFFFFF guifg=bg
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=231 ctermfg=59 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=103 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=180 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#519F50
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=231 gui=NONE guibg=#144212 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=88 ctermfg=231 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=188 gui=NONE guibg=#2B2B2B guifg=#E6E1DC
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=#990000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=137 gui=italic guibg=bg guifg=#BC9458
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=188 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=60 ctermfg=16 gui=NONE guibg=#5A647E guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=253 ctermfg=102 gui=NONE guibg=#DEDEDE guifg=#888888
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#FFFFFF guifg=bg
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=188 ctermfg=235 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=137 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#519F50
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=188 gui=NONE guibg=#144212 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#2B2B2B guifg=#E6E1DC
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#990000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=italic guibg=bg guifg=#BC9458
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=Blue
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=87 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#5A647E guifg=Black
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=#DEDEDE guifg=#888888
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=41 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=84 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=87 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=#FFFFFF guifg=bg
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=87 ctermfg=80 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=87 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=87 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi lCursor term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=53 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=Orange
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#519F50
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=#144212 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=32 ctermfg=87 gui=bold guibg=#660000 guifg=#E6E1DC
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
