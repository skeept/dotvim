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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=#000000 guifg=#999999
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=145 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=145 gui=NONE guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=101 gui=NONE guibg=bg guifg=#775522
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=bg guifg=#666666
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=19 gui=NONE guibg=bg guifg=#000088
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi Search term=reverse cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=bg guifg=fg
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=163 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=19 ctermfg=253 gui=NONE guibg=#000088 guifg=#dddddd
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=253 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=253 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi Title term=bold cterm=NONE ctermbg=188 ctermfg=145 gui=NONE guibg=#cccccc guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=61 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=61 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=235 ctermfg=163 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi lCursor term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=34 gui=NONE guibg=bg guifg=#008800
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=124 gui=NONE guibg=bg guifg=#aa0000
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=136 gui=NONE guibg=bg guifg=#997700
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=253 gui=NONE guibg=bg guifg=#dddddd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=253 gui=NONE guibg=bg guifg=#dddddd
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#008888
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=104 gui=NONE guibg=bg guifg=#6666dd
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=163 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=16 gui=NONE guibg=#000088 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=#888800 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=16 gui=NONE guibg=#880000 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=160 ctermfg=145 gui=NONE guibg=#dd0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=163 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=#000000 guifg=#999999
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=246 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=246 gui=NONE guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=137 gui=NONE guibg=bg guifg=#775522
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=241 gui=NONE guibg=bg guifg=#666666
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=19 gui=NONE guibg=bg guifg=#000088
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi Search term=reverse cterm=NONE ctermbg=147 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=164 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=19 ctermfg=253 gui=NONE guibg=#000088 guifg=#dddddd
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=236 ctermfg=253 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=253 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi Title term=bold cterm=NONE ctermbg=252 ctermfg=246 gui=NONE guibg=#cccccc guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=104 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=104 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=235 ctermfg=164 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi lCursor term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=34 gui=NONE guibg=bg guifg=#008800
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=160 gui=NONE guibg=bg guifg=#aa0000
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=178 gui=NONE guibg=bg guifg=#997700
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=253 gui=NONE guibg=bg guifg=#dddddd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=253 gui=NONE guibg=bg guifg=#dddddd
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=bg guifg=#008888
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=105 gui=NONE guibg=bg guifg=#6666dd
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=164 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=16 gui=NONE guibg=#000088 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=#888800 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=124 ctermfg=16 gui=NONE guibg=#880000 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=196 ctermfg=246 gui=NONE guibg=#dd0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=164 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=#000000 guifg=#999999
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=246 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=246 gui=NONE guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=94 gui=NONE guibg=bg guifg=#775522
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=241 gui=NONE guibg=bg guifg=#666666
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=18 gui=NONE guibg=bg guifg=#000088
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=105 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi Search term=reverse cterm=NONE ctermbg=105 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=126 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=246 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=18 ctermfg=253 gui=NONE guibg=#000088 guifg=#dddddd
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=236 ctermfg=253 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=236 ctermfg=253 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi Title term=bold cterm=NONE ctermbg=252 ctermfg=246 gui=NONE guibg=#cccccc guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=61 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=61 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=235 ctermfg=126 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi lCursor term=NONE cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=28 gui=NONE guibg=bg guifg=#008800
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=124 gui=NONE guibg=bg guifg=#aa0000
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=100 gui=NONE guibg=bg guifg=#997700
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=253 gui=NONE guibg=bg guifg=#dddddd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=253 gui=NONE guibg=bg guifg=#dddddd
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=30 gui=NONE guibg=bg guifg=#008888
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=62 gui=NONE guibg=bg guifg=#6666dd
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=126 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=16 gui=NONE guibg=#000088 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=100 ctermfg=16 gui=NONE guibg=#888800 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=88 ctermfg=16 gui=NONE guibg=#880000 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=160 ctermfg=246 gui=NONE guibg=#dd0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=235 ctermfg=126 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=84 gui=NONE guibg=#000000 guifg=#999999
    CSAHi Underlined term=underline cterm=underline ctermbg=16 ctermfg=84 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=84 gui=NONE guibg=#ff0000 guifg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=36 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=bg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=bg guifg=#775522
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=81 gui=NONE guibg=bg guifg=#666666
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=17 gui=NONE guibg=bg guifg=#000088
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=39 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi Search term=reverse cterm=NONE ctermbg=39 ctermfg=16 gui=NONE guibg=#8888ee guifg=bg
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=16 ctermfg=84 gui=NONE guibg=bg guifg=fg
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=16 ctermfg=84 gui=NONE guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=49 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi Operator term=NONE cterm=NONE ctermbg=16 ctermfg=84 gui=NONE guibg=bg guifg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=16 ctermfg=84 gui=NONE guibg=bg guifg=fg
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=17 ctermfg=87 gui=NONE guibg=#000088 guifg=#dddddd
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#333333 guifg=#dddddd
    CSAHi Title term=bold cterm=NONE ctermbg=58 ctermfg=84 gui=NONE guibg=#cccccc guifg=fg
    CSAHi Visual term=reverse cterm=NONE ctermbg=17 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=17 ctermfg=16 gui=NONE guibg=#4444aa guifg=bg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=49 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi lCursor term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=16 ctermfg=20 gui=NONE guibg=bg guifg=#008800
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=32 gui=NONE guibg=bg guifg=#aa0000
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=bg guifg=#997700
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=bg guifg=#dddddd
    CSAHi Statement term=bold cterm=NONE ctermbg=16 ctermfg=87 gui=NONE guibg=bg guifg=#dddddd
    CSAHi PreProc term=underline cterm=NONE ctermbg=16 ctermfg=21 gui=NONE guibg=bg guifg=#008888
    CSAHi Type term=underline cterm=NONE ctermbg=16 ctermfg=38 gui=NONE guibg=bg guifg=#6666dd
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=49 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=16 gui=NONE guibg=#000088 guifg=bg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=36 ctermfg=16 gui=NONE guibg=#888800 guifg=bg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=32 ctermfg=16 gui=NONE guibg=#880000 guifg=bg
    CSAHi DiffText term=reverse cterm=NONE ctermbg=48 ctermfg=84 gui=NONE guibg=#dd0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=49 gui=NONE guibg=#222222 guifg=#bb0099
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
