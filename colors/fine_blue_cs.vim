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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=238 gui=NONE guibg=#f8f8f8 guifg=#404048
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=205 ctermfg=231 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=225 ctermfg=198 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#d87000
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=57 gui=bold guibg=#ececf0 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=225 ctermfg=198 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi IncSearch term=reverse cterm=underline ctermbg=87 ctermfg=60 gui=underline guibg=#40ffff guifg=#404054
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=60 gui=NONE guibg=#ffffa0 guifg=#404054
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=129 gui=NONE guibg=bg guifg=#a800ff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#a0a0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=45 ctermfg=21 gui=NONE guibg=#00e0ff guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=60 ctermfg=231 gui=bold guibg=#404054 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=60 ctermfg=250 gui=NONE guibg=#404054 guifg=#b8b8c0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#404054 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=195 ctermfg=24 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=189 ctermfg=60 gui=NONE guibg=#dddde8 guifg=#404060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=225 ctermfg=198 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=38 ctermfg=231 gui=bold guibg=#00aacc guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=189 ctermfg=99 gui=NONE guibg=#e0d8ff guifg=#7820ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=200 gui=NONE guibg=bg guifg=#ff00c0
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#e8e8ff guifg=#2020ff
    CSAHi Special term=bold cterm=NONE ctermbg=195 ctermfg=30 gui=NONE guibg=#ccf7ee guifg=#005858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=165 gui=NONE guibg=bg guifg=#c800ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#008858
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=99 gui=NONE guibg=bg guifg=#7040ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=141 gui=NONE guibg=#f0f0f4 guifg=#aa60ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=195 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=189 ctermfg=105 gui=NONE guibg=#e0e0ff guifg=#5050ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=195 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=189 ctermfg=63 gui=NONE guibg=#c0c0ff guifg=#4040ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f8f8f8 guifg=#404048
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=211 ctermfg=255 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=199 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#d87000
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=93 gui=bold guibg=#ececf0 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=199 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi IncSearch term=reverse cterm=underline ctermbg=123 ctermfg=102 gui=underline guibg=#40ffff guifg=#404054
    CSAHi Search term=reverse cterm=NONE ctermbg=230 ctermfg=102 gui=NONE guibg=#ffffa0 guifg=#404054
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=165 gui=NONE guibg=bg guifg=#a800ff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#a0a0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=238 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=238 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=51 ctermfg=21 gui=NONE guibg=#00e0ff guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=102 ctermfg=255 gui=bold guibg=#404054 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=102 ctermfg=250 gui=NONE guibg=#404054 guifg=#b8b8c0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=102 ctermfg=255 gui=NONE guibg=#404054 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=231 ctermfg=30 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=102 gui=NONE guibg=#dddde8 guifg=#404060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=231 ctermfg=199 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=45 ctermfg=255 gui=bold guibg=#00aacc guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=135 gui=NONE guibg=#e0d8ff guifg=#7820ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=#ff00c0
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#e8e8ff guifg=#2020ff
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=30 gui=NONE guibg=#ccf7ee guifg=#005858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=201 gui=NONE guibg=bg guifg=#c800ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#008858
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=141 gui=NONE guibg=bg guifg=#7040ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=177 gui=NONE guibg=#f0f0f4 guifg=#aa60ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=105 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=105 gui=NONE guibg=#e0e0ff guifg=#5050ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=105 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=231 ctermfg=105 gui=NONE guibg=#c0c0ff guifg=#4040ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=238 gui=NONE guibg=#f8f8f8 guifg=#404048
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=204 ctermfg=231 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=225 ctermfg=197 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#d87000
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=57 gui=bold guibg=#ececf0 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=225 ctermfg=197 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi IncSearch term=reverse cterm=underline ctermbg=87 ctermfg=59 gui=underline guibg=#40ffff guifg=#404054
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=59 gui=NONE guibg=#ffffa0 guifg=#404054
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=129 gui=NONE guibg=bg guifg=#a800ff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=27 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#a0a0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=45 ctermfg=21 gui=NONE guibg=#00e0ff guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=59 ctermfg=231 gui=bold guibg=#404054 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=250 gui=NONE guibg=#404054 guifg=#b8b8c0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#404054 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=195 ctermfg=23 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#dddde8 guifg=#404060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=225 ctermfg=197 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=38 ctermfg=231 gui=bold guibg=#00aacc guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=189 ctermfg=93 gui=NONE guibg=#e0d8ff guifg=#7820ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=199 gui=NONE guibg=bg guifg=#ff00c0
    CSAHi Constant term=underline cterm=NONE ctermbg=189 ctermfg=21 gui=NONE guibg=#e8e8ff guifg=#2020ff
    CSAHi Special term=bold cterm=NONE ctermbg=195 ctermfg=23 gui=NONE guibg=#ccf7ee guifg=#005858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=165 gui=NONE guibg=bg guifg=#c800ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#008858
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#7040ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=135 gui=NONE guibg=#f0f0f4 guifg=#aa60ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=189 ctermfg=63 gui=NONE guibg=#e0e0ff guifg=#5050ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=194 ctermfg=63 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=147 ctermfg=63 gui=NONE guibg=#c0c0ff guifg=#4040ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=17 gui=NONE guibg=#f8f8f8 guifg=#404048
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=19 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=75 ctermfg=65 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#d87000
    CSAHi NonText term=bold cterm=bold ctermbg=87 ctermfg=19 gui=bold guibg=#ececf0 guifg=#4000ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=75 ctermfg=65 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi IncSearch term=reverse cterm=underline ctermbg=31 ctermfg=17 gui=underline guibg=#40ffff guifg=#404054
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=17 gui=NONE guibg=#ffffa0 guifg=#404054
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=35 gui=NONE guibg=bg guifg=#a800ff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#0070ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#a0a0b0
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=17 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=27 ctermfg=19 gui=NONE guibg=#00e0ff guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#008050
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=17 ctermfg=79 gui=bold guibg=#404054 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=17 ctermfg=85 gui=NONE guibg=#404054 guifg=#b8b8c0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#404054 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=63 ctermfg=17 gui=NONE guibg=#c8f0f8 guifg=#004060
    CSAHi Visual term=reverse cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=#dddde8 guifg=#404060
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=75 ctermfg=65 gui=NONE guibg=#ffe0f4 guifg=#ff0070
    CSAHi WildMenu term=NONE cterm=bold ctermbg=22 ctermfg=79 gui=bold guibg=#00aacc guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=35 gui=NONE guibg=#e0d8ff guifg=#7820ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#ff00c0
    CSAHi Constant term=underline cterm=NONE ctermbg=79 ctermfg=19 gui=NONE guibg=#e8e8ff guifg=#2020ff
    CSAHi Special term=bold cterm=NONE ctermbg=63 ctermfg=21 gui=NONE guibg=#ccf7ee guifg=#005858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#c800ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#008858
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0070e6
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=35 gui=NONE guibg=bg guifg=#7040ff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=79 ctermfg=39 gui=NONE guibg=#f0f0f4 guifg=#aa60ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=39 gui=NONE guibg=#e0e0ff guifg=#5050ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=63 ctermfg=19 gui=NONE guibg=#c8f2ea guifg=#4040ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=59 ctermfg=19 gui=NONE guibg=#c0c0ff guifg=#4040ff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
