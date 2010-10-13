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
    CSAHi Normal term=NONE cterm=NONE ctermbg=66 ctermfg=224 gui=NONE guibg=#2f4f4f guifg=#f5deb3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ff83fa guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#e0ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#ffffff guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=220 ctermfg=16 gui=bold guibg=#ffd700 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=73 gui=bold guibg=bg guifg=#20b2aa
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=109 ctermfg=186 gui=bold guibg=#528b8b guifg=#bdb76b
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=#ff83fa guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=224 ctermfg=66 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=224 ctermfg=66 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=176 ctermfg=224 gui=NONE guibg=#da70d6 guifg=fg
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=#ff6347
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=229 gui=bold guibg=#000000 guifg=#f0e68c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=186 gui=reverse guibg=#bdb76b guifg=#404040
    CSAHi VertSplit term=reverse cterm=bold ctermbg=16 ctermfg=186 gui=bold guibg=#000000 guifg=#bdb76b
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=#ff6347
    CSAHi Visual term=reverse cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=fg guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=224 ctermfg=16 gui=bold guibg=fg guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=209 ctermfg=231 gui=NONE guibg=#ff6347 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=224 ctermfg=66 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=176 gui=NONE guibg=bg guifg=#da70d6
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#afeeee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=157 gui=bold guibg=bg guifg=#98fb98
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#00ff7f
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ff6347
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=bg ctermfg=122 gui=underline guibg=bg guifg=#7fffd4
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=#b0c4de
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=176 gui=bold guibg=bg guifg=#da70d6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=109 ctermfg=fg gui=NONE guibg=#528b8b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=138 ctermfg=fg gui=NONE guibg=#8b636c guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=224 gui=bold guibg=#000000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=104 ctermfg=fg gui=bold guibg=#6959cd guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=73 ctermfg=186 gui=bold guibg=#20b2aa guifg=#bdb76b
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=66 ctermfg=230 gui=NONE guibg=#2f4f4f guifg=#f5deb3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=219 ctermfg=16 gui=bold guibg=#ff83fa guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#e0ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=255 ctermfg=16 gui=bold guibg=#ffffff guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffd700 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=#20b2aa
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=109 ctermfg=187 gui=bold guibg=#528b8b guifg=#bdb76b
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=#ff83fa guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=66 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=230 ctermfg=66 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=219 ctermfg=230 gui=NONE guibg=#da70d6 guifg=fg
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#ff6347
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=229 gui=bold guibg=#000000 guifg=#f0e68c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=187 gui=reverse guibg=#bdb76b guifg=#404040
    CSAHi VertSplit term=reverse cterm=bold ctermbg=16 ctermfg=187 gui=bold guibg=#000000 guifg=#bdb76b
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#ff6347
    CSAHi Visual term=reverse cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=fg guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=230 ctermfg=16 gui=bold guibg=fg guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=210 ctermfg=255 gui=NONE guibg=#ff6347 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=66 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#da70d6
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#afeeee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=194 gui=bold guibg=bg guifg=#98fb98
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=49 gui=NONE guibg=bg guifg=#00ff7f
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff6347
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=bg ctermfg=159 gui=underline guibg=bg guifg=#7fffd4
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=195 gui=bold guibg=bg guifg=#b0c4de
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#da70d6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=109 ctermfg=fg gui=NONE guibg=#528b8b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=139 ctermfg=fg gui=NONE guibg=#8b636c guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=230 gui=bold guibg=#000000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=105 ctermfg=fg gui=bold guibg=#6959cd guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=80 ctermfg=187 gui=bold guibg=#20b2aa guifg=#bdb76b
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=223 gui=NONE guibg=#2f4f4f guifg=#f5deb3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=213 ctermfg=16 gui=bold guibg=#ff83fa guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#e0ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=231 ctermfg=16 gui=bold guibg=#ffffff guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=220 ctermfg=16 gui=bold guibg=#ffd700 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=#20b2aa
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=66 ctermfg=143 gui=bold guibg=#528b8b guifg=#bdb76b
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=213 ctermfg=fg gui=NONE guibg=#ff83fa guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=223 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=223 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=170 ctermfg=223 gui=NONE guibg=#da70d6 guifg=fg
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=#ff6347
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=222 gui=bold guibg=#000000 guifg=#f0e68c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=143 gui=reverse guibg=#bdb76b guifg=#404040
    CSAHi VertSplit term=reverse cterm=bold ctermbg=16 ctermfg=143 gui=bold guibg=#000000 guifg=#bdb76b
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=#ff6347
    CSAHi Visual term=reverse cterm=NONE ctermbg=223 ctermfg=16 gui=NONE guibg=fg guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=223 ctermfg=16 gui=bold guibg=fg guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#ff6347 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=bold guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=223 ctermfg=23 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=170 gui=NONE guibg=bg guifg=#da70d6
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#afeeee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#98fb98
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#00ff7f
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff6347
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=bg ctermfg=122 gui=underline guibg=bg guifg=#7fffd4
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=bold guibg=bg guifg=#b0c4de
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=170 gui=bold guibg=bg guifg=#da70d6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=66 ctermfg=fg gui=NONE guibg=#528b8b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=95 ctermfg=fg gui=NONE guibg=#8b636c guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=223 gui=bold guibg=#000000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=62 ctermfg=fg gui=bold guibg=#6959cd guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=37 ctermfg=143 gui=bold guibg=#20b2aa guifg=#bdb76b
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=21 ctermfg=74 gui=NONE guibg=#2f4f4f guifg=#f5deb3
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=71 ctermfg=16 gui=bold guibg=#ff83fa guifg=#000000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Character term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#7fffd4
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#00ffff
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#e0ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=79 ctermfg=16 gui=bold guibg=#ffffff guifg=#000000
    CSAHi Search term=reverse cterm=bold ctermbg=72 ctermfg=16 gui=bold guibg=#ffd700 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=25 gui=bold guibg=bg guifg=#20b2aa
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=37 ctermfg=57 gui=bold guibg=#528b8b guifg=#bdb76b
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=71 ctermfg=fg gui=NONE guibg=#ff83fa guifg=fg
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=74 ctermfg=21 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=74 ctermfg=21 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=54 ctermfg=74 gui=NONE guibg=#da70d6 guifg=fg
    CSAHi Debug term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=#ff0000
    CSAHi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi Label term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi Operator term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi Exception term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#ff6347
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=16 ctermfg=73 gui=bold guibg=#000000 guifg=#f0e68c
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=57 gui=reverse guibg=#bdb76b guifg=#404040
    CSAHi VertSplit term=reverse cterm=bold ctermbg=16 ctermfg=57 gui=bold guibg=#000000 guifg=#bdb76b
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#ff6347
    CSAHi Visual term=reverse cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=fg guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold ctermbg=74 ctermfg=16 gui=bold guibg=fg guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=69 ctermfg=79 gui=NONE guibg=#ff6347 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=76 ctermfg=16 gui=bold guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=74 ctermfg=21 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#da70d6
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff6347
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#afeeee
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#4682b4
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#cdcd00
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#98fb98
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#20b2aa
    CSAHi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#00ff7f
    CSAHi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff6347
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=bg ctermfg=46 gui=underline guibg=bg guifg=#7fffd4
    CSAHi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=58 gui=bold guibg=bg guifg=#b0c4de
    CSAHi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=54 gui=bold guibg=bg guifg=#da70d6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#bdb76b guifg=#000000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#528b8b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#8b636c guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=74 gui=bold guibg=#000000 guifg=fg
    CSAHi DiffText term=reverse cterm=bold ctermbg=38 ctermfg=fg gui=bold guibg=#6959cd guifg=fg
    CSAHi SignColumn term=NONE cterm=bold ctermbg=25 ctermfg=57 gui=bold guibg=#20b2aa guifg=#bdb76b
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
