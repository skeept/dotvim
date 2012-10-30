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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=238 gui=NONE guibg=#f8f8f8 guifg=#404040
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=238 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=205 ctermfg=231 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=underline ctermbg=225 ctermfg=198 gui=underline guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#4040ff
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=38 gui=bold guibg=#ececec guifg=#00a0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=224 ctermfg=196 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=underline ctermbg=87 ctermfg=238 gui=underline guibg=#40ffff guifg=#404040
    CSAHi Search term=reverse cterm=NONE ctermbg=228 ctermfg=238 gui=NONE guibg=#ffff60 guifg=#404040
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#009070
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=205 gui=NONE guibg=bg guifg=#ff4080
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=248 gui=NONE guibg=bg guifg=#acacac
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
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=206 gui=NONE guibg=bg guifg=#f030d0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=238 ctermfg=231 gui=bold guibg=#404040 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=248 gui=NONE guibg=#404040 guifg=#a4a4a4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=195 ctermfg=31 gui=NONE guibg=#c0e8ff guifg=#0050a0
    CSAHi Visual term=reverse cterm=NONE ctermbg=254 ctermfg=238 gui=NONE guibg=#e0e0e0 guifg=#484848
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=224 ctermfg=196 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=bold ctermbg=205 ctermfg=231 gui=bold guibg=#ff4080 guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=194 ctermfg=66 gui=NONE guibg=#b8e8dc guifg=#20605c
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=205 gui=NONE guibg=bg guifg=#ff4080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=129 gui=NONE guibg=bg guifg=#8016ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=70 gui=NONE guibg=bg guifg=#4a9400
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#008888
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=206 gui=NONE guibg=bg guifg=#f030d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#e06800
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#0070e6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=73 gui=NONE guibg=#f0f0f0 guifg=#40a098
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=225 ctermfg=63 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=194 ctermfg=71 gui=NONE guibg=#d0f0d0 guifg=#408040
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=225 ctermfg=63 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=224 ctermfg=167 gui=NONE guibg=#ffd8d8 guifg=#e04040
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=238 gui=NONE guibg=#f8f8f8 guifg=#404040
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=238 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=211 ctermfg=255 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=underline ctermbg=231 ctermfg=199 gui=underline guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=#4040ff
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=45 gui=bold guibg=#ececec guifg=#00a0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=underline ctermbg=123 ctermfg=238 gui=underline guibg=#40ffff guifg=#404040
    CSAHi Search term=reverse cterm=NONE ctermbg=228 ctermfg=238 gui=NONE guibg=#ffff60 guifg=#404040
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#009070
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=211 gui=NONE guibg=bg guifg=#ff4080
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#acacac
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
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=207 gui=NONE guibg=bg guifg=#f030d0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=238 ctermfg=255 gui=bold guibg=#404040 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=248 gui=NONE guibg=#404040 guifg=#a4a4a4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=255 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=231 ctermfg=32 gui=NONE guibg=#c0e8ff guifg=#0050a0
    CSAHi Visual term=reverse cterm=NONE ctermbg=254 ctermfg=238 gui=NONE guibg=#e0e0e0 guifg=#484848
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=bold ctermbg=211 ctermfg=255 gui=bold guibg=#ff4080 guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=195 ctermfg=66 gui=NONE guibg=#b8e8dc guifg=#20605c
    CSAHi lCursor term=NONE cterm=NONE ctermbg=129 ctermfg=255 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=211 gui=NONE guibg=bg guifg=#ff4080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=135 gui=NONE guibg=bg guifg=#8016ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=106 gui=NONE guibg=bg guifg=#4a9400
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#008888
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=207 gui=NONE guibg=bg guifg=#f030d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#e06800
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#0070e6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=116 gui=NONE guibg=#f0f0f0 guifg=#40a098
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=105 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=108 gui=NONE guibg=#d0f0d0 guifg=#408040
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=105 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=231 ctermfg=210 gui=NONE guibg=#ffd8d8 guifg=#e04040
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=238 gui=NONE guibg=#f8f8f8 guifg=#404040
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=238 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=204 ctermfg=231 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=underline ctermbg=225 ctermfg=197 gui=underline guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#4040ff
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=37 gui=bold guibg=#ececec guifg=#00a0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=224 ctermfg=196 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=underline ctermbg=87 ctermfg=238 gui=underline guibg=#40ffff guifg=#404040
    CSAHi Search term=reverse cterm=NONE ctermbg=227 ctermfg=238 gui=NONE guibg=#ffff60 guifg=#404040
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#009070
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=204 gui=NONE guibg=bg guifg=#ff4080
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#acacac
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
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=206 gui=NONE guibg=bg guifg=#f030d0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=238 ctermfg=231 gui=bold guibg=#404040 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=248 gui=NONE guibg=#404040 guifg=#a4a4a4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=153 ctermfg=25 gui=NONE guibg=#c0e8ff guifg=#0050a0
    CSAHi Visual term=reverse cterm=NONE ctermbg=254 ctermfg=238 gui=NONE guibg=#e0e0e0 guifg=#484848
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=224 ctermfg=196 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=bold ctermbg=204 ctermfg=231 gui=bold guibg=#ff4080 guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=152 ctermfg=23 gui=NONE guibg=#b8e8dc guifg=#20605c
    CSAHi lCursor term=NONE cterm=NONE ctermbg=93 ctermfg=231 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=204 gui=NONE guibg=bg guifg=#ff4080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=93 gui=NONE guibg=bg guifg=#8016ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#4a9400
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#008888
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=206 gui=NONE guibg=bg guifg=#f030d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#e06800
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#0070e6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=72 gui=NONE guibg=#f0f0f0 guifg=#40a098
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=225 ctermfg=63 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=194 ctermfg=65 gui=NONE guibg=#d0f0d0 guifg=#408040
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=225 ctermfg=63 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=224 ctermfg=167 gui=NONE guibg=#ffd8d8 guifg=#e04040
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=#f8f8f8 guifg=#404040
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=80 gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#ff4080 guifg=#ffffff
    CSAHi Todo term=NONE cterm=underline ctermbg=75 ctermfg=65 gui=underline guibg=#ffe0f4 guifg=#ff0070
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#4040ff
    CSAHi NonText term=bold cterm=bold ctermbg=87 ctermfg=22 gui=bold guibg=#ececec guifg=#00a0c0
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0070b8
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=74 ctermfg=64 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi IncSearch term=reverse cterm=underline ctermbg=31 ctermfg=80 gui=underline guibg=#40ffff guifg=#404040
    CSAHi Search term=reverse cterm=NONE ctermbg=77 ctermfg=80 gui=NONE guibg=#ffff60 guifg=#404040
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#009070
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff4080
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#acacac
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=27 ctermfg=19 gui=NONE guibg=#00e0ff guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#f030d0
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=80 ctermfg=79 gui=bold guibg=#404040 guifg=#f8f8f8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=84 gui=NONE guibg=#404040 guifg=#a4a4a4
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#404040 guifg=#f8f8f8
    CSAHi Title term=bold cterm=NONE ctermbg=63 ctermfg=21 gui=NONE guibg=#c0e8ff guifg=#0050a0
    CSAHi Visual term=reverse cterm=NONE ctermbg=87 ctermfg=81 gui=NONE guibg=#e0e0e0 guifg=#484848
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=74 ctermfg=64 gui=NONE guibg=#ffe4e4 guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#ff4080 guifg=#f8f8f8
    CSAHi Folded term=NONE cterm=NONE ctermbg=62 ctermfg=21 gui=NONE guibg=#b8e8dc guifg=#20605c
    CSAHi lCursor term=NONE cterm=NONE ctermbg=35 ctermfg=79 gui=NONE guibg=#8000ff guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#ff4080
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=35 gui=NONE guibg=bg guifg=#8016ff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#4a9400
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#008888
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=66 gui=NONE guibg=bg guifg=#f030d0
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#e06800
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0070e6
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=#f0f0f0 guifg=#40a098
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=75 ctermfg=39 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=62 ctermfg=20 gui=NONE guibg=#d0f0d0 guifg=#408040
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=75 ctermfg=39 gui=NONE guibg=#ffd0ff guifg=#4848ff
    CSAHi DiffText term=reverse cterm=NONE ctermbg=74 ctermfg=48 gui=NONE guibg=#ffd8d8 guifg=#e04040
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
