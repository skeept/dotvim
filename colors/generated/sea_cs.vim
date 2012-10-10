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
    CSAHi Normal term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#343478 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=231 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#303080
    CSAHi Error term=reverse cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=212 gui=bold,underline guibg=bg guifg=#ff70e0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=117 gui=bold guibg=bg guifg=#60c0ff
    CSAHi NonText term=bold cterm=bold ctermbg=60 ctermfg=147 gui=bold guibg=#2c2c78 guifg=#8080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=171 ctermfg=231 gui=bold,underline guibg=#c030ff guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=135 ctermfg=225 gui=bold guibg=#b020ff guifg=#f0e0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=105 ctermfg=51 gui=bold guibg=#6060ff guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=105 gui=NONE guibg=bg guifg=#7070e8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=173 ctermfg=231 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=50 gui=bold guibg=bg guifg=#00f0d0
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#d0d0e0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=103 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=103 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=105 ctermfg=231 gui=NONE guibg=#6060ff guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=219 ctermfg=16 gui=NONE guibg=#ff90ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=37 ctermfg=231 gui=NONE guibg=#0080a0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#b0b0c8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#60ffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=222 gui=NONE guibg=bg guifg=#ffd858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#c0c0ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#f0f060
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffb0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=85 gui=NONE guibg=bg guifg=#40ff80
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=61 ctermfg=147 gui=NONE guibg=#3c3c88 guifg=#9090ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffText term=reverse cterm=underline ctermbg=16 ctermfg=226 gui=underline guibg=#000000 guifg=#ffff00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=61 ctermfg=255 gui=NONE guibg=#343478 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=255 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=61 gui=NONE guibg=bg guifg=#303080
    CSAHi Error term=reverse cterm=bold ctermbg=200 ctermfg=255 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=219 gui=bold,underline guibg=bg guifg=#ff70e0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=123 gui=bold guibg=bg guifg=#60c0ff
    CSAHi NonText term=bold cterm=bold ctermbg=61 ctermfg=147 gui=bold guibg=#2c2c78 guifg=#8080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=200 ctermfg=255 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=207 ctermfg=255 gui=bold,underline guibg=#c030ff guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=171 ctermfg=231 gui=bold guibg=#b020ff guifg=#f0e0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=105 ctermfg=51 gui=bold guibg=#6060ff guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#7070e8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=225 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=61 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=231 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=61 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=209 ctermfg=255 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=200 ctermfg=255 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=51 gui=bold guibg=bg guifg=#00f0d0
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#d0d0e0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=103 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=103 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=105 ctermfg=255 gui=NONE guibg=#6060ff guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=200 ctermfg=255 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=219 ctermfg=16 gui=NONE guibg=#ff90ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=38 ctermfg=255 gui=NONE guibg=#0080a0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=200 ctermfg=255 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#b0b0c8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#60ffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#ffd858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#c0c0ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#f0f060
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#ffb0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#40ff80
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=61 ctermfg=147 gui=NONE guibg=#3c3c88 guifg=#9090ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=255 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffText term=reverse cterm=underline ctermbg=16 ctermfg=226 gui=underline guibg=#000000 guifg=#ffff00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=19 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#343478 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=231 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#303080
    CSAHi Error term=reverse cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=206 gui=bold,underline guibg=bg guifg=#ff70e0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=#60c0ff
    CSAHi NonText term=bold cterm=bold ctermbg=18 ctermfg=105 gui=bold guibg=#2c2c78 guifg=#8080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=135 ctermfg=231 gui=bold,underline guibg=#c030ff guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=129 ctermfg=225 gui=bold guibg=#b020ff guifg=#f0e0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=63 ctermfg=51 gui=bold guibg=#6060ff guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=62 gui=NONE guibg=bg guifg=#7070e8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=60 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=254 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=166 ctermfg=231 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=50 gui=bold guibg=bg guifg=#00f0d0
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=#d0d0e0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=60 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=60 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=63 ctermfg=231 gui=NONE guibg=#6060ff guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=199 ctermfg=231 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=213 ctermfg=16 gui=NONE guibg=#ff90ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#0080a0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=163 ctermfg=231 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=51 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=146 gui=NONE guibg=bg guifg=#b0b0c8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#60ffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#ffd858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#c0c0ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#f0f060
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffb0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#40ff80
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=60 ctermfg=105 gui=NONE guibg=#3c3c88 guifg=#9090ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffText term=reverse cterm=underline ctermbg=16 ctermfg=226 gui=underline guibg=#000000 guifg=#ffff00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#343478 guifg=#f0f0f8
    CSAHi Underlined term=underline cterm=bold,underline ctermbg=bg ctermfg=79 gui=bold,underline guibg=bg guifg=#f0f0f8
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=17 gui=NONE guibg=bg guifg=#303080
    CSAHi Error term=reverse cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold,underline ctermbg=bg ctermfg=70 gui=bold,underline guibg=bg guifg=#ff70e0
    CSAHi SpecialKey term=bold cterm=bold ctermbg=bg ctermfg=43 gui=bold guibg=bg guifg=#60c0ff
    CSAHi NonText term=bold cterm=bold ctermbg=17 ctermfg=39 gui=bold guibg=#2c2c78 guifg=#8080ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold,underline ctermbg=51 ctermfg=79 gui=bold,underline guibg=#c030ff guifg=#ffffff
    CSAHi Search term=reverse cterm=bold ctermbg=51 ctermfg=75 gui=bold guibg=#b020ff guifg=#f0e0ff
    CSAHi MoreMsg term=bold cterm=bold ctermbg=39 ctermfg=31 gui=bold guibg=#6060ff guifg=#00ffff
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=27 gui=bold guibg=bg guifg=#00e0ff
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#7070e8
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=75 ctermfg=fg gui=NONE guibg=LightMagenta guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=86 ctermfg=fg gui=underline guibg=LightGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=17 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=87 ctermfg=fg gui=NONE guibg=Grey90 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=52 ctermfg=79 gui=NONE guibg=#d86020 guifg=#ffffff
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=50 ctermfg=79 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=30 gui=bold guibg=bg guifg=#00f0d0
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=58 ctermfg=16 gui=NONE guibg=#d0d0e0 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=58 ctermfg=37 gui=NONE guibg=#d0d0e0 guifg=#606080
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f0f0f8
    CSAHi Visual term=reverse cterm=NONE ctermbg=39 ctermfg=79 gui=NONE guibg=#6060ff guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=65 ctermfg=79 gui=bold guibg=#f000a0 guifg=#ffffff
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=71 ctermfg=16 gui=NONE guibg=#ff90ff guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#0080a0 guifg=#ffffff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=50 ctermfg=79 gui=NONE guibg=#e000b0 guifg=#ffffff
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=31 ctermfg=fg gui=NONE guibg=Cyan guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=58 gui=NONE guibg=bg guifg=#b0b0c8
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#60ffff
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffd858
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#c0c0ff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#f0f060
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#ffb0ff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=29 gui=NONE guibg=bg guifg=#40ff80
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=17 ctermfg=39 gui=NONE guibg=#3c3c88 guifg=#9090ff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#000000 guifg=#60ff60
    CSAHi DiffText term=reverse cterm=underline ctermbg=16 ctermfg=76 gui=underline guibg=#000000 guifg=#ffff00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=Grey guifg=DarkBlue
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
