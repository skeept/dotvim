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
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#303040 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=231 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#303040
    CSAHi Error term=reverse cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=37 ctermfg=50 gui=bold guibg=#0080a0 guifg=#00ffe0
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=188 gui=bold guibg=bg guifg=#b8b8c8
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#60a0ff
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=135 gui=bold guibg=#383848 guifg=#8040ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=164 ctermfg=231 gui=bold,underline guibg=#d000d0 guifg=#f0f0f8
    CSAHi Search term=reverse cterm=bold ctermbg=164 ctermfg=225 gui=bold guibg=#c000c0 guifg=#ffd0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=50 gui=bold guibg=bg guifg=#00ffdd
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=103 gui=NONE guibg=bg guifg=#787894
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=173 ctermfg=231 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=#d0d050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=103 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=103 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=127 ctermfg=231 gui=bold guibg=#9000a0 guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=179 ctermfg=231 gui=NONE guibg=#c08040 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#e0e078 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=140 ctermfg=231 gui=NONE guibg=#9060c0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#e0e070
    CSAHi Constant term=underline cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=#4830a0 guifg=#f0f0f8
    CSAHi Special term=bold cterm=NONE ctermbg=61 ctermfg=87 gui=NONE guibg=#4830a0 guifg=#40f8f8
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#40ffa0
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=183 gui=bold guibg=bg guifg=#bbaaff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=60 ctermfg=183 gui=NONE guibg=#404052 guifg=#c0a0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=74 ctermfg=231 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=30 ctermfg=231 gui=NONE guibg=#007070 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=74 ctermfg=231 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=72 ctermfg=231 gui=NONE guibg=#40a060 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=60 ctermfg=255 gui=NONE guibg=#303040 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=255 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#303040
    CSAHi Error term=reverse cterm=bold ctermbg=199 ctermfg=255 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=38 ctermfg=51 gui=bold guibg=#0080a0 guifg=#00ffe0
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#b8b8c8
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#60a0ff
    CSAHi NonText term=bold cterm=bold ctermbg=60 ctermfg=141 gui=bold guibg=#383848 guifg=#8040ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=199 ctermfg=255 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=201 ctermfg=255 gui=bold,underline guibg=#d000d0 guifg=#f0f0f8
    CSAHi Search term=reverse cterm=bold ctermbg=201 ctermfg=231 gui=bold guibg=#c000c0 guifg=#ffd0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00ffdd
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#787894
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=209 ctermfg=255 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=200 ctermfg=255 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#d0d050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=103 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=103 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=128 ctermfg=255 gui=bold guibg=#9000a0 guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=216 ctermfg=255 gui=NONE guibg=#c08040 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=199 ctermfg=255 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#e0e078 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=141 ctermfg=255 gui=NONE guibg=#9060c0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=200 ctermfg=255 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#e0e070
    CSAHi Constant term=underline cterm=NONE ctermbg=98 ctermfg=255 gui=NONE guibg=#4830a0 guifg=#f0f0f8
    CSAHi Special term=bold cterm=NONE ctermbg=98 ctermfg=123 gui=NONE guibg=#4830a0 guifg=#40f8f8
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=122 gui=NONE guibg=bg guifg=#40ffa0
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=189 gui=bold guibg=bg guifg=#bbaaff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=102 ctermfg=225 gui=NONE guibg=#404052 guifg=#c0a0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=117 ctermfg=255 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=37 ctermfg=255 gui=NONE guibg=#007070 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=117 ctermfg=255 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=114 ctermfg=255 gui=NONE guibg=#40a060 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#303040 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=231 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#303040
    CSAHi Error term=reverse cterm=bold ctermbg=198 ctermfg=231 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=31 ctermfg=50 gui=bold guibg=#0080a0 guifg=#00ffe0
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=146 gui=bold guibg=bg guifg=#b8b8c8
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=#60a0ff
    CSAHi NonText term=bold cterm=bold ctermbg=59 ctermfg=99 gui=bold guibg=#383848 guifg=#8040ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=198 ctermfg=231 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=164 ctermfg=231 gui=bold,underline guibg=#d000d0 guifg=#f0f0f8
    CSAHi Search term=reverse cterm=bold ctermbg=127 ctermfg=225 gui=bold guibg=#c000c0 guifg=#ffd0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=50 gui=bold guibg=bg guifg=#00ffdd
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#787894
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=166 ctermfg=231 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=185 gui=bold guibg=bg guifg=#d0d050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=60 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=60 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=91 ctermfg=231 gui=bold guibg=#9000a0 guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=137 ctermfg=231 gui=NONE guibg=#c08040 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=198 ctermfg=231 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#e0e078 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=97 ctermfg=231 gui=NONE guibg=#9060c0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=185 gui=NONE guibg=bg guifg=#e0e070
    CSAHi Constant term=underline cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=#4830a0 guifg=#f0f0f8
    CSAHi Special term=bold cterm=NONE ctermbg=61 ctermfg=87 gui=NONE guibg=#4830a0 guifg=#40f8f8
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#40ffa0
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=147 gui=bold guibg=bg guifg=#bbaaff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=59 ctermfg=147 gui=NONE guibg=#404052 guifg=#c0a0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=73 ctermfg=231 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#007070 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=73 ctermfg=231 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=71 ctermfg=231 gui=NONE guibg=#40a060 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#303040 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=79 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#303040
    CSAHi Error term=reverse cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=21 ctermfg=30 gui=bold guibg=#0080a0 guifg=#00ffe0
    CSAHi Number term=NONE cterm=bold ctermbg=bg ctermfg=58 gui=bold guibg=bg guifg=#b8b8c8
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#60a0ff
    CSAHi NonText term=bold cterm=bold ctermbg=17 ctermfg=35 gui=bold guibg=#383848 guifg=#8040ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=50 ctermfg=79 gui=bold,underline guibg=#d000d0 guifg=#f0f0f8
    CSAHi Search term=reverse cterm=bold ctermbg=50 ctermfg=75 gui=bold guibg=#c000c0 guifg=#ffd0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=30 gui=bold guibg=bg guifg=#00ffdd
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=27 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#787894
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=52 ctermfg=79 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=50 ctermfg=79 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=#d0d050
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#c8c8d8 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#c8c8d8 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=33 ctermfg=79 gui=bold guibg=#9000a0 guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=52 ctermfg=79 gui=NONE guibg=#c08040 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#f00080 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#e0e078 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=38 ctermfg=79 gui=NONE guibg=#9060c0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=50 ctermfg=79 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#e0e070
    CSAHi Constant term=underline cterm=NONE ctermbg=33 ctermfg=79 gui=NONE guibg=#4830a0 guifg=#f0f0f8
    CSAHi Special term=bold cterm=NONE ctermbg=33 ctermfg=31 gui=NONE guibg=#4830a0 guifg=#40f8f8
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#ffa0ff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=27 gui=bold guibg=bg guifg=#00d8f8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#40ffa0
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=55 gui=bold guibg=bg guifg=#bbaaff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=55 gui=NONE guibg=#404052 guifg=#c0a0ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#007070 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#40a0c0 guifg=#ffffff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#40a060 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
