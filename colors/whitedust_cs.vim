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
    CSAHi Normal term=NONE cterm=NONE ctermbg=250 ctermfg=59 gui=NONE guibg=#C0C0C0 guifg=#333333
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#FFFFFF guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#336C6C
    CSAHi Character term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#535F5C
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=#636C4C
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#000070
    CSAHi Macro term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#205070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#818181
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=254 gui=bold guibg=bg guifg=#E0E0E0
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#FF3F30 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=73 gui=reverse guibg=#3EA399 guifg=#FFFFFF
    CSAHi Search term=reverse cterm=NONE ctermbg=73 ctermfg=231 gui=NONE guibg=#3EA399 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi LineNr term=underline cterm=NONE ctermbg=250 ctermfg=244 gui=NONE guibg=#B9B9B9 guifg=#808080
    CSAHi Condtional term=NONE cterm=NONE ctermbg=bg ctermfg=88 gui=NONE guibg=bg guifg=#700000
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=59 ctermfg=250 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=59 ctermfg=250 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=239 ctermfg=231 gui=NONE guibg=#515151 guifg=#FFFFFF
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Repeat term=NONE cterm=underline ctermbg=bg ctermfg=88 gui=underline guibg=bg guifg=#700000
    CSAHi Label term=NONE cterm=underline ctermbg=bg ctermfg=88 gui=underline guibg=bg guifg=#700000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Exception term=NONE cterm=underline ctermbg=bg ctermfg=88 gui=underline guibg=bg guifg=#700000
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=188 ctermfg=30 gui=reverse,bold guibg=#0E7369 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi Title term=bold cterm=bold ctermbg=188 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=188 ctermfg=30 gui=reverse guibg=#0E7369 guifg=#CCCCCC
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=30 ctermfg=188 gui=bold,underline guibg=#0E7369 guifg=#CCCCCC
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=188 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#235C5C guifg=#FFFFFF
    CSAHi Folded term=NONE cterm=NONE ctermbg=188 ctermfg=66 gui=NONE guibg=#CCCCCC guifg=#235C5C
    CSAHi lCursor term=NONE cterm=NONE ctermbg=59 ctermfg=250 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=88 gui=bold guibg=bg guifg=#700000
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Structure term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Typedef term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Tag term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#707070
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=66 gui=NONE guibg=#B9B9B9 guifg=#235C5C
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=152 ctermfg=fg gui=NONE guibg=#9EC3B9 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#CCCCCC guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=250 ctermfg=188 gui=NONE guibg=#B9B9B9 guifg=#CCCCCC
    CSAHi DiffText term=reverse cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=#E0E0E0 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=250 ctermfg=236 gui=NONE guibg=#C0C0C0 guifg=#333333
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=#FFFFFF guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#336C6C
    CSAHi Character term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#535F5C
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=108 gui=NONE guibg=bg guifg=#636C4C
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#000070
    CSAHi Macro term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#205070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#818181
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=254 gui=bold guibg=bg guifg=#E0E0E0
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=203 ctermfg=255 gui=NONE guibg=#FF3F30 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=255 ctermfg=80 gui=reverse guibg=#3EA399 guifg=#FFFFFF
    CSAHi Search term=reverse cterm=NONE ctermbg=80 ctermfg=255 gui=NONE guibg=#3EA399 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi LineNr term=underline cterm=NONE ctermbg=250 ctermfg=244 gui=NONE guibg=#B9B9B9 guifg=#808080
    CSAHi Condtional term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=#700000
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=236 ctermfg=250 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=236 ctermfg=250 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=239 ctermfg=255 gui=NONE guibg=#515151 guifg=#FFFFFF
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Repeat term=NONE cterm=underline ctermbg=bg ctermfg=124 gui=underline guibg=bg guifg=#700000
    CSAHi Label term=NONE cterm=underline ctermbg=bg ctermfg=124 gui=underline guibg=bg guifg=#700000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Exception term=NONE cterm=underline ctermbg=bg ctermfg=124 gui=underline guibg=bg guifg=#700000
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=252 ctermfg=36 gui=reverse,bold guibg=#0E7369 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=252 ctermfg=236 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=252 ctermfg=236 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi Title term=bold cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=36 gui=reverse guibg=#0E7369 guifg=#CCCCCC
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=36 ctermfg=252 gui=bold,underline guibg=#0E7369 guifg=#CCCCCC
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=66 ctermfg=255 gui=NONE guibg=#235C5C guifg=#FFFFFF
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=66 gui=NONE guibg=#CCCCCC guifg=#235C5C
    CSAHi lCursor term=NONE cterm=NONE ctermbg=236 ctermfg=250 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=#700000
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#003050
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Structure term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Typedef term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Tag term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#707070
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#235C5C
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=66 gui=NONE guibg=#B9B9B9 guifg=#235C5C
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#9EC3B9 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#CCCCCC guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=250 ctermfg=252 gui=NONE guibg=#B9B9B9 guifg=#CCCCCC
    CSAHi DiffText term=reverse cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=#E0E0E0 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=250 ctermfg=236 gui=NONE guibg=#C0C0C0 guifg=#333333
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=250 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#FFFFFF guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#336C6C
    CSAHi Character term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#535F5C
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#636C4C
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#000070
    CSAHi Macro term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#003050
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#205070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#818181
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=254 gui=bold guibg=bg guifg=#E0E0E0
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#FF3F30 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=72 gui=reverse guibg=#3EA399 guifg=#FFFFFF
    CSAHi Search term=reverse cterm=NONE ctermbg=72 ctermfg=231 gui=NONE guibg=#3EA399 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi LineNr term=underline cterm=NONE ctermbg=250 ctermfg=244 gui=NONE guibg=#B9B9B9 guifg=#808080
    CSAHi Condtional term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#700000
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#003050
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=236 ctermfg=250 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=236 ctermfg=250 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=239 ctermfg=231 gui=NONE guibg=#515151 guifg=#FFFFFF
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi Repeat term=NONE cterm=underline ctermbg=bg ctermfg=52 gui=underline guibg=bg guifg=#700000
    CSAHi Label term=NONE cterm=underline ctermbg=bg ctermfg=52 gui=underline guibg=bg guifg=#700000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Exception term=NONE cterm=underline ctermbg=bg ctermfg=52 gui=underline guibg=bg guifg=#700000
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#003050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=252 ctermfg=23 gui=reverse,bold guibg=#0E7369 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=252 ctermfg=236 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=252 ctermfg=236 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi Title term=bold cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=23 gui=reverse guibg=#0E7369 guifg=#CCCCCC
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=23 ctermfg=252 gui=bold,underline guibg=#0E7369 guifg=#CCCCCC
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#235C5C guifg=#FFFFFF
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=23 gui=NONE guibg=#CCCCCC guifg=#235C5C
    CSAHi lCursor term=NONE cterm=NONE ctermbg=236 ctermfg=250 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=244 gui=NONE guibg=bg guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=#700000
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#003050
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Structure term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Typedef term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Tag term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#707070
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#235C5C
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=23 gui=NONE guibg=#B9B9B9 guifg=#235C5C
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=145 ctermfg=fg gui=NONE guibg=#9EC3B9 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#CCCCCC guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=250 ctermfg=252 gui=NONE guibg=#B9B9B9 guifg=#CCCCCC
    CSAHi DiffText term=reverse cterm=bold ctermbg=254 ctermfg=16 gui=bold guibg=#E0E0E0 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=85 ctermfg=80 gui=NONE guibg=#C0C0C0 guifg=#333333
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=#FFFFFF guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#336C6C
    CSAHi Character term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#535F5C
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#636C4C
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#000070
    CSAHi Macro term=NONE cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#003050
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#205070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#818181
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=87 gui=bold guibg=bg guifg=#E0E0E0
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#FF3F30 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=79 ctermfg=21 gui=reverse guibg=#3EA399 guifg=#FFFFFF
    CSAHi Search term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#3EA399 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi LineNr term=underline cterm=NONE ctermbg=85 ctermfg=83 gui=NONE guibg=#B9B9B9 guifg=#808080
    CSAHi Condtional term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#700000
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#003050
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=80 ctermfg=85 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=85 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=81 ctermfg=79 gui=NONE guibg=#515151 guifg=#FFFFFF
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi Repeat term=NONE cterm=underline ctermbg=bg ctermfg=32 gui=underline guibg=bg guifg=#700000
    CSAHi Label term=NONE cterm=underline ctermbg=bg ctermfg=32 gui=underline guibg=bg guifg=#700000
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Exception term=NONE cterm=underline ctermbg=bg ctermfg=32 gui=underline guibg=bg guifg=#700000
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#003050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=58 ctermfg=21 gui=reverse,bold guibg=#0E7369 guifg=#CCCCCC
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=80 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=58 ctermfg=80 gui=reverse guibg=#333333 guifg=#CCCCCC
    CSAHi Title term=bold cterm=bold ctermbg=58 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=58 ctermfg=21 gui=reverse guibg=#0E7369 guifg=#CCCCCC
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=21 ctermfg=58 gui=bold,underline guibg=#0E7369 guifg=#CCCCCC
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=58 ctermfg=16 gui=bold guibg=#CCCCCC guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#235C5C guifg=#FFFFFF
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=21 gui=NONE guibg=#CCCCCC guifg=#235C5C
    CSAHi lCursor term=NONE cterm=NONE ctermbg=80 ctermfg=85 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#808080
    CSAHi Constant term=underline cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#808080
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=#700000
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#003050
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi StorageClass term=NONE cterm=bold ctermbg=bg ctermfg=16 gui=bold guibg=bg guifg=#000000
    CSAHi Structure term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Typedef term=NONE cterm=bold,underline ctermbg=bg ctermfg=16 gui=bold,underline guibg=bg guifg=#000000
    CSAHi Tag term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#707070
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#235C5C
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=21 gui=NONE guibg=#B9B9B9 guifg=#235C5C
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=42 ctermfg=fg gui=NONE guibg=#9EC3B9 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#CCCCCC guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=85 ctermfg=58 gui=NONE guibg=#B9B9B9 guifg=#CCCCCC
    CSAHi DiffText term=reverse cterm=bold ctermbg=87 ctermfg=16 gui=bold guibg=#E0E0E0 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
