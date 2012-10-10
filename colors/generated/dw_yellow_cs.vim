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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ff0000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#bbbb00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=226 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=226 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=142 gui=NONE guibg=#000000 guifg=#888800
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=16 ctermfg=231 gui=underline guibg=#000000 guifg=#ffffff
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#111100 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#181800 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi cInclude term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#696969
    CSAHi cDefine term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Visual term=reverse cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#dddd00 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#888888 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=235 ctermfg=196 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=235 ctermfg=226 gui=NONE guibg=#222222 guifg=#ffff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=184 gui=NONE guibg=#000000 guifg=#cccc00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=196 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=226 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffDelete term=bold cterm=bold ctermbg=59 ctermfg=226 gui=bold guibg=#333333 guifg=#ffff00
    CSAHi DiffText term=reverse cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=#333333 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=#111111 guifg=#ffffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ff0000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#bbbb00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=226 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=226 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=142 gui=NONE guibg=#000000 guifg=#888800
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=16 ctermfg=255 gui=underline guibg=#000000 guifg=#ffffff
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#111100 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#181800 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=238 ctermfg=255 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi cInclude term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#696969
    CSAHi cDefine term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Visual term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#dddd00 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=245 ctermfg=16 gui=NONE guibg=#888888 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=235 ctermfg=196 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=235 ctermfg=226 gui=NONE guibg=#222222 guifg=#ffff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#cccc00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=196 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=236 ctermfg=226 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=236 ctermfg=226 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffDelete term=bold cterm=bold ctermbg=236 ctermfg=226 gui=bold guibg=#333333 guifg=#ffff00
    CSAHi DiffText term=reverse cterm=bold ctermbg=236 ctermfg=255 gui=bold guibg=#333333 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=233 ctermfg=255 gui=NONE guibg=#111111 guifg=#ffffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#ff0000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=142 gui=NONE guibg=bg guifg=#bbbb00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=226 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=226 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=100 gui=NONE guibg=#000000 guifg=#888800
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=142 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=16 ctermfg=231 gui=underline guibg=#000000 guifg=#ffffff
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#111100 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#181800 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi cInclude term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#696969
    CSAHi cDefine term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Visual term=reverse cterm=NONE ctermbg=184 ctermfg=16 gui=NONE guibg=#dddd00 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=102 ctermfg=16 gui=NONE guibg=#888888 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=235 ctermfg=196 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=235 ctermfg=226 gui=NONE guibg=#222222 guifg=#ffff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=242 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=184 gui=NONE guibg=#000000 guifg=#cccc00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=235 ctermfg=196 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=236 ctermfg=226 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=236 ctermfg=226 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffDelete term=bold cterm=bold ctermbg=236 ctermfg=226 gui=bold guibg=#333333 guifg=#ffff00
    CSAHi DiffText term=reverse cterm=bold ctermbg=236 ctermfg=231 gui=bold guibg=#333333 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=233 ctermfg=231 gui=NONE guibg=#111111 guifg=#ffffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=85 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=#000000 guifg=#ff0000
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#bbbb00
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Function term=NONE cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi NonText term=bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi Directory term=bold cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=56 ctermfg=16 gui=NONE guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=76 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=76 gui=bold guibg=#000000 guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=#000000 guifg=#888800
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=80 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=36 ctermfg=16 gui=NONE guibg=#aaaa00 guifg=#000000
    CSAHi TabLineFill term=reverse cterm=underline ctermbg=16 ctermfg=79 gui=underline guibg=#000000 guifg=#ffffff
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#111100 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#181800 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#444444 guifg=#ffffff
    CSAHi cInclude term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#696969
    CSAHi cDefine term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=16 gui=NONE guibg=#444444 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Visual term=reverse cterm=NONE ctermbg=56 ctermfg=16 gui=NONE guibg=#dddd00 guifg=#000000
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#888888 guifg=#000000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=64 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=80 ctermfg=76 gui=NONE guibg=#222222 guifg=#ffff00
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=82 gui=NONE guibg=bg guifg=#696969
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Special term=bold cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Identifier term=underline cterm=NONE ctermbg=16 ctermfg=56 gui=NONE guibg=#000000 guifg=#cccc00
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=64 gui=NONE guibg=#222222 guifg=#ff0000
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=80 ctermfg=76 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=80 ctermfg=76 gui=NONE guibg=#333333 guifg=#ffff00
    CSAHi DiffDelete term=bold cterm=bold ctermbg=80 ctermfg=76 gui=bold guibg=#333333 guifg=#ffff00
    CSAHi DiffText term=reverse cterm=bold ctermbg=80 ctermfg=79 gui=bold guibg=#333333 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#111111 guifg=#ffffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
