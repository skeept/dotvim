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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=236 gui=NONE guibg=#FFFFFF guifg=#303030
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=231 gui=NONE guibg=#FFFFFF guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=231 ctermfg=196 gui=bold guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=225 ctermfg=198 gui=NONE guibg=#FFE0F4 guifg=#FF0070
    CSAHi SpecialKey term=bold cterm=bold ctermbg=231 ctermfg=63 gui=bold guibg=#FFFFFF guifg=#2020FF
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=37 gui=bold guibg=#FFFFFF guifg=#009999
    CSAHi Directory term=bold cterm=bold ctermbg=231 ctermfg=31 gui=bold guibg=#FFFFFF guifg=#0A6799
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=bold ctermbg=190 ctermfg=34 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi Search term=reverse cterm=bold ctermbg=190 ctermfg=34 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=195 ctermfg=39 gui=bold guibg=#DBF2FF guifg=#00A0FF
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=236 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=27 ctermfg=231 gui=NONE guibg=#162CF7 guifg=#f8f8f8
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=38 ctermfg=231 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=31 ctermfg=231 gui=bold guibg=#0A6799 guifg=#FFFFFF
    CSAHi VertSplit term=reverse cterm=bold ctermbg=38 ctermfg=231 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=19 gui=bold guibg=#FFFFFF guifg=#0000A0
    CSAHi Visual term=reverse cterm=bold ctermbg=33 ctermfg=231 gui=bold guibg=#1679F9 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=190 ctermfg=34 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=195 ctermfg=38 gui=bold guibg=#DBF2FF guifg=#0E8ED3
    CSAHi lCursor term=NONE cterm=bold ctermbg=27 ctermfg=231 gui=bold guibg=#162CF7 guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=195 ctermfg=38 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Constant term=underline cterm=bold ctermbg=195 ctermfg=39 gui=bold guibg=#DBF2FF guifg=#0384F6
    CSAHi Special term=bold cterm=NONE ctermbg=195 ctermfg=38 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=231 ctermfg=212 gui=bold guibg=#FFFFFF guifg=#F36CE5
    CSAHi PreProc term=underline cterm=bold ctermbg=231 ctermfg=41 gui=bold guibg=#FFFFFF guifg=#0BBF20
    CSAHi Type term=underline cterm=bold ctermbg=231 ctermfg=33 gui=bold guibg=#FFFFFF guifg=#0971F9
    CSAHi Scrollbar term=NONE cterm=bold ctermbg=231 ctermfg=45 gui=bold guibg=#FFFFFF guifg=#00C0FF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=195 ctermfg=38 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=46 ctermfg=34 gui=NONE guibg=#00FF00 guifg=#008000
    CSAHi DiffChange term=bold cterm=bold ctermbg=231 ctermfg=236 gui=bold guibg=#FFFFFF guifg=#303030
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi DiffText term=reverse cterm=bold ctermbg=230 ctermfg=196 gui=bold guibg=#FFEAE0 guifg=#FF0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=236 gui=NONE guibg=#FFFFFF guifg=#303030
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=255 ctermfg=255 gui=NONE guibg=#FFFFFF guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=255 ctermfg=196 gui=bold guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=199 gui=NONE guibg=#FFE0F4 guifg=#FF0070
    CSAHi SpecialKey term=bold cterm=bold ctermbg=255 ctermfg=63 gui=bold guibg=#FFFFFF guifg=#2020FF
    CSAHi NonText term=bold cterm=bold ctermbg=255 ctermfg=44 gui=bold guibg=#FFFFFF guifg=#009999
    CSAHi Directory term=bold cterm=bold ctermbg=255 ctermfg=32 gui=bold guibg=#FFFFFF guifg=#0A6799
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=bold ctermbg=226 ctermfg=34 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi Search term=reverse cterm=bold ctermbg=226 ctermfg=34 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=231 ctermfg=45 gui=bold guibg=#DBF2FF guifg=#00A0FF
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=236 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=63 ctermfg=255 gui=NONE guibg=#162CF7 guifg=#f8f8f8
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=39 ctermfg=255 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=32 ctermfg=255 gui=bold guibg=#0A6799 guifg=#FFFFFF
    CSAHi VertSplit term=reverse cterm=bold ctermbg=39 ctermfg=255 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=255 ctermfg=20 gui=bold guibg=#FFFFFF guifg=#0000A0
    CSAHi Visual term=reverse cterm=bold ctermbg=75 ctermfg=255 gui=bold guibg=#1679F9 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=226 ctermfg=34 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=231 ctermfg=39 gui=bold guibg=#DBF2FF guifg=#0E8ED3
    CSAHi lCursor term=NONE cterm=bold ctermbg=63 ctermfg=255 gui=bold guibg=#162CF7 guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=39 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Constant term=underline cterm=bold ctermbg=231 ctermfg=39 gui=bold guibg=#DBF2FF guifg=#0384F6
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=39 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=255 ctermfg=219 gui=bold guibg=#FFFFFF guifg=#F36CE5
    CSAHi PreProc term=underline cterm=bold ctermbg=255 ctermfg=41 gui=bold guibg=#FFFFFF guifg=#0BBF20
    CSAHi Type term=underline cterm=bold ctermbg=255 ctermfg=39 gui=bold guibg=#FFFFFF guifg=#0971F9
    CSAHi Scrollbar term=NONE cterm=bold ctermbg=255 ctermfg=51 gui=bold guibg=#FFFFFF guifg=#00C0FF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=39 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=46 ctermfg=34 gui=NONE guibg=#00FF00 guifg=#008000
    CSAHi DiffChange term=bold cterm=bold ctermbg=255 ctermfg=236 gui=bold guibg=#FFFFFF guifg=#303030
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi DiffText term=reverse cterm=bold ctermbg=231 ctermfg=196 gui=bold guibg=#FFEAE0 guifg=#FF0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=236 gui=NONE guibg=#FFFFFF guifg=#303030
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=231 ctermfg=231 gui=NONE guibg=#FFFFFF guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=231 ctermfg=196 gui=bold guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=225 ctermfg=197 gui=NONE guibg=#FFE0F4 guifg=#FF0070
    CSAHi SpecialKey term=bold cterm=bold ctermbg=231 ctermfg=21 gui=bold guibg=#FFFFFF guifg=#2020FF
    CSAHi NonText term=bold cterm=bold ctermbg=231 ctermfg=30 gui=bold guibg=#FFFFFF guifg=#009999
    CSAHi Directory term=bold cterm=bold ctermbg=231 ctermfg=24 gui=bold guibg=#FFFFFF guifg=#0A6799
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=bold ctermbg=190 ctermfg=28 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi Search term=reverse cterm=bold ctermbg=190 ctermfg=28 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=195 ctermfg=39 gui=bold guibg=#DBF2FF guifg=#00A0FF
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=236 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=#162CF7 guifg=#f8f8f8
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=32 ctermfg=231 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=24 ctermfg=231 gui=bold guibg=#0A6799 guifg=#FFFFFF
    CSAHi VertSplit term=reverse cterm=bold ctermbg=32 ctermfg=231 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=231 ctermfg=19 gui=bold guibg=#FFFFFF guifg=#0000A0
    CSAHi Visual term=reverse cterm=bold ctermbg=33 ctermfg=231 gui=bold guibg=#1679F9 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=190 ctermfg=28 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=195 ctermfg=32 gui=bold guibg=#DBF2FF guifg=#0E8ED3
    CSAHi lCursor term=NONE cterm=bold ctermbg=21 ctermfg=231 gui=bold guibg=#162CF7 guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=195 ctermfg=32 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Constant term=underline cterm=bold ctermbg=195 ctermfg=33 gui=bold guibg=#DBF2FF guifg=#0384F6
    CSAHi Special term=bold cterm=NONE ctermbg=195 ctermfg=32 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=231 ctermfg=206 gui=bold guibg=#FFFFFF guifg=#F36CE5
    CSAHi PreProc term=underline cterm=bold ctermbg=231 ctermfg=34 gui=bold guibg=#FFFFFF guifg=#0BBF20
    CSAHi Type term=underline cterm=bold ctermbg=231 ctermfg=27 gui=bold guibg=#FFFFFF guifg=#0971F9
    CSAHi Scrollbar term=NONE cterm=bold ctermbg=231 ctermfg=39 gui=bold guibg=#FFFFFF guifg=#00C0FF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=195 ctermfg=32 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=46 ctermfg=28 gui=NONE guibg=#00FF00 guifg=#008000
    CSAHi DiffChange term=bold cterm=bold ctermbg=231 ctermfg=236 gui=bold guibg=#FFFFFF guifg=#303030
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi DiffText term=reverse cterm=bold ctermbg=224 ctermfg=196 gui=bold guibg=#FFEAE0 guifg=#FF0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=#FFFFFF guifg=#303030
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=19 gui=underline guibg=bg guifg=#0000ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=79 ctermfg=79 gui=NONE guibg=#FFFFFF guifg=#f8f8f8
    CSAHi Error term=reverse cterm=bold ctermbg=79 ctermfg=64 gui=bold guibg=#FFFFFF guifg=#FF0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=75 ctermfg=65 gui=NONE guibg=#FFE0F4 guifg=#FF0070
    CSAHi SpecialKey term=bold cterm=bold ctermbg=79 ctermfg=19 gui=bold guibg=#FFFFFF guifg=#2020FF
    CSAHi NonText term=bold cterm=bold ctermbg=79 ctermfg=21 gui=bold guibg=#FFFFFF guifg=#009999
    CSAHi Directory term=bold cterm=bold ctermbg=79 ctermfg=21 gui=bold guibg=#FFFFFF guifg=#0A6799
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=#FF0000 guifg=#FFFFFF
    CSAHi IncSearch term=reverse cterm=bold ctermbg=60 ctermfg=20 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi Search term=reverse cterm=bold ctermbg=60 ctermfg=20 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=bold ctermbg=63 ctermfg=23 gui=bold guibg=#DBF2FF guifg=#00A0FF
    CSAHi htmlBold term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi htmlBoldItalic term=NONE cterm=bold ctermbg=bg ctermfg=fg gui=bold,italic guibg=bg guifg=fg
    CSAHi htmlBoldUnderline term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi htmlBoldUnderlineItalic term=NONE cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,italic,underline guibg=bg guifg=fg
    CSAHi htmlItalic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=italic guibg=bg guifg=fg
    CSAHi htmlUnderline term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi htmlUnderlineItalic term=NONE cterm=underline ctermbg=bg ctermfg=fg gui=italic,underline guibg=bg guifg=fg
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000000 guifg=#FFFFFF
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=19 gui=underline guibg=bg guifg=#0000ff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=#162CF7 guifg=#f8f8f8
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=22 ctermfg=79 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=21 ctermfg=79 gui=bold guibg=#0A6799 guifg=#FFFFFF
    CSAHi VertSplit term=reverse cterm=bold ctermbg=22 ctermfg=79 gui=bold guibg=#0E8ED3 guifg=#FFFFFF
    CSAHi Title term=bold cterm=bold ctermbg=79 ctermfg=17 gui=bold guibg=#FFFFFF guifg=#0000A0
    CSAHi Visual term=reverse cterm=bold ctermbg=23 ctermfg=79 gui=bold guibg=#1679F9 guifg=#FFFFFF
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=60 ctermfg=20 gui=bold guibg=#CCFF00 guifg=#008000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi Folded term=NONE cterm=bold ctermbg=63 ctermfg=22 gui=bold guibg=#DBF2FF guifg=#0E8ED3
    CSAHi lCursor term=NONE cterm=bold ctermbg=19 ctermfg=79 gui=bold guibg=#162CF7 guifg=#f8f8f8
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=63 ctermfg=22 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Constant term=underline cterm=bold ctermbg=63 ctermfg=23 gui=bold guibg=#DBF2FF guifg=#0384F6
    CSAHi Special term=bold cterm=NONE ctermbg=63 ctermfg=22 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi Identifier term=underline cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi Statement term=bold cterm=bold ctermbg=79 ctermfg=70 gui=bold guibg=#FFFFFF guifg=#F36CE5
    CSAHi PreProc term=underline cterm=bold ctermbg=79 ctermfg=24 gui=bold guibg=#FFFFFF guifg=#0BBF20
    CSAHi Type term=underline cterm=bold ctermbg=79 ctermfg=23 gui=bold guibg=#FFFFFF guifg=#0971F9
    CSAHi Scrollbar term=NONE cterm=bold ctermbg=79 ctermfg=27 gui=bold guibg=#FFFFFF guifg=#00C0FF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=63 ctermfg=22 gui=NONE guibg=#DBF2FF guifg=#0E8ED3
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=28 ctermfg=20 gui=NONE guibg=#00FF00 guifg=#008000
    CSAHi DiffChange term=bold cterm=bold ctermbg=79 ctermfg=80 gui=bold guibg=#FFFFFF guifg=#303030
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#FF0000 guifg=#FFFFFF
    CSAHi DiffText term=reverse cterm=bold ctermbg=78 ctermfg=64 gui=bold guibg=#FFEAE0 guifg=#FF0000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
