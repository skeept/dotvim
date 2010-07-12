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
    CSAHi Normal term=NONE cterm=NONE ctermbg=232 ctermfg=181 gui=NONE guibg=#090909 guifg=#b7af9f
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#378fff
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=234 gui=bold guibg=#211d1a guifg=#211d1a
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=189 ctermfg=93 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi Search term=reverse cterm=NONE ctermbg=189 ctermfg=93 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#7f7f5f
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
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=181 ctermfg=232 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=181 ctermfg=232 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=118 ctermfg=226 gui=NONE guibg=#7fff00 guifg=#ffff00
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=226 gui=underline guibg=bg guifg=#ffff00
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=118 ctermfg=232 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=188 ctermfg=232 gui=bold guibg=#cfcfbf guifg=#070707
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=188 ctermfg=102 gui=bold guibg=#cfcfbf guifg=#5f5f4f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=232 gui=NONE guibg=#cfcfbf guifg=#070707
    CSAHi Title term=bold cterm=NONE ctermbg=52 ctermfg=223 gui=NONE guibg=#370f07 guifg=#ffbf9f
    CSAHi Visual term=reverse cterm=NONE ctermbg=248 ctermfg=59 gui=reverse guibg=#353535 guifg=#a5a5a5
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=209 ctermfg=232 gui=bold guibg=#ff5533 guifg=#070707
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=154 gui=NONE guibg=#1f2700 guifg=#87ff00
    CSAHi lCursor term=NONE cterm=NONE ctermbg=118 ctermfg=232 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=102 gui=bold guibg=bg guifg=#555565
    CSAHi Constant term=underline cterm=NONE ctermbg=233 ctermfg=187 gui=NONE guibg=#151515 guifg=#d1bfb1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=126 gui=NONE guibg=bg guifg=#aa1565
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=187 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=187 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=106 gui=NONE guibg=#0f0f0b guifg=#559f00
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=52 ctermfg=184 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=53 ctermfg=219 gui=NONE guibg=#2f002f guifg=#ff97ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=184 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffText term=reverse cterm=NONE ctermbg=17 ctermfg=45 gui=NONE guibg=#00151f guifg=#07cfef
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=232 ctermfg=188 gui=NONE guibg=#090909 guifg=#b7af9f
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#378fff
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=234 gui=bold guibg=#211d1a guifg=#211d1a
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=129 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi Search term=reverse cterm=NONE ctermbg=231 ctermfg=129 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#7f7f5f
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
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=232 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=232 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=154 ctermfg=226 gui=NONE guibg=#7fff00 guifg=#ffff00
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=226 gui=underline guibg=bg guifg=#ffff00
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=154 ctermfg=232 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=230 ctermfg=232 gui=bold guibg=#cfcfbf guifg=#070707
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=230 ctermfg=102 gui=bold guibg=#cfcfbf guifg=#5f5f4f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=230 ctermfg=232 gui=NONE guibg=#cfcfbf guifg=#070707
    CSAHi Title term=bold cterm=NONE ctermbg=52 ctermfg=224 gui=NONE guibg=#370f07 guifg=#ffbf9f
    CSAHi Visual term=reverse cterm=NONE ctermbg=248 ctermfg=236 gui=reverse guibg=#353535 guifg=#a5a5a5
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=209 ctermfg=232 gui=bold guibg=#ff5533 guifg=#070707
    CSAHi Folded term=NONE cterm=NONE ctermbg=58 ctermfg=154 gui=NONE guibg=#1f2700 guifg=#87ff00
    CSAHi lCursor term=NONE cterm=NONE ctermbg=154 ctermfg=232 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=102 gui=bold guibg=bg guifg=#555565
    CSAHi Constant term=underline cterm=NONE ctermbg=233 ctermfg=224 gui=NONE guibg=#151515 guifg=#d1bfb1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=162 gui=NONE guibg=bg guifg=#aa1565
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=224 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=224 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=112 gui=NONE guibg=#0f0f0b guifg=#559f00
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=52 ctermfg=226 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=53 ctermfg=225 gui=NONE guibg=#2f002f guifg=#ff97ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=226 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffText term=reverse cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#00151f guifg=#07cfef
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=232 ctermfg=145 gui=NONE guibg=#090909 guifg=#b7af9f
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#378fff
    CSAHi NonText term=bold cterm=bold ctermbg=234 ctermfg=234 gui=bold guibg=#211d1a guifg=#211d1a
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=189 ctermfg=93 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi Search term=reverse cterm=NONE ctermbg=189 ctermfg=93 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=#7f7f5f
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
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=232 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=232 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=118 ctermfg=226 gui=NONE guibg=#7fff00 guifg=#ffff00
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=226 gui=underline guibg=bg guifg=#ffff00
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=118 ctermfg=232 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=187 ctermfg=232 gui=bold guibg=#cfcfbf guifg=#070707
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=187 ctermfg=59 gui=bold guibg=#cfcfbf guifg=#5f5f4f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=187 ctermfg=232 gui=NONE guibg=#cfcfbf guifg=#070707
    CSAHi Title term=bold cterm=NONE ctermbg=52 ctermfg=217 gui=NONE guibg=#370f07 guifg=#ffbf9f
    CSAHi Visual term=reverse cterm=NONE ctermbg=248 ctermfg=236 gui=reverse guibg=#353535 guifg=#a5a5a5
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=203 ctermfg=232 gui=bold guibg=#ff5533 guifg=#070707
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=118 gui=NONE guibg=#1f2700 guifg=#87ff00
    CSAHi lCursor term=NONE cterm=NONE ctermbg=118 ctermfg=232 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=59 gui=bold guibg=bg guifg=#555565
    CSAHi Constant term=underline cterm=NONE ctermbg=233 ctermfg=181 gui=NONE guibg=#151515 guifg=#d1bfb1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=125 gui=NONE guibg=bg guifg=#aa1565
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=181 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=181 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=70 gui=NONE guibg=#0f0f0b guifg=#559f00
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=52 ctermfg=184 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=213 gui=NONE guibg=#2f002f guifg=#ff97ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=184 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#00151f guifg=#07cfef
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=57 gui=NONE guibg=#090909 guifg=#b7af9f
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=fg gui=underline guibg=bg guifg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Error term=reverse cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#00ffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#378fff
    CSAHi NonText term=bold cterm=bold ctermbg=80 ctermfg=80 gui=bold guibg=#211d1a guifg=#211d1a
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=59 ctermfg=35 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi Search term=reverse cterm=NONE ctermbg=59 ctermfg=35 gui=NONE guibg=#e0d8ff guifg=#7800ff
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#7f7f5f
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
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=57 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=44 ctermfg=76 gui=NONE guibg=#7fff00 guifg=#ffff00
    CSAHi htmlLink term=NONE cterm=underline ctermbg=bg ctermfg=76 gui=underline guibg=bg guifg=#ffff00
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=44 ctermfg=16 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=58 ctermfg=16 gui=bold guibg=#cfcfbf guifg=#070707
    CSAHi StatusLineNC term=reverse cterm=bold ctermbg=58 ctermfg=81 gui=bold guibg=#cfcfbf guifg=#5f5f4f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#cfcfbf guifg=#070707
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=73 gui=NONE guibg=#370f07 guifg=#ffbf9f
    CSAHi Visual term=reverse cterm=NONE ctermbg=84 ctermfg=80 gui=reverse guibg=#353535 guifg=#a5a5a5
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=bold ctermbg=68 ctermfg=16 gui=bold guibg=#ff5533 guifg=#070707
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=44 gui=NONE guibg=#1f2700 guifg=#87ff00
    CSAHi lCursor term=NONE cterm=NONE ctermbg=44 ctermfg=16 gui=NONE guibg=#7fff00 guifg=#070707
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=bold ctermbg=bg ctermfg=81 gui=bold guibg=bg guifg=#555565
    CSAHi Constant term=underline cterm=NONE ctermbg=16 ctermfg=58 gui=NONE guibg=#151515 guifg=#d1bfb1
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#aa1565
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#aaaaba
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=58 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=58 gui=bold guibg=bg guifg=#d1bfb1
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=36 gui=NONE guibg=#0f0f0b guifg=#559f00
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=56 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=71 gui=NONE guibg=#2f002f guifg=#ff97ff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=56 gui=NONE guibg=#370d15 guifg=#dfdf00
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=27 gui=NONE guibg=#00151f guifg=#07cfef
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
