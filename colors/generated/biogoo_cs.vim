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
    CSAHi Normal term=NONE cterm=NONE ctermbg=253 ctermfg=16 gui=NONE guibg=#d6d6d6 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=172 gui=underline guibg=bg guifg=#b85d00
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=253 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=253 gui=NONE guibg=#7f0000 guifg=#d6d6d6
    CSAHi Todo term=NONE cterm=underline ctermbg=254 ctermfg=18 gui=underline guibg=#e5e5e5 guifg=#00007f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=#d10000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=88 gui=NONE guibg=bg guifg=#7f0000
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#295498
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#295498
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#007f00
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#b85d00
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=21 ctermfg=231 gui=bold guibg=#0000ff guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=#ffff00 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#00007f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#00007f
    CSAHi LineNr term=underline cterm=underline ctermbg=254 ctermfg=236 gui=underline guibg=#e5e5e5 guifg=#303030
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=181 ctermfg=16 gui=NONE guibg=#cc9999 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=131 ctermfg=231 gui=NONE guibg=#993333 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=151 ctermfg=fg gui=NONE guibg=#99cc99 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=71 ctermfg=253 gui=reverse guibg=bg guifg=#339933
    CSAHi TabLine term=underline cterm=underline ctermbg=253 ctermfg=235 gui=underline guibg=#d6d6d6 guifg=#222222
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=18 gui=bold guibg=#eeeeee guifg=#00007f
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=253 ctermfg=253 gui=reverse guibg=bg guifg=#d6d6d6
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=18 ctermfg=231 gui=NONE guibg=#00007f guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi SpellErrors term=NONE cterm=undercurl ctermbg=88 ctermfg=253 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#295498
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#00007f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=18 ctermfg=231 gui=reverse,bold guibg=#ffffff guifg=#00007f
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=231 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=231 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=238 gui=bold guibg=bg guifg=#404040
    CSAHi Visual term=reverse cterm=NONE ctermbg=244 ctermfg=231 gui=NONE guibg=#7f7f7f guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=254 ctermfg=28 gui=bold,underline guibg=#e5e5e5 guifg=#007f00
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=88 gui=NONE guibg=bg guifg=#500000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=90 gui=NONE guibg=Yellow guifg=#540054
    CSAHi Folded term=NONE cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=253 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=34 ctermfg=231 gui=NONE guibg=#00a000 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#0000c3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#007f00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#004000
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#0c3b6b
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=90 gui=bold guibg=bg guifg=#540054
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=254 ctermfg=28 gui=NONE guibg=#e5e5e5 guifg=#007f00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffDelete term=bold cterm=bold ctermbg=254 ctermfg=88 gui=bold guibg=#e5e5e5 guifg=#7f0000
    CSAHi DiffText term=reverse cterm=bold ctermbg=254 ctermfg=196 gui=bold guibg=#e5e5e5 guifg=#ee0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=88 ctermfg=253 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=90 ctermfg=253 gui=undercurl guibg=#7f007f guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=172 ctermfg=253 gui=undercurl guibg=#b85d00 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=30 ctermfg=253 gui=undercurl guibg=#007f7f guifg=#ffffff guisp=#d6d6d6
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#d6d6d6 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=172 gui=underline guibg=bg guifg=#b85d00
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#7f0000 guifg=#d6d6d6
    CSAHi Todo term=NONE cterm=underline ctermbg=254 ctermfg=19 gui=underline guibg=#e5e5e5 guifg=#00007f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#d10000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=124 gui=NONE guibg=bg guifg=#7f0000
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#295498
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#295498
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#00007f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=34 gui=bold guibg=bg guifg=#007f00
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#b85d00
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=21 ctermfg=255 gui=bold guibg=#0000ff guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=#ffff00 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=#00007f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=#00007f
    CSAHi LineNr term=underline cterm=underline ctermbg=254 ctermfg=236 gui=underline guibg=#e5e5e5 guifg=#303030
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=#cc9999 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=167 ctermfg=255 gui=NONE guibg=#993333 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#99cc99 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=77 ctermfg=231 gui=reverse guibg=bg guifg=#339933
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=235 gui=underline guibg=#d6d6d6 guifg=#222222
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=19 gui=bold guibg=#eeeeee guifg=#00007f
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=231 gui=reverse guibg=bg guifg=#d6d6d6
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=19 ctermfg=255 gui=NONE guibg=#00007f guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#00007f
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#00007f
    CSAHi SpellErrors term=NONE cterm=undercurl ctermbg=124 ctermfg=231 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#295498
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=19 gui=bold guibg=bg guifg=#00007f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=19 ctermfg=255 gui=reverse,bold guibg=#ffffff guifg=#00007f
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=238 gui=bold guibg=bg guifg=#404040
    CSAHi Visual term=reverse cterm=NONE ctermbg=145 ctermfg=255 gui=NONE guibg=#7f7f7f guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=254 ctermfg=34 gui=bold,underline guibg=#e5e5e5 guifg=#007f00
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=88 gui=NONE guibg=bg guifg=#500000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=90 gui=NONE guibg=Yellow guifg=#540054
    CSAHi Folded term=NONE cterm=NONE ctermbg=254 ctermfg=19 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=40 ctermfg=255 gui=NONE guibg=#00a000 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000c3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#007f00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#004000
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#00007f
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=25 gui=bold guibg=bg guifg=#0c3b6b
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=90 gui=bold guibg=bg guifg=#540054
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#00007f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=254 ctermfg=19 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=254 ctermfg=34 gui=NONE guibg=#e5e5e5 guifg=#007f00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=254 ctermfg=19 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffDelete term=bold cterm=bold ctermbg=254 ctermfg=124 gui=bold guibg=#e5e5e5 guifg=#7f0000
    CSAHi DiffText term=reverse cterm=bold ctermbg=254 ctermfg=196 gui=bold guibg=#e5e5e5 guifg=#ee0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=124 ctermfg=231 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=127 ctermfg=231 gui=undercurl guibg=#7f007f guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=172 ctermfg=231 gui=undercurl guibg=#b85d00 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=37 ctermfg=231 gui=undercurl guibg=#007f7f guifg=#ffffff guisp=#d6d6d6
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#d6d6d6 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=130 gui=underline guibg=bg guifg=#b85d00
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=188 gui=NONE guibg=#7f0000 guifg=#d6d6d6
    CSAHi Todo term=NONE cterm=underline ctermbg=254 ctermfg=18 gui=underline guibg=#e5e5e5 guifg=#00007f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=#d10000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=88 gui=NONE guibg=bg guifg=#7f0000
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#295498
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#295498
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#007f00
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=130 gui=NONE guibg=bg guifg=#b85d00
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=21 ctermfg=231 gui=bold guibg=#0000ff guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=fg gui=NONE guibg=#ffff00 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#00007f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#00007f
    CSAHi LineNr term=underline cterm=underline ctermbg=254 ctermfg=236 gui=underline guibg=#e5e5e5 guifg=#303030
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=174 ctermfg=16 gui=NONE guibg=#cc9999 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=95 ctermfg=231 gui=NONE guibg=#993333 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=114 ctermfg=fg gui=NONE guibg=#99cc99 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=65 ctermfg=188 gui=reverse guibg=bg guifg=#339933
    CSAHi TabLine term=underline cterm=underline ctermbg=188 ctermfg=235 gui=underline guibg=#d6d6d6 guifg=#222222
    CSAHi TabLineSel term=bold cterm=bold ctermbg=255 ctermfg=18 gui=bold guibg=#eeeeee guifg=#00007f
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=188 gui=reverse guibg=bg guifg=#d6d6d6
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=18 ctermfg=231 gui=NONE guibg=#00007f guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi SpellErrors term=NONE cterm=undercurl ctermbg=88 ctermfg=188 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=24 gui=bold guibg=bg guifg=#295498
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#00007f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=18 ctermfg=231 gui=reverse,bold guibg=#ffffff guifg=#00007f
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=231 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=231 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=238 gui=bold guibg=bg guifg=#404040
    CSAHi Visual term=reverse cterm=NONE ctermbg=244 ctermfg=231 gui=NONE guibg=#7f7f7f guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=254 ctermfg=28 gui=bold,underline guibg=#e5e5e5 guifg=#007f00
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#500000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=53 gui=NONE guibg=Yellow guifg=#540054
    CSAHi Folded term=NONE cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=188 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=34 ctermfg=231 gui=NONE guibg=#00a000 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#0000c3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#0000ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#007f00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#004000
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=23 gui=bold guibg=bg guifg=#0c3b6b
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=53 gui=bold guibg=bg guifg=#540054
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#00007f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=254 ctermfg=28 gui=NONE guibg=#e5e5e5 guifg=#007f00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffDelete term=bold cterm=bold ctermbg=254 ctermfg=88 gui=bold guibg=#e5e5e5 guifg=#7f0000
    CSAHi DiffText term=reverse cterm=bold ctermbg=254 ctermfg=196 gui=bold guibg=#e5e5e5 guifg=#ee0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=88 ctermfg=188 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=90 ctermfg=188 gui=undercurl guibg=#7f007f guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=130 ctermfg=188 gui=undercurl guibg=#b85d00 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=30 ctermfg=188 gui=undercurl guibg=#007f7f guifg=#ffffff guisp=#d6d6d6
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=86 ctermfg=16 gui=NONE guibg=#d6d6d6 guifg=#000000
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=52 gui=underline guibg=bg guifg=#b85d00
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=86 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=32 ctermfg=86 gui=NONE guibg=#7f0000 guifg=#d6d6d6
    CSAHi Todo term=NONE cterm=underline ctermbg=87 ctermfg=17 gui=underline guibg=#e5e5e5 guifg=#00007f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#d10000
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#b85d00
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#7f0000
    CSAHi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#295498
    CSAHi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#295498
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#00007f
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#007f00
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#b85d00
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=19 ctermfg=79 gui=bold guibg=#0000ff guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=fg gui=NONE guibg=#ffff00 guifg=fg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#00007f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#00007f
    CSAHi LineNr term=underline cterm=underline ctermbg=87 ctermfg=80 gui=underline guibg=#e5e5e5 guifg=#303030
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=53 ctermfg=16 gui=NONE guibg=#cc9999 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#993333 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=41 ctermfg=fg gui=NONE guibg=#99cc99 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=20 ctermfg=86 gui=reverse guibg=bg guifg=#339933
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=80 gui=underline guibg=#d6d6d6 guifg=#222222
    CSAHi TabLineSel term=bold cterm=bold ctermbg=87 ctermfg=17 gui=bold guibg=#eeeeee guifg=#00007f
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=86 ctermfg=86 gui=reverse guibg=bg guifg=#d6d6d6
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#ffffff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#00007f guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#00007f
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#00007f
    CSAHi SpellErrors term=NONE cterm=undercurl ctermbg=32 ctermfg=86 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi Include term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#295498
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#00007f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=17 ctermfg=79 gui=reverse,bold guibg=#ffffff guifg=#00007f
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=81 ctermfg=79 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=81 ctermfg=79 gui=reverse guibg=#ffffff guifg=#676767
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=80 gui=bold guibg=bg guifg=#404040
    CSAHi Visual term=reverse cterm=NONE ctermbg=82 ctermfg=79 gui=NONE guibg=#7f7f7f guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=87 ctermfg=20 gui=bold,underline guibg=#e5e5e5 guifg=#007f00
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#500000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=33 gui=NONE guibg=Yellow guifg=#540054
    CSAHi Folded term=NONE cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=86 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#00a000 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#0000c3
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#0000ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#007f00
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#004000
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#00007f
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=17 gui=bold guibg=bg guifg=#0c3b6b
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=33 gui=bold guibg=bg guifg=#540054
    CSAHi Delimiter term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#00007f
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=87 ctermfg=20 gui=NONE guibg=#e5e5e5 guifg=#007f00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=#e5e5e5 guifg=#00007f
    CSAHi DiffDelete term=bold cterm=bold ctermbg=87 ctermfg=32 gui=bold guibg=#e5e5e5 guifg=#7f0000
    CSAHi DiffText term=reverse cterm=bold ctermbg=87 ctermfg=64 gui=bold guibg=#e5e5e5 guifg=#ee0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=32 ctermfg=86 gui=undercurl guibg=#7f0000 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=33 ctermfg=86 gui=undercurl guibg=#7f007f guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=52 ctermfg=86 gui=undercurl guibg=#b85d00 guifg=#ffffff guisp=#d6d6d6
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=21 ctermfg=86 gui=undercurl guibg=#007f7f guifg=#ffffff guisp=#d6d6d6
endif

if 1
    delcommand CSAHi
endif
