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
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=#F0F0F0 guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold,underline ctermbg=bg ctermfg=205 gui=bold,underline guibg=bg guifg=#ff4080
    CSAHi Todo term=NONE cterm=NONE ctermbg=225 ctermfg=198 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#087B4D
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=54 gui=bold guibg=bg guifg=#3E0F70
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#35E0DF
    CSAHi NonText term=bold cterm=NONE ctermbg=254 ctermfg=250 gui=NONE guibg=#E0E0E0 guifg=#C0C0C0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#FF0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=227 ctermfg=16 gui=NONE guibg=#FFFF4B guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#FFFF8F guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF6600
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=188 ctermfg=231 gui=NONE guibg=#C0D0E0 guifg=#FFFFFF
    CSAHi WarningMsgildMenu term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi Paren term=NONE cterm=NONE ctermbg=bg ctermfg=134 gui=NONE guibg=bg guifg=#9326C1
    CSAHi Comma term=NONE cterm=NONE ctermbg=bg ctermfg=168 gui=NONE guibg=bg guifg=#C12660
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=189 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=188 ctermfg=188 gui=NONE guibg=#CCCCCC guifg=#CCCCCC
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=248 gui=reverse guibg=#AAAAAA guifg=Black
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=235 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#F9F9F9 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=174 ctermfg=231 gui=NONE guibg=#DE7171 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Conditional term=NONE cterm=NONE ctermbg=255 ctermfg=33 gui=NONE guibg=bg guifg=#0053FF
    CSAHi Repeat term=NONE cterm=NONE ctermbg=255 ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=37 gui=NONE guibg=bg guifg=#0085B1
    CSAHi Keyword term=NONE cterm=NONE ctermbg=255 ctermfg=19 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Exception term=NONE cterm=NONE ctermbg=255 ctermfg=19 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=145 ctermfg=231 gui=italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=146 ctermfg=102 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=146 ctermfg=146 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=NONE ctermbg=195 ctermfg=24 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#BDDFFF guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF6600
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=75 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi SpellLocale term=NONE cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=157 ctermfg=fg gui=NONE guibg=#9FFF82 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=146 gui=italic guibg=#EFEFFF guifg=#A0B0C0
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#E8F1FF guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=195 ctermfg=21 gui=NONE guibg=#ccf7ee guifg=#0000ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#339933
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#005EC4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#eb7950
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=130 gui=bold guibg=bg guifg=#A8360F
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=75 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=28 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffChange term=bold cterm=NONE ctermbg=195 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=230 ctermfg=202 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi DiffText term=reverse cterm=NONE ctermbg=195 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=#F0F0F0 guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold,underline ctermbg=bg ctermfg=211 gui=bold,underline guibg=bg guifg=#ff4080
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=199 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#087B4D
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=55 gui=bold guibg=bg guifg=#3E0F70
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#35E0DF
    CSAHi NonText term=bold cterm=NONE ctermbg=254 ctermfg=250 gui=NONE guibg=#E0E0E0 guifg=#C0C0C0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#FF0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=228 ctermfg=16 gui=NONE guibg=#FFFF4B guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#FFFF8F guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF6600
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=255 gui=NONE guibg=#C0D0E0 guifg=#FFFFFF
    CSAHi WarningMsgildMenu term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi Paren term=NONE cterm=NONE ctermbg=bg ctermfg=135 gui=NONE guibg=bg guifg=#9326C1
    CSAHi Comma term=NONE cterm=NONE ctermbg=bg ctermfg=204 gui=NONE guibg=bg guifg=#C12660
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=252 ctermfg=252 gui=NONE guibg=#CCCCCC guifg=#CCCCCC
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=188 gui=reverse guibg=#AAAAAA guifg=Black
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=235 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#F9F9F9 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=217 ctermfg=255 gui=NONE guibg=#DE7171 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Conditional term=NONE cterm=NONE ctermbg=255 ctermfg=33 gui=NONE guibg=bg guifg=#0053FF
    CSAHi Repeat term=NONE cterm=NONE ctermbg=255 ctermfg=121 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=38 gui=NONE guibg=bg guifg=#0085B1
    CSAHi Keyword term=NONE cterm=NONE ctermbg=255 ctermfg=19 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Exception term=NONE cterm=NONE ctermbg=255 ctermfg=19 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=146 ctermfg=255 gui=italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=189 ctermfg=103 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=189 ctermfg=189 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=NONE ctermbg=231 ctermfg=30 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#BDDFFF guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#FF6600
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=81 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi SpellLocale term=NONE cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=193 ctermfg=fg gui=NONE guibg=#9FFF82 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=189 gui=italic guibg=#EFEFFF guifg=#A0B0C0
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#E8F1FF guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=#ccf7ee guifg=#0000ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#339933
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#005EC4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#eb7950
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=166 gui=bold guibg=bg guifg=#A8360F
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=81 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=28 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=202 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi DiffText term=reverse cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=#F0F0F0 guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold,underline ctermbg=bg ctermfg=204 gui=bold,underline guibg=bg guifg=#ff4080
    CSAHi Todo term=NONE cterm=NONE ctermbg=225 ctermfg=197 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#087B4D
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=53 gui=bold guibg=bg guifg=#3E0F70
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#35E0DF
    CSAHi NonText term=bold cterm=NONE ctermbg=254 ctermfg=250 gui=NONE guibg=#E0E0E0 guifg=#C0C0C0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#FF0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=227 ctermfg=16 gui=NONE guibg=#FFFF4B guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=228 ctermfg=16 gui=NONE guibg=#FFFF8F guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=202 gui=NONE guibg=bg guifg=#FF6600
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=152 ctermfg=231 gui=NONE guibg=#C0D0E0 guifg=#FFFFFF
    CSAHi WarningMsgildMenu term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi Paren term=NONE cterm=NONE ctermbg=bg ctermfg=91 gui=NONE guibg=bg guifg=#9326C1
    CSAHi Comma term=NONE cterm=NONE ctermbg=bg ctermfg=125 gui=NONE guibg=bg guifg=#C12660
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=252 ctermfg=252 gui=NONE guibg=#CCCCCC guifg=#CCCCCC
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=248 gui=reverse guibg=#AAAAAA guifg=Black
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=235 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#F9F9F9 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=167 ctermfg=231 gui=NONE guibg=#DE7171 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Conditional term=NONE cterm=NONE ctermbg=255 ctermfg=27 gui=NONE guibg=bg guifg=#0053FF
    CSAHi Repeat term=NONE cterm=NONE ctermbg=255 ctermfg=84 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=255 ctermfg=31 gui=NONE guibg=bg guifg=#0085B1
    CSAHi Keyword term=NONE cterm=NONE ctermbg=255 ctermfg=18 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Exception term=NONE cterm=NONE ctermbg=255 ctermfg=18 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=103 ctermfg=231 gui=italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=59 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=145 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=NONE ctermbg=195 ctermfg=23 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=#BDDFFF guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=202 gui=NONE guibg=bg guifg=#FF6600
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=195 ctermfg=69 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi SpellLocale term=NONE cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=156 ctermfg=fg gui=NONE guibg=#9FFF82 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=145 gui=italic guibg=#EFEFFF guifg=#A0B0C0
    CSAHi Constant term=underline cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#E8F1FF guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=195 ctermfg=21 gui=NONE guibg=#ccf7ee guifg=#0000ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#339933
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#005EC4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#eb7950
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=130 gui=bold guibg=bg guifg=#A8360F
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=195 ctermfg=69 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=22 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffChange term=bold cterm=NONE ctermbg=194 ctermfg=21 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=224 ctermfg=202 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi DiffText term=reverse cterm=NONE ctermbg=194 ctermfg=21 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=#F0F0F0 guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=19 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold,underline ctermbg=bg ctermfg=65 gui=bold,underline guibg=bg guifg=#ff4080
    CSAHi Todo term=NONE cterm=NONE ctermbg=75 ctermfg=65 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#087B4D
    CSAHi Function term=NONE cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#3E0F70
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#35E0DF
    CSAHi NonText term=bold cterm=NONE ctermbg=87 ctermfg=85 gui=NONE guibg=#E0E0E0 guifg=#C0C0C0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=Blue
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#FF0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=#FFFF4B guifg=Black
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=#FFFF8F guifg=Black
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#FF6600
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=58 ctermfg=79 gui=NONE guibg=#C0D0E0 guifg=#FFFFFF
    CSAHi WarningMsgildMenu term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi Paren term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#9326C1
    CSAHi Comma term=NONE cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=#C12660
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=19 gui=underline guibg=bg guifg=#0000ff
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#BDDFFF guifg=Black
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=Orange guifg=Black
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=58 ctermfg=58 gui=NONE guibg=#CCCCCC guifg=#CCCCCC
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=84 gui=reverse guibg=#AAAAAA guifg=Black
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=87 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#F9F9F9 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#f6f6f6 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=53 ctermfg=79 gui=NONE guibg=#DE7171 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Conditional term=NONE cterm=NONE ctermbg=87 ctermfg=23 gui=NONE guibg=bg guifg=#0053FF
    CSAHi Repeat term=NONE cterm=NONE ctermbg=87 ctermfg=45 gui=NONE guibg=bg guifg=SeaGreen2
    CSAHi Operator term=NONE cterm=NONE ctermbg=87 ctermfg=22 gui=NONE guibg=bg guifg=#0085B1
    CSAHi Keyword term=NONE cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Exception term=NONE cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=bg guifg=DarkBlue
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=37 ctermfg=79 gui=italic guibg=#8090a0 guifg=white
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=42 ctermfg=37 gui=italic guibg=#a0b0c0 guifg=#506070
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=42 ctermfg=42 gui=NONE guibg=#a0b0c0 guifg=#a0b0c0
    CSAHi Title term=bold cterm=NONE ctermbg=63 ctermfg=17 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#BDDFFF guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#FF6600
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=79 ctermfg=23 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi SpellLocale term=NONE cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
    CSAHi lCursor term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=45 ctermfg=fg gui=NONE guibg=#9FFF82 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=79 ctermfg=42 gui=italic guibg=#EFEFFF guifg=#A0B0C0
    CSAHi Constant term=underline cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#E8F1FF guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=#ccf7ee guifg=#0000ff
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#339933
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#005EC4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#eb7950
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=#A8360F
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=79 ctermfg=23 gui=NONE guibg=#EAF5FF guifg=#3399ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=62 ctermfg=20 gui=NONE guibg=#d0ffd0 guifg=#006800
    CSAHi DiffChange term=bold cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=78 ctermfg=64 gui=NONE guibg=#ffeae0 guifg=#f83010
    CSAHi DiffText term=reverse cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=#c8f2ea guifg=#2020ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
