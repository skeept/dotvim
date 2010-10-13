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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=234 gui=NONE guibg=#f0f0f0 guifg=#202020
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=234 gui=underline guibg=bg guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,underline ctermbg=231 ctermfg=196 gui=bold,underline guibg=white guifg=red
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=146 gui=bold,italic,underline guibg=bg guifg=#a0b0c0
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#4070a0
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#40a070
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=#70a040
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=24 gui=italic guibg=bg guifg=#06287e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=181 gui=italic guibg=#e8e8e8 guifg=#d8a080
    CSAHi NonText term=bold cterm=bold ctermbg=254 ctermfg=250 gui=bold guibg=#e0e0e0 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=234 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=188 ctermfg=231 gui=NONE guibg=#c0d0e0 guifg=#ffffff
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=31 gui=bold guibg=bg guifg=#1060a0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=231 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=234 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=152 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=255 gui=reverse guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eaeaea guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=152 ctermfg=16 gui=NONE guibg=#b0b4b8 guifg=black
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#4c8f2f
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=114 gui=bold guibg=bg guifg=#7fbf58
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=70 gui=NONE guibg=bg guifg=#408010
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=145 ctermfg=231 gui=bold,italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=146 ctermfg=102 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=146 ctermfg=146 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=234 gui=bold guibg=bg guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=188 ctermfg=109 gui=NONE guibg=#c0d0e0 guifg=#708090
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi MatchParen term=reverse cterm=bold ctermbg=145 ctermfg=231 gui=bold guibg=#80a090 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=italic guibg=bg guifg=#a0b0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=137 gui=NONE guibg=bg guifg=#a07040
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=italic guibg=bg guifg=#70a0d0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=96 gui=italic guibg=bg guifg=#5b3674
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#007020
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#1060a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=178 gui=italic guibg=bg guifg=#e5a00d
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=italic guibg=bg guifg=#007020
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=bold ctermbg=188 ctermfg=fg gui=bold,italic guibg=#c0e0d0 guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=254 ctermfg=fg gui=bold,italic guibg=#e0e0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=223 ctermfg=fg gui=bold,italic guibg=#f0e0b0 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=224 ctermfg=fg gui=bold,italic guibg=#f0c8c8 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=234 gui=NONE guibg=#f0f0f0 guifg=#202020
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=234 gui=underline guibg=bg guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,underline ctermbg=255 ctermfg=196 gui=bold,underline guibg=white guifg=red
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=189 gui=bold,italic,underline guibg=bg guifg=#a0b0c0
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#4070a0
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#40a070
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#70a040
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=italic guibg=bg guifg=#06287e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=223 gui=italic guibg=#e8e8e8 guifg=#d8a080
    CSAHi NonText term=bold cterm=bold ctermbg=254 ctermfg=250 gui=bold guibg=#e0e0e0 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=234 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=255 gui=NONE guibg=#c0d0e0 guifg=#ffffff
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=#1060a0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=255 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=234 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=189 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=152 ctermfg=255 gui=reverse guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eaeaea guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#b0b4b8 guifg=black
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=107 gui=bold guibg=bg guifg=#4c8f2f
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=150 gui=bold guibg=bg guifg=#7fbf58
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=106 gui=NONE guibg=bg guifg=#408010
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=146 ctermfg=255 gui=bold,italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=189 ctermfg=103 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=189 ctermfg=189 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=234 gui=bold guibg=bg guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=#c0d0e0 guifg=#708090
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi MatchParen term=reverse cterm=bold ctermbg=151 ctermfg=255 gui=bold guibg=#80a090 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=italic guibg=bg guifg=#a0b0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#a07040
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=italic guibg=bg guifg=#70a0d0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=97 gui=italic guibg=bg guifg=#5b3674
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=35 gui=bold guibg=bg guifg=#007020
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#1060a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=220 gui=italic guibg=bg guifg=#e5a00d
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=35 gui=italic guibg=bg guifg=#007020
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=bold ctermbg=231 ctermfg=fg gui=bold,italic guibg=#c0e0d0 guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=254 ctermfg=fg gui=bold,italic guibg=#e0e0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=230 ctermfg=fg gui=bold,italic guibg=#f0e0b0 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=231 ctermfg=fg gui=bold,italic guibg=#f0c8c8 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=234 gui=NONE guibg=#f0f0f0 guifg=#202020
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=234 gui=underline guibg=bg guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,underline ctermbg=231 ctermfg=196 gui=bold,underline guibg=white guifg=red
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=145 gui=bold,italic,underline guibg=bg guifg=#a0b0c0
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#4070a0
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#40a070
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#70a040
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=italic guibg=bg guifg=#06287e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=254 ctermfg=180 gui=italic guibg=#e8e8e8 guifg=#d8a080
    CSAHi NonText term=bold cterm=bold ctermbg=254 ctermfg=250 gui=bold guibg=#e0e0e0 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=234 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=152 ctermfg=231 gui=NONE guibg=#c0d0e0 guifg=#ffffff
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=25 gui=bold guibg=bg guifg=#1060a0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=244 ctermfg=231 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=234 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=145 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=103 ctermfg=255 gui=reverse guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eaeaea guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#b0b4b8 guifg=black
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=#4c8f2f
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=107 gui=bold guibg=bg guifg=#7fbf58
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#408010
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=103 ctermfg=231 gui=bold,italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=59 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=145 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=234 gui=bold guibg=bg guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=152 ctermfg=66 gui=NONE guibg=#c0d0e0 guifg=#708090
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi MatchParen term=reverse cterm=bold ctermbg=108 ctermfg=231 gui=bold guibg=#80a090 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=italic guibg=bg guifg=#a0b0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=#a07040
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=italic guibg=bg guifg=#70a0d0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=60 gui=italic guibg=bg guifg=#5b3674
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#007020
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#1060a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=178 gui=italic guibg=bg guifg=#e5a00d
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=22 gui=italic guibg=bg guifg=#007020
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=bold ctermbg=152 ctermfg=fg gui=bold,italic guibg=#c0e0d0 guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=254 ctermfg=fg gui=bold,italic guibg=#e0e0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=223 ctermfg=fg gui=bold,italic guibg=#f0e0b0 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=224 ctermfg=fg gui=bold,italic guibg=#f0c8c8 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#f0f0f0 guifg=#202020
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=80 gui=underline guibg=bg guifg=#202020
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold,underline ctermbg=79 ctermfg=64 gui=bold,underline guibg=white guifg=red
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=42 gui=bold,italic,underline guibg=bg guifg=#a0b0c0
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#4070a0
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#40a070
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#70a040
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=italic guibg=bg guifg=#06287e
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=87 ctermfg=53 gui=italic guibg=#e8e8e8 guifg=#d8a080
    CSAHi NonText term=bold cterm=bold ctermbg=87 ctermfg=85 gui=bold guibg=#e0e0e0 guifg=#c0c0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=80 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=Yellow guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=58 ctermfg=79 gui=NONE guibg=#c0d0e0 guifg=#ffffff
    CSAHi Define term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#1060a0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=83 ctermfg=79 gui=NONE guibg=#808080 guifg=white
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=85 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=black
    CSAHi TabLineSel term=bold cterm=bold ctermbg=87 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=black
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=37 ctermfg=87 gui=reverse guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#eaeaea guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=#b0b4b8 guifg=black
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=36 gui=bold guibg=bg guifg=#4c8f2f
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=41 gui=bold guibg=bg guifg=#7fbf58
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#408010
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=37 ctermfg=79 gui=bold,italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=42 ctermfg=37 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=42 ctermfg=42 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=#202020
    CSAHi Visual term=reverse cterm=NONE ctermbg=86 ctermfg=fg gui=NONE guibg=LightGrey guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#c0d0e0 guifg=#708090
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=white guifg=black
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#80a090 guifg=white
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=42 gui=italic guibg=bg guifg=#a0b0c0
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#a07040
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=italic guibg=bg guifg=#70a0d0
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=italic guibg=bg guifg=#5b3674
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#007020
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#1060a0
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=italic guibg=bg guifg=#e5a00d
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=20 gui=italic guibg=bg guifg=#007020
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi DiffAdd term=bold cterm=bold ctermbg=58 ctermfg=fg gui=bold,italic guibg=#c0e0d0 guifg=fg
    CSAHi DiffChange term=bold cterm=bold ctermbg=87 ctermfg=fg gui=bold,italic guibg=#e0e0e0 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=74 ctermfg=fg gui=bold,italic guibg=#f0e0b0 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=74 ctermfg=fg gui=bold,italic guibg=#f0c8c8 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
