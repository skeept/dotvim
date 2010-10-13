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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=NONE guibg=White guifg=#141312
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=31 gui=underline guibg=white guifg=#0057ae
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=231 gui=NONE guibg=white guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=224 gui=NONE guibg=#D80000 guifg=#FFD1CC
    CSAHi Todo term=NONE cterm=NONE ctermbg=136 ctermfg=250 gui=NONE guibg=#AD5500 guifg=Grey
    CSAHi String term=NONE cterm=NONE ctermbg=231 ctermfg=160 gui=italic guibg=white guifg=#BF0303
    CSAHi Character term=NONE cterm=NONE ctermbg=231 ctermfg=97 gui=NONE guibg=white guifg=#644A9B
    CSAHi Number term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Float term=NONE cterm=NONE ctermbg=194 ctermfg=21 gui=NONE guibg=#CCFFCC guifg=blue
    CSAHi Function term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Macro term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi PreCondit term=NONE cterm=bold ctermbg=231 ctermfg=31 gui=bold guibg=white guifg=#0057ae
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi NonText term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Directory term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold,italic guibg=white guifg=Black
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi LineNr term=underline cterm=bold ctermbg=230 ctermfg=248 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi AutoHiGroup term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=black
    CSAHi Define term=NONE cterm=bold ctermbg=231 ctermfg=29 gui=bold guibg=white guifg=#006E26
    CSAHi Done term=NONE cterm=NONE ctermbg=250 ctermfg=195 gui=NONE guibg=Gray guifg=#CCEEFF
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=231 ctermfg=124 gui=NONE guibg=white guifg=#9C0D0D
    CSAHi Chatacter term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=253 ctermfg=16 gui=italic guibg=#DDDDDD guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=italic guibg=#F1FFC1 guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=253 ctermfg=233 gui=italic guibg=#DDDDDD guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=253 ctermfg=233 gui=NONE guibg=#DDDDDD guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=233 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#fafafa guifg=black
    CSAHi CursorLine term=underline cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi Cursor term=NONE cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#0057ae guifg=white
    CSAHi Tooltip term=NONE cterm=bold ctermbg=230 ctermfg=248 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi Conditional term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Repeat term=NONE cterm=bold ctermbg=231 ctermfg=136 gui=bold guibg=white guifg=#B07E00
    CSAHi Operator term=NONE cterm=NONE ctermbg=231 ctermfg=31 gui=NONE guibg=white guifg=#0057AE
    CSAHi Keyword term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=NONE guibg=white guifg=#141312
    CSAHi Exception term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Include term=NONE cterm=bold ctermbg=231 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Question term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=59 ctermfg=253 gui=italic guibg=#1D343B guifg=#DDDDDD
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=250 ctermfg=231 gui=bold,italic guibg=#bbbbbb guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=230 ctermfg=230 gui=NONE guibg=#F1FFC1 guifg=#F1FFC1
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=75 ctermfg=231 gui=bold guibg=#4485FF guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=75 ctermfg=231 gui=bold guibg=#4485FF guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=230 ctermfg=233 gui=italic guibg=#F1FFC1 guifg=#101010
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=231 ctermfg=172 gui=NONE guibg=white guifg=#B86A18
    CSAHi lCursor term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=underline ctermbg=226 ctermfg=233 gui=underline guibg=Yellow guifg=#141312
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=245 gui=italic guibg=white guifg=#888786
    CSAHi Constant term=underline cterm=bold ctermbg=231 ctermfg=29 gui=bold guibg=white guifg=#006e26
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=31 gui=NONE guibg=white guifg=#0057AE
    CSAHi Statement term=bold cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi PreProc term=underline cterm=bold ctermbg=231 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Type term=underline cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=231 ctermfg=29 gui=NONE guibg=white guifg=#006e26
    CSAHi Structure term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Typedef term=NONE cterm=bold ctermbg=194 ctermfg=29 gui=bold guibg=#CCFFCC guifg=#006e26
    CSAHi Tag term=NONE cterm=NONE ctermbg=194 ctermfg=31 gui=NONE guibg=#CCFFCC guifg=#0057AE
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=231 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#CCFFCC guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=230 ctermfg=fg gui=NONE guibg=#F1FFC1 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=224 ctermfg=fg gui=NONE guibg=#FFCCCC guifg=fg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=white guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=230 ctermfg=16 gui=bold guibg=#F1FFC1 guifg=black
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=233 gui=NONE guibg=White guifg=#141312
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=32 gui=underline guibg=white guifg=#0057ae
    CSAHi Ignore term=NONE cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=white guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#D80000 guifg=#FFD1CC
    CSAHi Todo term=NONE cterm=NONE ctermbg=172 ctermfg=250 gui=NONE guibg=#AD5500 guifg=Grey
    CSAHi String term=NONE cterm=NONE ctermbg=255 ctermfg=160 gui=italic guibg=white guifg=#BF0303
    CSAHi Character term=NONE cterm=NONE ctermbg=255 ctermfg=104 gui=NONE guibg=white guifg=#644A9B
    CSAHi Number term=NONE cterm=NONE ctermbg=255 ctermfg=178 gui=NONE guibg=white guifg=#B07E00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=255 ctermfg=178 gui=NONE guibg=white guifg=#B07E00
    CSAHi Float term=NONE cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=#CCFFCC guifg=blue
    CSAHi Function term=NONE cterm=NONE ctermbg=255 ctermfg=178 gui=NONE guibg=white guifg=#B07E00
    CSAHi Macro term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi PreCondit term=NONE cterm=bold ctermbg=255 ctermfg=32 gui=bold guibg=white guifg=#0057ae
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Directory term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=white guifg=Black
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi LineNr term=underline cterm=bold ctermbg=231 ctermfg=248 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi AutoHiGroup term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=black
    CSAHi Define term=NONE cterm=bold ctermbg=255 ctermfg=35 gui=bold guibg=white guifg=#006E26
    CSAHi Done term=NONE cterm=NONE ctermbg=250 ctermfg=231 gui=NONE guibg=Gray guifg=#CCEEFF
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=255 ctermfg=160 gui=NONE guibg=white guifg=#9C0D0D
    CSAHi Chatacter term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=253 ctermfg=16 gui=italic guibg=#DDDDDD guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=italic guibg=#F1FFC1 guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=253 ctermfg=233 gui=italic guibg=#DDDDDD guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=253 ctermfg=233 gui=NONE guibg=#DDDDDD guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=233 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#fafafa guifg=black
    CSAHi CursorLine term=underline cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi Cursor term=NONE cterm=NONE ctermbg=32 ctermfg=255 gui=NONE guibg=#0057ae guifg=white
    CSAHi Tooltip term=NONE cterm=bold ctermbg=231 ctermfg=248 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi Conditional term=NONE cterm=NONE ctermbg=255 ctermfg=178 gui=NONE guibg=white guifg=#B07E00
    CSAHi Repeat term=NONE cterm=bold ctermbg=255 ctermfg=178 gui=bold guibg=white guifg=#B07E00
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=32 gui=NONE guibg=white guifg=#0057AE
    CSAHi Keyword term=NONE cterm=NONE ctermbg=255 ctermfg=233 gui=NONE guibg=white guifg=#141312
    CSAHi Exception term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Include term=NONE cterm=bold ctermbg=255 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Question term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=59 ctermfg=253 gui=italic guibg=#1D343B guifg=#DDDDDD
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=250 ctermfg=255 gui=bold,italic guibg=#bbbbbb guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=231 gui=NONE guibg=#F1FFC1 guifg=#F1FFC1
    CSAHi Title term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=111 ctermfg=255 gui=bold guibg=#4485FF guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=111 ctermfg=255 gui=bold guibg=#4485FF guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=italic guibg=#F1FFC1 guifg=#101010
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=255 ctermfg=173 gui=NONE guibg=white guifg=#B86A18
    CSAHi lCursor term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=underline ctermbg=226 ctermfg=233 gui=underline guibg=Yellow guifg=#141312
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=245 gui=italic guibg=white guifg=#888786
    CSAHi Constant term=underline cterm=bold ctermbg=255 ctermfg=35 gui=bold guibg=white guifg=#006e26
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=32 gui=NONE guibg=white guifg=#0057AE
    CSAHi Statement term=bold cterm=NONE ctermbg=255 ctermfg=178 gui=NONE guibg=white guifg=#B07E00
    CSAHi PreProc term=underline cterm=bold ctermbg=255 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Type term=underline cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=255 ctermfg=35 gui=NONE guibg=white guifg=#006e26
    CSAHi Structure term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Typedef term=NONE cterm=bold ctermbg=231 ctermfg=35 gui=bold guibg=#CCFFCC guifg=#006e26
    CSAHi Tag term=NONE cterm=NONE ctermbg=231 ctermfg=32 gui=NONE guibg=#CCFFCC guifg=#0057AE
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=255 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#CCFFCC guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#F1FFC1 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#FFCCCC guifg=fg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=white guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#F1FFC1 guifg=black
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=255 ctermfg=160 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=255 ctermfg=160 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=255 ctermfg=160 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=255 ctermfg=160 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=NONE guibg=White guifg=#141312
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=25 gui=underline guibg=white guifg=#0057ae
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=231 gui=NONE guibg=white guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=224 gui=NONE guibg=#D80000 guifg=#FFD1CC
    CSAHi Todo term=NONE cterm=NONE ctermbg=130 ctermfg=250 gui=NONE guibg=#AD5500 guifg=Grey
    CSAHi String term=NONE cterm=NONE ctermbg=231 ctermfg=124 gui=italic guibg=white guifg=#BF0303
    CSAHi Character term=NONE cterm=NONE ctermbg=231 ctermfg=60 gui=NONE guibg=white guifg=#644A9B
    CSAHi Number term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Float term=NONE cterm=NONE ctermbg=194 ctermfg=21 gui=NONE guibg=#CCFFCC guifg=blue
    CSAHi Function term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Macro term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi PreCondit term=NONE cterm=bold ctermbg=231 ctermfg=25 gui=bold guibg=white guifg=#0057ae
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi NonText term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Directory term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold,italic guibg=white guifg=Black
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi LineNr term=underline cterm=bold ctermbg=229 ctermfg=248 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi AutoHiGroup term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=black
    CSAHi Define term=NONE cterm=bold ctermbg=231 ctermfg=22 gui=bold guibg=white guifg=#006E26
    CSAHi Done term=NONE cterm=NONE ctermbg=250 ctermfg=195 gui=NONE guibg=Gray guifg=#CCEEFF
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=231 ctermfg=124 gui=NONE guibg=white guifg=#9C0D0D
    CSAHi Chatacter term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=253 ctermfg=16 gui=italic guibg=#DDDDDD guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=italic guibg=#F1FFC1 guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=253 ctermfg=233 gui=italic guibg=#DDDDDD guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=253 ctermfg=233 gui=NONE guibg=#DDDDDD guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=233 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#fafafa guifg=black
    CSAHi CursorLine term=underline cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi Cursor term=NONE cterm=NONE ctermbg=25 ctermfg=231 gui=NONE guibg=#0057ae guifg=white
    CSAHi Tooltip term=NONE cterm=bold ctermbg=229 ctermfg=248 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi Conditional term=NONE cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi Repeat term=NONE cterm=bold ctermbg=231 ctermfg=136 gui=bold guibg=white guifg=#B07E00
    CSAHi Operator term=NONE cterm=NONE ctermbg=231 ctermfg=25 gui=NONE guibg=white guifg=#0057AE
    CSAHi Keyword term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=NONE guibg=white guifg=#141312
    CSAHi Exception term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Include term=NONE cterm=bold ctermbg=231 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Question term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=23 ctermfg=253 gui=italic guibg=#1D343B guifg=#DDDDDD
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=250 ctermfg=231 gui=bold,italic guibg=#bbbbbb guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=229 ctermfg=229 gui=NONE guibg=#F1FFC1 guifg=#F1FFC1
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=69 ctermfg=231 gui=bold guibg=#4485FF guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=69 ctermfg=231 gui=bold guibg=#4485FF guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=229 ctermfg=233 gui=italic guibg=#F1FFC1 guifg=#101010
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=231 ctermfg=130 gui=NONE guibg=white guifg=#B86A18
    CSAHi lCursor term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=underline ctermbg=226 ctermfg=233 gui=underline guibg=Yellow guifg=#141312
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=102 gui=italic guibg=white guifg=#888786
    CSAHi Constant term=underline cterm=bold ctermbg=231 ctermfg=22 gui=bold guibg=white guifg=#006e26
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=25 gui=NONE guibg=white guifg=#0057AE
    CSAHi Statement term=bold cterm=NONE ctermbg=231 ctermfg=136 gui=NONE guibg=white guifg=#B07E00
    CSAHi PreProc term=underline cterm=bold ctermbg=231 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Type term=underline cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=231 ctermfg=22 gui=NONE guibg=white guifg=#006e26
    CSAHi Structure term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Typedef term=NONE cterm=bold ctermbg=194 ctermfg=22 gui=bold guibg=#CCFFCC guifg=#006e26
    CSAHi Tag term=NONE cterm=NONE ctermbg=194 ctermfg=25 gui=NONE guibg=#CCFFCC guifg=#0057AE
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=231 ctermfg=233 gui=bold guibg=white guifg=#141312
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#CCFFCC guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=229 ctermfg=fg gui=NONE guibg=#F1FFC1 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=224 ctermfg=fg gui=NONE guibg=#FFCCCC guifg=fg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=white guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=229 ctermfg=16 gui=bold guibg=#F1FFC1 guifg=black
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=231 ctermfg=124 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=White guifg=#141312
    CSAHi Underlined term=underline cterm=underline ctermbg=79 ctermfg=22 gui=underline guibg=white guifg=#0057ae
    CSAHi Ignore term=NONE cterm=NONE ctermbg=79 ctermfg=79 gui=NONE guibg=white guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=74 gui=NONE guibg=#D80000 guifg=#FFD1CC
    CSAHi Todo term=NONE cterm=NONE ctermbg=52 ctermfg=85 gui=NONE guibg=#AD5500 guifg=Grey
    CSAHi String term=NONE cterm=NONE ctermbg=79 ctermfg=48 gui=italic guibg=white guifg=#BF0303
    CSAHi Character term=NONE cterm=NONE ctermbg=79 ctermfg=37 gui=NONE guibg=white guifg=#644A9B
    CSAHi Number term=NONE cterm=NONE ctermbg=79 ctermfg=52 gui=NONE guibg=white guifg=#B07E00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=79 ctermfg=52 gui=NONE guibg=white guifg=#B07E00
    CSAHi Float term=NONE cterm=NONE ctermbg=62 ctermfg=19 gui=NONE guibg=#CCFFCC guifg=blue
    CSAHi Function term=NONE cterm=NONE ctermbg=79 ctermfg=52 gui=NONE guibg=white guifg=#B07E00
    CSAHi Macro term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi PreCondit term=NONE cterm=bold ctermbg=79 ctermfg=22 gui=bold guibg=white guifg=#0057ae
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi NonText term=bold cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Directory term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold,italic guibg=white guifg=Black
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=Black guifg=White
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi LineNr term=underline cterm=bold ctermbg=78 ctermfg=84 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi AutoHiGroup term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=black
    CSAHi Define term=NONE cterm=bold ctermbg=79 ctermfg=20 gui=bold guibg=white guifg=#006E26
    CSAHi Done term=NONE cterm=NONE ctermbg=85 ctermfg=63 gui=NONE guibg=Gray guifg=#CCEEFF
    CSAHi SpellErrors term=NONE cterm=NONE ctermbg=79 ctermfg=32 gui=NONE guibg=white guifg=#9C0D0D
    CSAHi Chatacter term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=italic guibg=#DDDDDD guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=78 ctermfg=16 gui=italic guibg=#F1FFC1 guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=italic guibg=#DDDDDD guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#DDDDDD guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#fafafa guifg=black
    CSAHi CursorLine term=underline cterm=NONE ctermbg=78 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi Cursor term=NONE cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#0057ae guifg=white
    CSAHi Tooltip term=NONE cterm=bold ctermbg=78 ctermfg=84 gui=bold,italic guibg=#F1FFC1 guifg=DarkGray
    CSAHi Conditional term=NONE cterm=NONE ctermbg=79 ctermfg=52 gui=NONE guibg=white guifg=#B07E00
    CSAHi Repeat term=NONE cterm=bold ctermbg=79 ctermfg=52 gui=bold guibg=white guifg=#B07E00
    CSAHi Operator term=NONE cterm=NONE ctermbg=79 ctermfg=22 gui=NONE guibg=white guifg=#0057AE
    CSAHi Keyword term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=#141312
    CSAHi Exception term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Include term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=#141312
    CSAHi Question term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=80 ctermfg=87 gui=italic guibg=#1D343B guifg=#DDDDDD
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=85 ctermfg=79 gui=bold,italic guibg=#bbbbbb guifg=White
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=78 ctermfg=78 gui=NONE guibg=#F1FFC1 guifg=#F1FFC1
    CSAHi Title term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=Black
    CSAHi Visual term=reverse cterm=bold ctermbg=23 ctermfg=79 gui=bold guibg=#4485FF guifg=white
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=23 ctermfg=79 gui=bold guibg=#4485FF guifg=white
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=White guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=78 ctermfg=16 gui=italic guibg=#F1FFC1 guifg=#101010
    CSAHi PerlPOD term=NONE cterm=NONE ctermbg=79 ctermfg=52 gui=NONE guibg=white guifg=#B86A18
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=underline ctermbg=76 ctermfg=16 gui=underline guibg=Yellow guifg=#141312
    CSAHi Comment term=bold cterm=NONE ctermbg=79 ctermfg=83 gui=italic guibg=white guifg=#888786
    CSAHi Constant term=underline cterm=bold ctermbg=79 ctermfg=20 gui=bold guibg=white guifg=#006e26
    CSAHi Special term=bold cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Identifier term=underline cterm=NONE ctermbg=79 ctermfg=22 gui=NONE guibg=white guifg=#0057AE
    CSAHi Statement term=bold cterm=NONE ctermbg=79 ctermfg=52 gui=NONE guibg=white guifg=#B07E00
    CSAHi PreProc term=underline cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=#141312
    CSAHi Type term=underline cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=79 ctermfg=20 gui=NONE guibg=white guifg=#006e26
    CSAHi Structure term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi Typedef term=NONE cterm=bold ctermbg=62 ctermfg=20 gui=bold guibg=#CCFFCC guifg=#006e26
    CSAHi Tag term=NONE cterm=NONE ctermbg=62 ctermfg=22 gui=NONE guibg=#CCFFCC guifg=#0057AE
    CSAHi SpecialChar term=NONE cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=#141312
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=78 ctermfg=16 gui=NONE guibg=#F1FFC1 guifg=Black
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=#CCFFCC guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=78 ctermfg=fg gui=NONE guibg=#F1FFC1 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=74 ctermfg=fg gui=NONE guibg=#FFCCCC guifg=fg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=white guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=78 ctermfg=16 gui=bold guibg=#F1FFC1 guifg=black
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=79 ctermfg=32 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=79 ctermfg=32 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=79 ctermfg=32 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=79 ctermfg=32 gui=undercurl guibg=white guifg=fg guisp=#9C0D0D
endif

if 1
    delcommand CSAHi
endif
