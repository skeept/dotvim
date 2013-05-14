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
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=230 gui=NONE guibg=#151515 guifg=#e8e8d3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#99ad6a
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#fad07a
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=244 gui=NONE guibg=#151515 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=187 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=131 ctermfg=fg gui=NONE guibg=#902020 guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=59 ctermfg=218 gui=underline guibg=#302028 guifg=#f0a0c0
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=102 gui=NONE guibg=#151515 guifg=#605958
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=90 gui=NONE guibg=bg guifg=#540063
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=255 ctermfg=233 gui=NONE guibg=#eeeeee guifg=#101010
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=152 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=#b0d0f0 guifg=fg
    CSAHi StringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=#556633
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=233 ctermfg=255 gui=italic guibg=#101010 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=234 ctermfg=247 gui=italic guibg=#181818 guifg=#a0a0a0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=234 gui=italic guibg=#181818 guifg=#181818
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=114 gui=bold guibg=bg guifg=#70b950
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=italic guibg=#384048 guifg=#a0a8b0
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=163 gui=NONE guibg=bg guifg=#dd0093
    CSAHi rubyRegexpSpecial term=NONE cterm=NONE ctermbg=bg ctermfg=126 gui=NONE guibg=bg guifg=#a40073
    CSAHi rubyPredefinedIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#de5577
    CSAHi rubyIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#7697d6
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#7597c6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=145 ctermfg=231 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=italic guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#cf6a4c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=108 gui=NONE guibg=bg guifg=#799d6a
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c6b6ee
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#8197bf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#ffb964
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=180 gui=NONE guibg=bg guifg=#c59f6f
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#447799
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=109 gui=NONE guibg=bg guifg=#668799
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#032218 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#100920 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#220000 guifg=#220000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#000940 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=#151515 guifg=#e8e8d3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#99ad6a
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#fad07a
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=244 gui=NONE guibg=#151515 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=131 ctermfg=fg gui=NONE guibg=#902020 guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=59 ctermfg=225 gui=underline guibg=#302028 guifg=#f0a0c0
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=102 gui=NONE guibg=#151515 guifg=#605958
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=90 gui=NONE guibg=bg guifg=#540063
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=255 ctermfg=233 gui=NONE guibg=#eeeeee guifg=#101010
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=189 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#b0d0f0 guifg=fg
    CSAHi StringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=#556633
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=233 ctermfg=255 gui=italic guibg=#101010 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=234 ctermfg=247 gui=italic guibg=#181818 guifg=#a0a0a0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=234 gui=italic guibg=#181818 guifg=#181818
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=150 gui=bold guibg=bg guifg=#70b950
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=66 ctermfg=188 gui=italic guibg=#384048 guifg=#a0a8b0
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#dd0093
    CSAHi rubyRegexpSpecial term=NONE cterm=NONE ctermbg=bg ctermfg=163 gui=NONE guibg=bg guifg=#a40073
    CSAHi rubyPredefinedIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=211 gui=NONE guibg=bg guifg=#de5577
    CSAHi rubyIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#7697d6
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#7597c6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=151 ctermfg=255 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=italic guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#cf6a4c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=150 gui=NONE guibg=bg guifg=#799d6a
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#c6b6ee
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=152 gui=NONE guibg=bg guifg=#8197bf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#ffb964
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#c59f6f
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#447799
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#668799
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=66 ctermfg=188 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=23 ctermfg=fg gui=NONE guibg=#032218 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#100920 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=52 gui=NONE guibg=#220000 guifg=#220000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#000940 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=66 ctermfg=188 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=188 gui=NONE guibg=#151515 guifg=#e8e8d3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=244 gui=bold guibg=bg guifg=#808080
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=#99ad6a
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#fad07a
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=233 ctermfg=244 gui=NONE guibg=#151515 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#902020 guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=188 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=52 ctermfg=217 gui=underline guibg=#302028 guifg=#f0a0c0
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=233 ctermfg=59 gui=NONE guibg=#151515 guifg=#605958
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#540063
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=255 ctermfg=233 gui=NONE guibg=#eeeeee guifg=#101010
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=233 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=145 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=#b0d0f0 guifg=fg
    CSAHi StringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#556633
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=233 ctermfg=255 gui=italic guibg=#101010 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=234 ctermfg=247 gui=italic guibg=#181818 guifg=#a0a0a0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=234 ctermfg=234 gui=italic guibg=#181818 guifg=#181818
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#70b950
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=italic guibg=#384048 guifg=#a0a8b0
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=162 gui=NONE guibg=bg guifg=#dd0093
    CSAHi rubyRegexpSpecial term=NONE cterm=NONE ctermbg=bg ctermfg=125 gui=NONE guibg=bg guifg=#a40073
    CSAHi rubyPredefinedIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=168 gui=NONE guibg=bg guifg=#de5577
    CSAHi rubyIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=104 gui=NONE guibg=bg guifg=#7697d6
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=104 gui=NONE guibg=bg guifg=#7597c6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=108 ctermfg=231 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=italic guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#cf6a4c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=#799d6a
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#c6b6ee
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#8197bf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#ffb964
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#c59f6f
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#447799
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#668799
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#032218 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#100920 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#220000 guifg=#220000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#000940 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=78 gui=NONE guibg=#151515 guifg=#e8e8d3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#808080
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#99ad6a
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#fad07a
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=83 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#151515 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#dad085
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#902020 guifg=fg
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=78 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=underline ctermbg=80 ctermfg=70 gui=underline guibg=#302028 guifg=#f0a0c0
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=#151515 guifg=#605958
    CSAHi rubyRegexpDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#540063
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=87 ctermfg=16 gui=NONE guibg=#eeeeee guifg=#101010
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=78 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=85 ctermfg=16 gui=italic guibg=#b0b8c0 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=87 ctermfg=16 gui=bold,italic guibg=#f0f0f0 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#9098a0
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#1c1c1c guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#b0d0f0 guifg=fg
    CSAHi StringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#556633
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=87 gui=italic guibg=#101010 guifg=#f0f0f0
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=84 gui=italic guibg=#181818 guifg=#a0a0a0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=80 gui=italic guibg=#181818 guifg=#181818
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=41 gui=bold guibg=bg guifg=#70b950
    CSAHi Visual term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#404040 guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=38 gui=italic guibg=#384048 guifg=#a0a8b0
    CSAHi rubyRegexp term=NONE cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=#dd0093
    CSAHi rubyRegexpSpecial term=NONE cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#a40073
    CSAHi rubyPredefinedIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#de5577
    CSAHi rubyIdentifier term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#c6b6fe
    CSAHi rubySymbol term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#7697d6
    CSAHi rubyControl term=NONE cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#7597c6
    CSAHi lCursor term=NONE cterm=NONE ctermbg=78 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#80a090 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=italic guibg=bg guifg=#888888
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#cf6a4c
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#799d6a
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#c6b6ee
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#8197bf
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffb964
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#c59f6f
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=42 gui=NONE guibg=bg guifg=#8fbfdc
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#447799
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#668799
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#032218 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#100920 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#220000 guifg=#220000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000940 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
