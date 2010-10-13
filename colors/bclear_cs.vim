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
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=#ffffff guifg=#323232
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=59 gui=underline guibg=bg guifg=#323232
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=251 gui=NONE guibg=bg guifg=#c8c8c8
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#c81414 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#c81414
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=225 ctermfg=16 gui=NONE guibg=#ffcde6 guifg=#000000
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=101 gui=NONE guibg=bg guifg=#78681a
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#a01010 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=214 ctermfg=231 gui=NONE guibg=#ff8000 guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=222 ctermfg=16 gui=NONE guibg=#ffd073 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=70 ctermfg=231 gui=NONE guibg=#3c960f guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#323232
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=38 ctermfg=231 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#323232 guifg=#323232
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=#646464 guifg=#646464
    CSAHi TabLine term=underline cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=#646464 guifg=#646464
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#ffde37 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#323232
    CSAHi Visual term=reverse cterm=NONE ctermbg=38 ctermfg=231 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=38 ctermfg=16 gui=NONE guibg=#1994d1 guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=124 ctermfg=251 gui=NONE guibg=#a01010 guifg=#c8c8c8
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=38 ctermfg=231 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi lCursor term=NONE cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#004364 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=198 ctermfg=231 gui=NONE guibg=#f00078 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#969696
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#1094a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=172 gui=NONE guibg=bg guifg=#dc6816
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=70 gui=NONE guibg=bg guifg=#3c960f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#3b6ac8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#294a8c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=126 gui=NONE guibg=bg guifg=#a00050
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#deffcd guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#dad7ff guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=251 gui=NONE guibg=#ffffff guifg=#c8c8c8
    CSAHi DiffText term=reverse cterm=NONE ctermbg=103 ctermfg=231 gui=NONE guibg=#767396 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=230 ctermfg=196 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#f01818
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=230 ctermfg=44 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#14b9c8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=230 ctermfg=76 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#4cbe13
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=230 ctermfg=16 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#000000
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=255 ctermfg=236 gui=NONE guibg=#ffffff guifg=#323232
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=236 gui=underline guibg=bg guifg=#323232
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=251 gui=NONE guibg=bg guifg=#c8c8c8
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#c81414 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=255 ctermfg=196 gui=NONE guibg=#ffffff guifg=#c81414
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffcde6 guifg=#000000
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=137 gui=NONE guibg=bg guifg=#78681a
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=255 gui=NONE guibg=#a01010 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=214 ctermfg=255 gui=NONE guibg=#ff8000 guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#ffd073 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=76 ctermfg=255 gui=NONE guibg=#3c960f guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=#323232
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=75 ctermfg=255 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=236 ctermfg=236 gui=NONE guibg=#323232 guifg=#323232
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=#646464 guifg=#646464
    CSAHi TabLine term=underline cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=#646464 guifg=#646464
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=227 ctermfg=16 gui=NONE guibg=#ffde37 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=#323232
    CSAHi Visual term=reverse cterm=NONE ctermbg=75 ctermfg=255 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=75 ctermfg=16 gui=NONE guibg=#1994d1 guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=160 ctermfg=251 gui=NONE guibg=#a01010 guifg=#c8c8c8
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=75 ctermfg=255 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi lCursor term=NONE cterm=NONE ctermbg=30 ctermfg=255 gui=NONE guibg=#004364 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=199 ctermfg=255 gui=NONE guibg=#f00078 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#969696
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#1094a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#dc6816
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#3c960f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#3b6ac8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=67 gui=NONE guibg=bg guifg=#294a8c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=162 gui=NONE guibg=bg guifg=#a00050
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#deffcd guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#dad7ff guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=255 ctermfg=251 gui=NONE guibg=#ffffff guifg=#c8c8c8
    CSAHi DiffText term=reverse cterm=NONE ctermbg=146 ctermfg=255 gui=NONE guibg=#767396 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=231 ctermfg=203 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#f01818
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=231 ctermfg=45 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#14b9c8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=231 ctermfg=112 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#4cbe13
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=231 ctermfg=16 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#000000
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=231 ctermfg=236 gui=NONE guibg=#ffffff guifg=#323232
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=236 gui=underline guibg=bg guifg=#323232
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=251 gui=NONE guibg=bg guifg=#c8c8c8
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#c81414 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#c81414
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=#ffcde6 guifg=#000000
    CSAHi NonText term=bold cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=94 gui=NONE guibg=bg guifg=#78681a
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=124 ctermfg=231 gui=NONE guibg=#a01010 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=208 ctermfg=231 gui=NONE guibg=#ff8000 guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#ffd073 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=64 ctermfg=231 gui=NONE guibg=#3c960f guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=#323232
    CSAHi LineNr term=underline cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=32 ctermfg=231 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=236 ctermfg=236 gui=NONE guibg=#323232 guifg=#323232
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=#646464 guifg=#646464
    CSAHi TabLine term=underline cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=241 ctermfg=241 gui=NONE guibg=#646464 guifg=#646464
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=195 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#ffde37 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=255 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=236 gui=NONE guibg=bg guifg=#323232
    CSAHi Visual term=reverse cterm=NONE ctermbg=32 ctermfg=231 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=32 ctermfg=16 gui=NONE guibg=#1994d1 guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=124 ctermfg=251 gui=NONE guibg=#a01010 guifg=#c8c8c8
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=32 ctermfg=231 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi lCursor term=NONE cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#004364 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=198 ctermfg=231 gui=NONE guibg=#f00078 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=246 gui=NONE guibg=bg guifg=#969696
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#1094a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=166 gui=NONE guibg=bg guifg=#dc6816
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#3c960f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#3b6ac8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#294a8c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=125 gui=NONE guibg=bg guifg=#a00050
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=194 ctermfg=fg gui=NONE guibg=#deffcd guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#dad7ff guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=231 ctermfg=251 gui=NONE guibg=#ffffff guifg=#c8c8c8
    CSAHi DiffText term=reverse cterm=NONE ctermbg=96 ctermfg=231 gui=NONE guibg=#767396 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=255 ctermfg=246 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=229 ctermfg=196 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#f01818
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=229 ctermfg=38 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#14b9c8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=229 ctermfg=70 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#4cbe13
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=229 ctermfg=16 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#000000
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=79 ctermfg=80 gui=NONE guibg=#ffffff guifg=#323232
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=80 gui=underline guibg=bg guifg=#323232
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#c8c8c8
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#c81414 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=79 ctermfg=48 gui=NONE guibg=#ffffff guifg=#c81414
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=74 ctermfg=16 gui=NONE guibg=#ffcde6 guifg=#000000
    CSAHi NonText term=bold cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#78681a
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=32 ctermfg=79 gui=NONE guibg=#a01010 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=68 ctermfg=79 gui=NONE guibg=#ff8000 guifg=#ffffff
    CSAHi Search term=reverse cterm=NONE ctermbg=73 ctermfg=16 gui=NONE guibg=#ffd073 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=20 ctermfg=79 gui=NONE guibg=#3c960f guifg=#ffffff
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#323232
    CSAHi LineNr term=underline cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#323232 guifg=#323232
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=81 ctermfg=81 gui=NONE guibg=#646464 guifg=#646464
    CSAHi TabLine term=underline cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=81 ctermfg=81 gui=NONE guibg=#646464 guifg=#646464
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=63 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=63 ctermfg=fg gui=NONE guibg=#e1f5ff guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi Question term=NONE cterm=NONE ctermbg=72 ctermfg=16 gui=NONE guibg=#ffde37 guifg=#000000
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=80 ctermfg=79 gui=NONE guibg=#323232 guifg=#ffffff
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=81 ctermfg=87 gui=NONE guibg=#646464 guifg=#f0f0f0
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#323232
    CSAHi Visual term=reverse cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=NONE ctermbg=22 ctermfg=16 gui=NONE guibg=#1994d1 guifg=#000000
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=32 ctermfg=58 gui=NONE guibg=#a01010 guifg=#c8c8c8
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=22 ctermfg=79 gui=NONE guibg=#1994d1 guifg=#ffffff
    CSAHi Folded term=NONE cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi lCursor term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#004364 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=65 ctermfg=79 gui=NONE guibg=#f00078 guifg=#ffffff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#969696
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#1094a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=52 gui=NONE guibg=bg guifg=#dc6816
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#3c960f
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#3b6ac8
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#294a8c
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=33 gui=NONE guibg=bg guifg=#a00050
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=62 ctermfg=fg gui=NONE guibg=#deffcd guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#dad7ff guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=79 ctermfg=58 gui=NONE guibg=#ffffff guifg=#c8c8c8
    CSAHi DiffText term=reverse cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=#767396 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=#f0f0f0 guifg=#969696
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=78 ctermfg=64 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#f01818
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=78 ctermfg=26 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#14b9c8
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=78 ctermfg=40 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#4cbe13
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=78 ctermfg=16 gui=undercurl guibg=#fff5c3 guifg=#000000 guisp=#000000
endif

if 1
    delcommand CSAHi
endif
