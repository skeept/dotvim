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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=white
    CSAHi Underlined term=underline cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=#000000 guifg=#eecfa1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Error term=reverse cterm=bold ctermbg=235 ctermfg=196 gui=bold guibg=#232323 guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=235 ctermfg=152 gui=NONE guibg=#232323 guifg=#9fb6cd
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Character term=NONE cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Float term=NONE cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Macro term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=152 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=250 gui=bold guibg=#000000 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#e6fff3
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=109 ctermfg=231 gui=bold guibg=#61a181 guifg=#e6fff3
    CSAHi IncSearch term=reverse cterm=bold ctermbg=109 ctermfg=59 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi Search term=reverse cterm=bold ctermbg=109 ctermfg=59 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=121 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=121 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=66 gui=NONE guibg=#000000 guifg=#2b506e
    CSAHi OL0 term=reverse cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#36648B
    CSAHi Define term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi OL3 term=reverse cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#5CACEE
    CSAHi OL4 term=reverse cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#63B8FF
    CSAHi OL5 term=reverse cterm=bold ctermbg=bg ctermfg=109 gui=bold guibg=bg guifg=#708090
    CSAHi OL6 term=reverse cterm=bold ctermbg=bg ctermfg=103 gui=bold guibg=bg guifg=#6C7B8B
    CSAHi OL7 term=reverse cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=#9FB6CD
    CSAHi OL8 term=reverse cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#B9D3EE
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=#4682b4 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#87ceeb guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=231 gui=NONE guibg=#848484 guifg=#ffffff
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=153 ctermfg=231 gui=NONE guibg=#87ceeb guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=66 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi OL1 term=reverse cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682B4
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Conditional term=NONE cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=152 gui=bold guibg=#000000 guifg=#9bcfb5
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=59 ctermfg=121 gui=NONE guibg=#333333 guifg=#4EEE94
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=235 ctermfg=121 gui=NONE guibg=#222222 guifg=#4EEE94
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=#1d3026 guifg=#e6fff3
    CSAHi Visual term=reverse cterm=NONE ctermbg=109 ctermfg=231 gui=NONE guibg=#61a181 guifg=#e6fff3
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=16 ctermfg=152 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=171 gui=bold guibg=#000000 guifg=#BF3EFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=231 ctermfg=66 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=37 gui=bold guibg=bg guifg=darkcyan
    CSAHi OL2 term=reverse cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4F94CD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=66 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=244 gui=NONE guibg=#000000 guifg=#848484
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=153 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=213 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi OL9 term=reverse cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#C6E2FF
    CSAHi StorageClass term=NONE cterm=bold ctermbg=16 ctermfg=213 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Structure term=NONE cterm=bold ctermbg=16 ctermfg=213 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Typedef term=NONE cterm=bold ctermbg=16 ctermfg=213 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Tag term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=37 gui=bold guibg=bg guifg=darkcyan
    CSAHi DiffAdd term=bold cterm=bold ctermbg=66 ctermfg=231 gui=bold guibg=#43705a guifg=#e6fff3
    CSAHi DiffChange term=bold cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=66 ctermfg=231 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffText term=reverse cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#e6fff3 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=black guifg=white
    CSAHi Underlined term=underline cterm=NONE ctermbg=16 ctermfg=230 gui=NONE guibg=#000000 guifg=#eecfa1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Error term=reverse cterm=bold ctermbg=235 ctermfg=196 gui=bold guibg=#232323 guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=235 ctermfg=189 gui=NONE guibg=#232323 guifg=#9fb6cd
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=159 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Character term=NONE cterm=NONE ctermbg=16 ctermfg=159 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=159 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=159 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Float term=NONE cterm=NONE ctermbg=16 ctermfg=159 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Macro term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=194 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=250 gui=bold guibg=#000000 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#e6fff3
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=115 ctermfg=231 gui=bold guibg=#61a181 guifg=#e6fff3
    CSAHi IncSearch term=reverse cterm=bold ctermbg=115 ctermfg=59 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi Search term=reverse cterm=bold ctermbg=115 ctermfg=59 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=121 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=121 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=67 gui=NONE guibg=#000000 guifg=#2b506e
    CSAHi OL0 term=reverse cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#36648B
    CSAHi Define term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi OL3 term=reverse cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#5CACEE
    CSAHi OL4 term=reverse cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#63B8FF
    CSAHi OL5 term=reverse cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#708090
    CSAHi OL6 term=reverse cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#6C7B8B
    CSAHi OL7 term=reverse cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#9FB6CD
    CSAHi OL8 term=reverse cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=#B9D3EE
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=110 ctermfg=16 gui=NONE guibg=#4682b4 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=159 ctermfg=16 gui=NONE guibg=#87ceeb guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=244 ctermfg=255 gui=NONE guibg=#848484 guifg=#ffffff
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=159 ctermfg=255 gui=NONE guibg=#87ceeb guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=108 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi OL1 term=reverse cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682B4
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Conditional term=NONE cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=194 gui=bold guibg=#000000 guifg=#9bcfb5
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=236 ctermfg=121 gui=NONE guibg=#333333 guifg=#4EEE94
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=235 ctermfg=121 gui=NONE guibg=#222222 guifg=#4EEE94
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=black guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=#1d3026 guifg=#e6fff3
    CSAHi Visual term=reverse cterm=NONE ctermbg=115 ctermfg=231 gui=NONE guibg=#61a181 guifg=#e6fff3
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=16 ctermfg=194 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=171 gui=bold guibg=#000000 guifg=#BF3EFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=231 ctermfg=108 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=37 gui=bold guibg=bg guifg=darkcyan
    CSAHi OL2 term=reverse cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#4F94CD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=108 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=244 gui=NONE guibg=#000000 guifg=#848484
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=159 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=117 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=110 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=171 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=219 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi OL9 term=reverse cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#C6E2FF
    CSAHi StorageClass term=NONE cterm=bold ctermbg=16 ctermfg=219 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Structure term=NONE cterm=bold ctermbg=16 ctermfg=219 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Typedef term=NONE cterm=bold ctermbg=16 ctermfg=219 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Tag term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=37 gui=bold guibg=bg guifg=darkcyan
    CSAHi DiffAdd term=bold cterm=bold ctermbg=108 ctermfg=231 gui=bold guibg=#43705a guifg=#e6fff3
    CSAHi DiffChange term=bold cterm=NONE ctermbg=108 ctermfg=231 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=108 ctermfg=231 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffText term=reverse cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#e6fff3 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=white
    CSAHi Underlined term=underline cterm=NONE ctermbg=16 ctermfg=223 gui=NONE guibg=#000000 guifg=#eecfa1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Error term=reverse cterm=bold ctermbg=235 ctermfg=196 gui=bold guibg=#232323 guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=235 ctermfg=146 gui=NONE guibg=#232323 guifg=#9fb6cd
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=116 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Character term=NONE cterm=NONE ctermbg=16 ctermfg=116 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=116 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=116 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Float term=NONE cterm=NONE ctermbg=16 ctermfg=116 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=75 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Macro term=NONE cterm=NONE ctermbg=16 ctermfg=135 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=16 ctermfg=135 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=115 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=250 gui=bold guibg=#000000 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=195 gui=NONE guibg=#000000 guifg=#e6fff3
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=72 ctermfg=195 gui=bold guibg=#61a181 guifg=#e6fff3
    CSAHi IncSearch term=reverse cterm=bold ctermbg=72 ctermfg=22 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi Search term=reverse cterm=bold ctermbg=72 ctermfg=22 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=84 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=84 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=23 gui=NONE guibg=#000000 guifg=#2b506e
    CSAHi OL0 term=reverse cterm=bold ctermbg=bg ctermfg=60 gui=bold guibg=bg guifg=#36648B
    CSAHi Define term=NONE cterm=NONE ctermbg=16 ctermfg=135 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi OL3 term=reverse cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=#5CACEE
    CSAHi OL4 term=reverse cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=#63B8FF
    CSAHi OL5 term=reverse cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#708090
    CSAHi OL6 term=reverse cterm=bold ctermbg=bg ctermfg=66 gui=bold guibg=bg guifg=#6C7B8B
    CSAHi OL7 term=reverse cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#9FB6CD
    CSAHi OL8 term=reverse cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#B9D3EE
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=67 ctermfg=16 gui=NONE guibg=#4682b4 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=116 ctermfg=16 gui=NONE guibg=#87ceeb guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=231 gui=NONE guibg=#848484 guifg=#ffffff
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=116 ctermfg=231 gui=NONE guibg=#87ceeb guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=195 ctermfg=59 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi OL1 term=reverse cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682B4
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Conditional term=NONE cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=135 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=115 gui=bold guibg=#000000 guifg=#9bcfb5
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=236 ctermfg=84 gui=NONE guibg=#333333 guifg=#4EEE94
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=235 ctermfg=84 gui=NONE guibg=#222222 guifg=#4EEE94
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=22 ctermfg=195 gui=bold guibg=#1d3026 guifg=#e6fff3
    CSAHi Visual term=reverse cterm=NONE ctermbg=72 ctermfg=195 gui=NONE guibg=#61a181 guifg=#e6fff3
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=16 ctermfg=115 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=135 gui=bold guibg=#000000 guifg=#BF3EFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=195 ctermfg=59 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=30 gui=bold guibg=bg guifg=darkcyan
    CSAHi OL2 term=reverse cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#4F94CD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=195 ctermfg=59 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=#000000 guifg=#848484
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=116 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=75 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=67 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=135 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=212 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi OL9 term=reverse cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#C6E2FF
    CSAHi StorageClass term=NONE cterm=bold ctermbg=16 ctermfg=212 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Structure term=NONE cterm=bold ctermbg=16 ctermfg=212 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Typedef term=NONE cterm=bold ctermbg=16 ctermfg=212 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Tag term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=30 gui=bold guibg=bg guifg=darkcyan
    CSAHi DiffAdd term=bold cterm=bold ctermbg=59 ctermfg=195 gui=bold guibg=#43705a guifg=#e6fff3
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=195 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=59 ctermfg=195 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffText term=reverse cterm=bold ctermbg=195 ctermfg=16 gui=bold guibg=#e6fff3 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=black guifg=white
    CSAHi Underlined term=underline cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=#000000 guifg=#eecfa1
    CSAHi Ignore term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Error term=reverse cterm=bold ctermbg=80 ctermfg=64 gui=bold guibg=#232323 guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=#232323 guifg=#9fb6cd
    CSAHi String term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Character term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Number term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Boolean term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Float term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Macro term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=42 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=85 gui=bold guibg=#000000 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=63 gui=NONE guibg=#000000 guifg=#e6fff3
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=37 ctermfg=63 gui=bold guibg=#61a181 guifg=#e6fff3
    CSAHi IncSearch term=reverse cterm=bold ctermbg=37 ctermfg=80 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi Search term=reverse cterm=bold ctermbg=37 ctermfg=80 gui=bold guibg=#61a181 guifg=#1d3026
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=45 gui=bold guibg=#000000 guifg=#4EEE94
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=#000000 guifg=#2b506e
    CSAHi OL0 term=reverse cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#36648B
    CSAHi Define term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi OL3 term=reverse cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#5CACEE
    CSAHi OL4 term=reverse cterm=bold ctermbg=bg ctermfg=43 gui=bold guibg=bg guifg=#63B8FF
    CSAHi OL5 term=reverse cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=#708090
    CSAHi OL6 term=reverse cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=#6C7B8B
    CSAHi OL7 term=reverse cterm=bold ctermbg=bg ctermfg=42 gui=bold guibg=bg guifg=#9FB6CD
    CSAHi OL8 term=reverse cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#B9D3EE
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#4682b4 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=43 ctermfg=16 gui=NONE guibg=#87ceeb guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=83 ctermfg=79 gui=NONE guibg=#848484 guifg=#ffffff
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=43 ctermfg=79 gui=NONE guibg=#87ceeb guifg=#ffffff
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=63 ctermfg=21 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi OL1 term=reverse cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682B4
    CSAHi Debug term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Conditional term=NONE cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=42 gui=bold guibg=#000000 guifg=#9bcfb5
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=80 ctermfg=45 gui=NONE guibg=#333333 guifg=#4EEE94
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=45 gui=NONE guibg=#222222 guifg=#4EEE94
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=black guifg=white
    CSAHi Title term=bold cterm=bold ctermbg=80 ctermfg=63 gui=bold guibg=#1d3026 guifg=#e6fff3
    CSAHi Visual term=reverse cterm=NONE ctermbg=37 ctermfg=63 gui=NONE guibg=#61a181 guifg=#e6fff3
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=16 ctermfg=42 gui=NONE guibg=#000000 guifg=#9bcfb5
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=16 ctermfg=51 gui=bold guibg=#000000 guifg=#BF3EFF
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=63 ctermfg=21 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi Folded term=NONE cterm=bold ctermbg=16 ctermfg=21 gui=bold guibg=bg guifg=darkcyan
    CSAHi OL2 term=reverse cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4F94CD
    CSAHi lCursor term=NONE cterm=NONE ctermbg=63 ctermfg=21 gui=NONE guibg=#e6fff3 guifg=#43705a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#848484
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#87ceeb
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=43 gui=NONE guibg=#000000 guifg=#63b8ff
    CSAHi Statement term=bold cterm=bold ctermbg=16 ctermfg=38 gui=bold guibg=#000000 guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#000000 guifg=#bf3eff
    CSAHi Type term=underline cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi OL9 term=reverse cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#C6E2FF
    CSAHi StorageClass term=NONE cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Structure term=NONE cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Typedef term=NONE cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=#000000 guifg=#ee7ae9
    CSAHi Tag term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialChar term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi SpecialComment term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#000000 guifg=#00eeee
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=21 gui=bold guibg=bg guifg=darkcyan
    CSAHi DiffAdd term=bold cterm=bold ctermbg=21 ctermfg=63 gui=bold guibg=#43705a guifg=#e6fff3
    CSAHi DiffChange term=bold cterm=NONE ctermbg=21 ctermfg=63 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=21 ctermfg=63 gui=NONE guibg=#43705a guifg=#e6fff3
    CSAHi DiffText term=reverse cterm=bold ctermbg=63 ctermfg=16 gui=bold guibg=#e6fff3 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
