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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#fafafa guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=63 gui=underline guibg=#fafafa guifg=#2222ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=71 ctermfg=231 gui=NONE guibg=#339933 guifg=#ffffff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=231 ctermfg=164 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=164 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi NonText term=bold cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=#ffbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=70 ctermfg=231 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=231 ctermfg=145 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=188 gui=NONE guibg=#fafafa guifg=#cccccc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=188 ctermfg=235 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=63 ctermfg=231 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=188 ctermfg=235 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=63 ctermfg=231 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=248 ctermfg=248 gui=NONE guibg=#aaaaaa guifg=#aaaaaa
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=70 ctermfg=231 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=63 ctermfg=231 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=63 ctermfg=145 gui=NONE guibg=#2222ff guifg=#999999
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=63 ctermfg=63 gui=NONE guibg=#2222ff guifg=#2222ff
    CSAHi Title term=bold cterm=NONE ctermbg=231 ctermfg=105 gui=NONE guibg=#fafafa guifg=#6666ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=188 ctermfg=59 gui=NONE guibg=#cccccc guifg=#333333
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#fafafa guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=70 ctermfg=231 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=#eeeeee guifg=#2222ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=70 gui=NONE guibg=#fafafa guifg=#339900
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=167 gui=NONE guibg=#fafafa guifg=#cc2222
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=164 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Statement term=bold cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Type term=underline cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=231 ctermfg=167 gui=underline guibg=#fafafa guifg=#cc2222
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=145 gui=NONE guibg=#eeeeee guifg=#999999
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=120 ctermfg=16 gui=NONE guibg=#66ff66 guifg=#000000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=226 ctermfg=187 gui=NONE guibg=#ffff00 guifg=#cccc99
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=210 ctermfg=210 gui=NONE guibg=#ff6666 guifg=#ff6666
    CSAHi DiffText term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=77 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=167 gui=undercurl guibg=bg guifg=fg guisp=#cc2222
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=235 gui=NONE guibg=#fafafa guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=255 ctermfg=63 gui=underline guibg=#fafafa guifg=#2222ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=255 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=77 ctermfg=255 gui=NONE guibg=#339933 guifg=#ffffff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=255 ctermfg=201 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=255 ctermfg=201 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=203 ctermfg=255 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=#ffbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=76 ctermfg=255 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=252 gui=NONE guibg=#fafafa guifg=#cccccc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=252 ctermfg=235 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=63 ctermfg=255 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=235 ctermfg=255 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=252 ctermfg=235 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=63 ctermfg=255 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=188 gui=NONE guibg=#aaaaaa guifg=#aaaaaa
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=76 ctermfg=255 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=63 ctermfg=255 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=63 ctermfg=246 gui=NONE guibg=#2222ff guifg=#999999
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=63 ctermfg=63 gui=NONE guibg=#2222ff guifg=#2222ff
    CSAHi Title term=bold cterm=NONE ctermbg=255 ctermfg=105 gui=NONE guibg=#fafafa guifg=#6666ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=236 gui=NONE guibg=#cccccc guifg=#333333
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=#fafafa guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=255 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=#eeeeee guifg=#2222ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=235 ctermfg=255 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=255 ctermfg=76 gui=NONE guibg=#fafafa guifg=#339900
    CSAHi Constant term=underline cterm=NONE ctermbg=255 ctermfg=203 gui=NONE guibg=#fafafa guifg=#cc2222
    CSAHi Special term=bold cterm=NONE ctermbg=255 ctermfg=201 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi Identifier term=underline cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Statement term=bold cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Type term=underline cterm=NONE ctermbg=255 ctermfg=63 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=255 ctermfg=203 gui=underline guibg=#fafafa guifg=#cc2222
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#eeeeee guifg=#999999
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=120 ctermfg=16 gui=NONE guibg=#66ff66 guifg=#000000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=226 ctermfg=230 gui=NONE guibg=#ffff00 guifg=#cccc99
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=210 ctermfg=210 gui=NONE guibg=#ff6666 guifg=#ff6666
    CSAHi DiffText term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=83 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=203 gui=undercurl guibg=bg guifg=fg guisp=#cc2222
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#fafafa guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=231 ctermfg=21 gui=underline guibg=#fafafa guifg=#2222ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=65 ctermfg=231 gui=NONE guibg=#339933 guifg=#ffffff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=231 ctermfg=164 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=164 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi NonText term=bold cterm=NONE ctermbg=231 ctermfg=246 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=#ffbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=64 ctermfg=231 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=231 ctermfg=246 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi LineNr term=underline cterm=NONE ctermbg=231 ctermfg=252 gui=NONE guibg=#fafafa guifg=#cccccc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=252 ctermfg=235 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=252 ctermfg=235 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=248 ctermfg=248 gui=NONE guibg=#aaaaaa guifg=#aaaaaa
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=255 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=64 ctermfg=231 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=21 ctermfg=231 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=21 ctermfg=246 gui=NONE guibg=#2222ff guifg=#999999
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=21 ctermfg=21 gui=NONE guibg=#2222ff guifg=#2222ff
    CSAHi Title term=bold cterm=NONE ctermbg=231 ctermfg=63 gui=NONE guibg=#fafafa guifg=#6666ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=252 ctermfg=236 gui=NONE guibg=#cccccc guifg=#333333
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=231 ctermfg=196 gui=NONE guibg=#fafafa guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=64 ctermfg=231 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=21 gui=NONE guibg=#eeeeee guifg=#2222ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=231 ctermfg=64 gui=NONE guibg=#fafafa guifg=#339900
    CSAHi Constant term=underline cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#fafafa guifg=#cc2222
    CSAHi Special term=bold cterm=NONE ctermbg=231 ctermfg=164 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi Identifier term=underline cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Statement term=bold cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Type term=underline cterm=NONE ctermbg=231 ctermfg=21 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=231 ctermfg=160 gui=underline guibg=#fafafa guifg=#cc2222
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#eeeeee guifg=#999999
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=83 ctermfg=16 gui=NONE guibg=#66ff66 guifg=#000000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=226 ctermfg=186 gui=NONE guibg=#ffff00 guifg=#cccc99
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=203 ctermfg=203 gui=NONE guibg=#ff6666 guifg=#ff6666
    CSAHi DiffText term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=40 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=160 gui=undercurl guibg=bg guifg=fg guisp=#cc2222
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=#fafafa guifg=#222222
    CSAHi Underlined term=underline cterm=underline ctermbg=79 ctermfg=19 gui=underline guibg=#fafafa guifg=#2222ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#339933 guifg=#ffffff
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=79 ctermfg=50 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=79 ctermfg=50 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi NonText term=bold cterm=NONE ctermbg=79 ctermfg=84 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi Directory term=bold cterm=NONE ctermbg=79 ctermfg=19 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff2222 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=72 ctermfg=16 gui=NONE guibg=#ffbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=79 ctermfg=84 gui=NONE guibg=#fafafa guifg=#999999
    CSAHi LineNr term=underline cterm=NONE ctermbg=79 ctermfg=58 gui=NONE guibg=#fafafa guifg=#cccccc
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=#cccccc guifg=#222222
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=84 ctermfg=84 gui=NONE guibg=#aaaaaa guifg=#aaaaaa
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=#eeeeee guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=19 ctermfg=79 gui=NONE guibg=#2222ff guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=19 ctermfg=84 gui=NONE guibg=#2222ff guifg=#999999
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=19 ctermfg=19 gui=NONE guibg=#2222ff guifg=#2222ff
    CSAHi Title term=bold cterm=NONE ctermbg=79 ctermfg=39 gui=NONE guibg=#fafafa guifg=#6666ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=58 ctermfg=80 gui=NONE guibg=#cccccc guifg=#333333
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=79 ctermfg=64 gui=NONE guibg=#fafafa guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#339900 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=87 ctermfg=19 gui=NONE guibg=#eeeeee guifg=#2222ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=79 ctermfg=20 gui=NONE guibg=#fafafa guifg=#339900
    CSAHi Constant term=underline cterm=NONE ctermbg=79 ctermfg=48 gui=NONE guibg=#fafafa guifg=#cc2222
    CSAHi Special term=bold cterm=NONE ctermbg=79 ctermfg=50 gui=NONE guibg=#fafafa guifg=#cc00cc
    CSAHi Identifier term=underline cterm=NONE ctermbg=79 ctermfg=19 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Statement term=bold cterm=NONE ctermbg=79 ctermfg=19 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=79 ctermfg=19 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi Type term=underline cterm=NONE ctermbg=79 ctermfg=19 gui=NONE guibg=#fafafa guifg=#2222ff
    CSAHi SpecialChar term=NONE cterm=underline ctermbg=79 ctermfg=48 gui=underline guibg=#fafafa guifg=#cc2222
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=87 ctermfg=84 gui=NONE guibg=#eeeeee guifg=#999999
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=45 ctermfg=16 gui=NONE guibg=#66ff66 guifg=#000000
    CSAHi DiffChange term=bold cterm=NONE ctermbg=76 ctermfg=57 gui=NONE guibg=#ffff00 guifg=#cccc99
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=69 ctermfg=69 gui=NONE guibg=#ff6666 guifg=#ff6666
    CSAHi DiffText term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff2222
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=24 gui=undercurl guibg=bg guifg=fg guisp=#22cc22
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=48 gui=undercurl guibg=bg guifg=fg guisp=#cc2222
endif

if 1
    delcommand CSAHi
endif
