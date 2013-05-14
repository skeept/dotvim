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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=white guifg=#1a1a1a
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=104 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=168 gui=NONE guibg=white guifg=#bb3355
    CSAHi Todo term=NONE cterm=NONE ctermbg=194 ctermfg=65 gui=italic guibg=#ddeecc guifg=#446644
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=188 gui=bold guibg=#fafafa guifg=#cccccc
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=255 ctermfg=204 gui=NONE guibg=#eeeeee guifg=#f03050
    CSAHi IncSearch term=reverse cterm=bold ctermbg=227 ctermfg=fg gui=bold guibg=#ffff33 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=fg gui=NONE guibg=#fcfcaa guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=255 ctermfg=30 gui=NONE guibg=#eeeeee guifg=#007050
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=248 gui=NONE guibg=#f8f8f8 guifg=#aaaaaa
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=231 ctermfg=102 gui=NONE guibg=#f0f5ff guifg=#60656f
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=75 ctermfg=231 gui=bold guibg=#3585ef guifg=white
    CSAHi PmenuSbar term=NONE cterm=bold ctermbg=189 ctermfg=188 gui=bold guibg=#e0e5ee guifg=#d0d5dd
    CSAHi PmenuThumb term=NONE cterm=bold ctermbg=188 ctermfg=189 gui=bold guibg=#c0c5dd guifg=#e0e5ee
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=234 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=#111111 guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#006040
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#007050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=#eeeeee guifg=#222222
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=255 ctermfg=102 gui=NONE guibg=#eeeeee guifg=#666666
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=#eeeeee guifg=#eeeeee
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#bbddff guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=234 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#ccffdd guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=108 gui=NONE guibg=bg guifg=#668866
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#204070
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=138 gui=NONE guibg=bg guifg=#a05050
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#0050b0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#007050
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#0050b0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=234 gui=NONE guibg=white guifg=#1a1a1a
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=105 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=255 ctermfg=168 gui=NONE guibg=white guifg=#bb3355
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=102 gui=italic guibg=#ddeecc guifg=#446644
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=252 gui=bold guibg=#fafafa guifg=#cccccc
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=255 ctermfg=204 gui=NONE guibg=#eeeeee guifg=#f03050
    CSAHi IncSearch term=reverse cterm=bold ctermbg=227 ctermfg=fg gui=bold guibg=#ffff33 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=230 ctermfg=fg gui=NONE guibg=#fcfcaa guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=255 ctermfg=36 gui=NONE guibg=#eeeeee guifg=#007050
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=188 gui=NONE guibg=#f8f8f8 guifg=#aaaaaa
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=255 ctermfg=103 gui=NONE guibg=#f0f5ff guifg=#60656f
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=75 ctermfg=255 gui=bold guibg=#3585ef guifg=white
    CSAHi PmenuSbar term=NONE cterm=bold ctermbg=231 ctermfg=231 gui=bold guibg=#e0e5ee guifg=#d0d5dd
    CSAHi PmenuThumb term=NONE cterm=bold ctermbg=231 ctermfg=231 gui=bold guibg=#c0c5dd guifg=#e0e5ee
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=234 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#111111 guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#006040
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#007050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=#eeeeee guifg=#222222
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=255 ctermfg=241 gui=NONE guibg=#eeeeee guifg=#666666
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=#eeeeee guifg=#eeeeee
    CSAHi Title term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#bbddff guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=19 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=234 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ccffdd guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=108 gui=NONE guibg=bg guifg=#668866
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#204070
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#a05050
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0050b0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#007050
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0050b0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=white guifg=#1a1a1a
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=231 ctermfg=131 gui=NONE guibg=white guifg=#bb3355
    CSAHi Todo term=NONE cterm=NONE ctermbg=194 ctermfg=59 gui=italic guibg=#ddeecc guifg=#446644
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=252 gui=bold guibg=#fafafa guifg=#cccccc
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=255 ctermfg=203 gui=NONE guibg=#eeeeee guifg=#f03050
    CSAHi IncSearch term=reverse cterm=bold ctermbg=227 ctermfg=fg gui=bold guibg=#ffff33 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=fg gui=NONE guibg=#fcfcaa guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=255 ctermfg=23 gui=NONE guibg=#eeeeee guifg=#007050
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=248 gui=NONE guibg=#f8f8f8 guifg=#aaaaaa
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=#f0f5ff guifg=#60656f
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=69 ctermfg=231 gui=bold guibg=#3585ef guifg=white
    CSAHi PmenuSbar term=NONE cterm=bold ctermbg=189 ctermfg=188 gui=bold guibg=#e0e5ee guifg=#d0d5dd
    CSAHi PmenuThumb term=NONE cterm=bold ctermbg=152 ctermfg=189 gui=bold guibg=#c0c5dd guifg=#e0e5ee
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=234 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=#111111 guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#006040
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#007050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=#eeeeee guifg=#222222
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=255 ctermfg=241 gui=NONE guibg=#eeeeee guifg=#666666
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=#eeeeee guifg=#eeeeee
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=#bbddff guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=252 ctermfg=18 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=234 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#ccffdd guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#668866
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#204070
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=131 gui=NONE guibg=bg guifg=#a05050
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#0050b0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#007050
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#0050b0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1a1a1a
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
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=white guifg=#1a1a1a
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=38 gui=underline guibg=bg guifg=SlateBlue
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=79 ctermfg=49 gui=NONE guibg=white guifg=#bb3355
    CSAHi Todo term=NONE cterm=NONE ctermbg=62 ctermfg=20 gui=italic guibg=#ddeecc guifg=#446644
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi NonText term=bold cterm=bold ctermbg=79 ctermfg=58 gui=bold guibg=#fafafa guifg=#cccccc
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=87 ctermfg=65 gui=NONE guibg=#eeeeee guifg=#f03050
    CSAHi IncSearch term=reverse cterm=bold ctermbg=76 ctermfg=fg gui=bold guibg=#ffff33 guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=fg gui=NONE guibg=#fcfcaa guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=#eeeeee guifg=#007050
    CSAHi LineNr term=underline cterm=NONE ctermbg=79 ctermfg=84 gui=NONE guibg=#f8f8f8 guifg=#aaaaaa
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=79 ctermfg=37 gui=NONE guibg=#f0f5ff guifg=#60656f
    CSAHi PmenuSel term=NONE cterm=bold ctermbg=23 ctermfg=79 gui=bold guibg=#3585ef guifg=white
    CSAHi PmenuSbar term=NONE cterm=bold ctermbg=87 ctermfg=58 gui=bold guibg=#e0e5ee guifg=#d0d5dd
    CSAHi PmenuThumb term=NONE cterm=bold ctermbg=58 ctermfg=87 gui=bold guibg=#c0c5dd guifg=#e0e5ee
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#111111 guifg=bg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#006040
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#007050
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#eeeeee guifg=#222222
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=87 ctermfg=81 gui=NONE guibg=#eeeeee guifg=#666666
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=87 ctermfg=87 gui=NONE guibg=#eeeeee guifg=#eeeeee
    CSAHi Title term=bold cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=white guifg=black
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#bbddff guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=86 ctermfg=17 gui=NONE guibg=LightGrey guifg=DarkBlue
    CSAHi lCursor term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=#ccffdd guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#668866
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#204070
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#a05050
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#1a1a1a
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0050b0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#007050
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0050b0
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#1a1a1a
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
