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
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=255 gui=NONE guibg=#2A2A2A guifg=#efefef
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=139 gui=underline guibg=bg guifg=#ad7fa8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#555753
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=209 ctermfg=231 gui=bold guibg=#ef5939 guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#fce94f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=139 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#8ae234
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=239 gui=bold guibg=#202020 guifg=#535353
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#729fcf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=209 ctermfg=231 gui=reverse guibg=#FFFFFF guifg=#ef5939
    CSAHi Search term=reverse cterm=NONE ctermbg=139 ctermfg=231 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#fce94f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#fce94f
    CSAHi LineNr term=underline cterm=NONE ctermbg=234 ctermfg=239 gui=NONE guibg=#202020 guifg=#535353
    CSAHi cppSTLType term=NONE cterm=bold ctermbg=bg ctermfg=110 gui=bold guibg=bg guifg=#729fcf
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=67 ctermfg=231 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=238 gui=NONE guibg=#444444 guifg=#444444
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=245 gui=reverse guibg=#888888 guifg=#888888
    CSAHi TabLine term=underline cterm=NONE ctermbg=234 ctermfg=247 gui=NONE guibg=#202020 guifg=#A3A3A3
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=234 ctermfg=239 gui=NONE guibg=#202020 guifg=#535353
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#464646 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi FoldeColumn term=NONE cterm=bold ctermbg=234 ctermfg=239 gui=bold guibg=#202020 guifg=#535353
    CSAHi vimFold term=NONE cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=237 ctermfg=231 gui=NONE guibg=#3C3C3C guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=237 ctermfg=244 gui=NONE guibg=#3C3C3C guifg=#808080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=237 ctermfg=237 gui=NONE guibg=#3C3C3C guifg=#3C3C3C
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=67 ctermfg=231 gui=NONE guibg=#3465a4 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=#204a87 guifg=#FFFFFF
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ef5939
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=67 ctermfg=231 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi Folded term=NONE cterm=bold ctermbg=234 ctermfg=239 gui=bold guibg=#202020 guifg=#535353
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=139 ctermfg=231 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ef5939
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#e9b96e
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=110 gui=NONE guibg=bg guifg=#729fcf
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=149 gui=bold guibg=bg guifg=#8ae234
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=137 ctermfg=222 gui=NONE guibg=#a67429 guifg=#ffcc7f
    CSAHi DiffChange term=bold cterm=NONE ctermbg=66 ctermfg=117 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#000000 guifg=#000000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=106 ctermfg=149 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=215 gui=undercurl guibg=bg guifg=fg guisp=#fcaf3e
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=112 gui=undercurl guibg=bg guifg=fg guisp=#73d216
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=139 gui=undercurl guibg=bg guifg=fg guisp=#ad7fa8
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=110 gui=undercurl guibg=bg guifg=fg guisp=#729fcf
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=255 gui=NONE guibg=#2A2A2A guifg=#efefef
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=182 gui=underline guibg=bg guifg=#ad7fa8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#555753
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=209 ctermfg=255 gui=bold guibg=#ef5939 guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#fce94f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=155 gui=NONE guibg=bg guifg=#8ae234
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=102 gui=bold guibg=#202020 guifg=#535353
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#729fcf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=209 ctermfg=255 gui=reverse guibg=#FFFFFF guifg=#ef5939
    CSAHi Search term=reverse cterm=NONE ctermbg=182 ctermfg=255 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#fce94f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#fce94f
    CSAHi LineNr term=underline cterm=NONE ctermbg=234 ctermfg=102 gui=NONE guibg=#202020 guifg=#535353
    CSAHi cppSTLType term=NONE cterm=bold ctermbg=bg ctermfg=153 gui=bold guibg=bg guifg=#729fcf
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=68 ctermfg=255 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=238 gui=NONE guibg=#444444 guifg=#444444
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=245 ctermfg=245 gui=reverse guibg=#888888 guifg=#888888
    CSAHi TabLine term=underline cterm=NONE ctermbg=234 ctermfg=247 gui=NONE guibg=#202020 guifg=#A3A3A3
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=234 ctermfg=102 gui=NONE guibg=#202020 guifg=#535353
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#464646 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi FoldeColumn term=NONE cterm=bold ctermbg=234 ctermfg=102 gui=bold guibg=#202020 guifg=#535353
    CSAHi vimFold term=NONE cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=237 ctermfg=255 gui=NONE guibg=#3C3C3C guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=237 ctermfg=244 gui=NONE guibg=#3C3C3C guifg=#808080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=237 ctermfg=237 gui=NONE guibg=#3C3C3C guifg=#3C3C3C
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=209 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=68 ctermfg=255 gui=NONE guibg=#3465a4 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=67 ctermfg=255 gui=NONE guibg=#204a87 guifg=#FFFFFF
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ef5939
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=68 ctermfg=255 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi Folded term=NONE cterm=bold ctermbg=234 ctermfg=102 gui=bold guibg=#202020 guifg=#535353
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=59 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=182 ctermfg=255 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#ef5939
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#e9b96e
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#729fcf
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=155 gui=bold guibg=bg guifg=#8ae234
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=179 ctermfg=229 gui=NONE guibg=#a67429 guifg=#ffcc7f
    CSAHi DiffChange term=bold cterm=NONE ctermbg=103 ctermfg=153 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#000000 guifg=#000000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=112 ctermfg=155 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=221 gui=undercurl guibg=bg guifg=fg guisp=#fcaf3e
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=155 gui=undercurl guibg=bg guifg=fg guisp=#73d216
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=182 gui=undercurl guibg=bg guifg=fg guisp=#ad7fa8
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=153 gui=undercurl guibg=bg guifg=fg guisp=#729fcf
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=255 gui=NONE guibg=#2A2A2A guifg=#efefef
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=139 gui=underline guibg=bg guifg=#ad7fa8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#555753
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=203 ctermfg=231 gui=bold guibg=#ef5939 guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#fce94f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=139 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#8ae234
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=239 gui=bold guibg=#202020 guifg=#535353
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#729fcf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=203 ctermfg=231 gui=reverse guibg=#FFFFFF guifg=#ef5939
    CSAHi Search term=reverse cterm=NONE ctermbg=139 ctermfg=231 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=#fce94f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=#fce94f
    CSAHi LineNr term=underline cterm=NONE ctermbg=234 ctermfg=239 gui=NONE guibg=#202020 guifg=#535353
    CSAHi cppSTLType term=NONE cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#729fcf
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=250 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=238 ctermfg=238 gui=NONE guibg=#444444 guifg=#444444
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=102 ctermfg=102 gui=reverse guibg=#888888 guifg=#888888
    CSAHi TabLine term=underline cterm=NONE ctermbg=234 ctermfg=247 gui=NONE guibg=#202020 guifg=#A3A3A3
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=234 ctermfg=239 gui=NONE guibg=#202020 guifg=#535353
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=238 ctermfg=fg gui=NONE guibg=#464646 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi FoldeColumn term=NONE cterm=bold ctermbg=234 ctermfg=239 gui=bold guibg=#202020 guifg=#535353
    CSAHi vimFold term=NONE cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=237 ctermfg=231 gui=NONE guibg=#3C3C3C guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=237 ctermfg=244 gui=NONE guibg=#3C3C3C guifg=#808080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=237 ctermfg=237 gui=NONE guibg=#3C3C3C guifg=#3C3C3C
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=#3465a4 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#204a87 guifg=#FFFFFF
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ef5939
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=61 ctermfg=231 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi Folded term=NONE cterm=bold ctermbg=234 ctermfg=239 gui=bold guibg=#202020 guifg=#535353
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=139 ctermfg=231 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ef5939
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#e9b96e
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#729fcf
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=113 gui=bold guibg=bg guifg=#8ae234
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=136 ctermfg=222 gui=NONE guibg=#a67429 guifg=#ffcc7f
    CSAHi DiffChange term=bold cterm=NONE ctermbg=60 ctermfg=111 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#000000 guifg=#000000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=64 ctermfg=113 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=215 gui=undercurl guibg=bg guifg=fg guisp=#fcaf3e
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=76 gui=undercurl guibg=bg guifg=fg guisp=#73d216
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=139 gui=undercurl guibg=bg guifg=fg guisp=#ad7fa8
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=74 gui=undercurl guibg=bg guifg=fg guisp=#729fcf
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=87 gui=NONE guibg=#2A2A2A guifg=#efefef
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=53 gui=underline guibg=bg guifg=#ad7fa8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#555753
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi Todo term=NONE cterm=bold ctermbg=68 ctermfg=79 gui=bold guibg=#ef5939 guifg=#FFFFFF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#fce94f
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#fcaf3e
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#ad7fa8
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#8ae234
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=81 gui=bold guibg=#202020 guifg=#535353
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#729fcf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=68 ctermfg=79 gui=reverse guibg=#FFFFFF guifg=#ef5939
    CSAHi Search term=reverse cterm=NONE ctermbg=53 ctermfg=79 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=#fce94f
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=#fce94f
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=#202020 guifg=#535353
    CSAHi cppSTLType term=NONE cterm=bold ctermbg=bg ctermfg=38 gui=bold guibg=bg guifg=#729fcf
    CSAHi htmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=85 gui=NONE guibg=#000000 guifg=#c0c0c0
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#444444 guifg=#444444
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=83 ctermfg=83 gui=reverse guibg=#888888 guifg=#888888
    CSAHi TabLine term=underline cterm=NONE ctermbg=80 ctermfg=84 gui=NONE guibg=#202020 guifg=#A3A3A3
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=#202020 guifg=#535353
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#464646 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#000000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi FoldeColumn term=NONE cterm=bold ctermbg=80 ctermfg=81 gui=bold guibg=#202020 guifg=#535353
    CSAHi vimFold term=NONE cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#3C3C3C guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=80 ctermfg=83 gui=NONE guibg=#3C3C3C guifg=#808080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#3C3C3C guifg=#3C3C3C
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#ef5939
    CSAHi Visual term=reverse cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#3465a4 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#204a87 guifg=#FFFFFF
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ef5939
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#3465a4 guifg=#ffffff
    CSAHi Folded term=NONE cterm=bold ctermbg=80 ctermfg=81 gui=bold guibg=#202020 guifg=#535353
    CSAHi lCursor term=NONE cterm=NONE ctermbg=87 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=53 ctermfg=79 gui=NONE guibg=#ad7fa8 guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ef5939
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#e9b96e
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#729fcf
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi PreProc term=underline cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#ffffff
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=40 gui=bold guibg=bg guifg=#8ae234
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=36 ctermfg=73 gui=NONE guibg=#a67429 guifg=#ffcc7f
    CSAHi DiffChange term=bold cterm=NONE ctermbg=21 ctermfg=43 gui=NONE guibg=#425c78 guifg=#7fbdff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#000000 guifg=#000000
    CSAHi DiffText term=reverse cterm=NONE ctermbg=36 ctermfg=40 gui=NONE guibg=#4e9a06 guifg=#8ae234
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=72 gui=undercurl guibg=bg guifg=fg guisp=#fcaf3e
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=40 gui=undercurl guibg=bg guifg=fg guisp=#73d216
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=53 gui=undercurl guibg=bg guifg=fg guisp=#ad7fa8
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=38 gui=undercurl guibg=bg guifg=fg guisp=#729fcf
endif

if 1
    delcommand CSAHi
endif
