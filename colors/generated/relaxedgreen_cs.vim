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
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=248 gui=NONE guibg=#000000 guifg=#aaaaaa
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#33bb33
    CSAHi Error term=reverse,bold cterm=NONE ctermbg=160 ctermfg=16 gui=NONE guibg=#dc0000 guifg=#000000
    CSAHi Todo term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#22bb22
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=136 gui=bold guibg=bg guifg=#b26818
    CSAHi Directory term=underline cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=#000000 guifg=#336633
    CSAHi ErrorMsg term=reverse,bold cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dc0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=65 gui=reverse guibg=#336633 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=71 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Pmenu term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuSel term=bold cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi PmenuSbar term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuThumb term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=reverse guibg=#000000 guifg=#999999
    CSAHi TabLine term=reverse cterm=underline ctermbg=235 ctermfg=71 gui=underline guibg=#222222 guifg=#228822
    CSAHi TabLineSel term=bold cterm=bold ctermbg=71 ctermfg=235 gui=bold guibg=#228822 guifg=#222222
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=65 ctermfg=235 gui=reverse guibg=#222222 guifg=#226622
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=95 ctermfg=fg gui=NONE guibg=#663333 guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#333366 guifg=fg
    CSAHi Cursor term=reverse cterm=NONE ctermbg=108 ctermfg=16 gui=NONE guibg=#559955 guifg=#000000
    CSAHi User1 term=NONE cterm=bold ctermbg=71 ctermfg=196 gui=bold guibg=#228822 guifg=#FF0000
    CSAHi Debug term=bold cterm=NONE ctermbg=16 ctermfg=160 gui=NONE guibg=#000000 guifg=#dc0000
    CSAHi CursorIM term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=71 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=reverse guibg=bg guifg=#336633
    CSAHi Title term=reverse cterm=bold ctermbg=46 ctermfg=16 gui=bold guibg=#00ff00 guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VisualNOS term=reverse,bold cterm=bold,underline ctermbg=71 ctermfg=16 gui=bold,underline guibg=#228822 guifg=#000000
    CSAHi WarningMsg term=reverse cterm=NONE ctermbg=30 ctermfg=16 gui=NONE guibg=#007a7a guifg=#000000
    CSAHi WildMenu term=reverse cterm=NONE ctermbg=34 ctermfg=19 gui=NONE guibg=#00ac00 guifg=#000099
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi lCursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=bold cterm=NONE ctermbg=37 ctermfg=34 gui=NONE guibg=DarkCyan guifg=#009900
    CSAHi Comment term=italic cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00a594
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#0099dd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Identifier term=underline cterm=underline ctermbg=bg ctermfg=34 gui=underline guibg=bg guifg=#008800
    CSAHi Statement term=NONE cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=#ac0000
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#22bb22
    CSAHi Type term=NONE cterm=bold ctermbg=bg ctermfg=108 gui=bold guibg=bg guifg=#559955
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi DiffAdd term=reverse cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#007200 guifg=#000000
    CSAHi DiffChange term=underline cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#006700 guifg=#000000
    CSAHi DiffDelete term=NONE cterm=bold ctermbg=28 ctermfg=16 gui=bold guibg=#007200 guifg=#000000
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=34 gui=bold guibg=#000000 guifg=#00ac00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=77 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi SpellLocal term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=188 gui=NONE guibg=#000000 guifg=#aaaaaa
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#33bb33
    CSAHi Error term=reverse,bold cterm=NONE ctermbg=196 ctermfg=16 gui=NONE guibg=#dc0000 guifg=#000000
    CSAHi Todo term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#22bb22
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=173 gui=bold guibg=bg guifg=#b26818
    CSAHi Directory term=underline cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=#000000 guifg=#336633
    CSAHi ErrorMsg term=reverse,bold cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#dc0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=65 gui=reverse guibg=#336633 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=71 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Pmenu term=reverse cterm=NONE ctermbg=71 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuSel term=bold cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi PmenuSbar term=reverse cterm=NONE ctermbg=71 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuThumb term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=#000000 guifg=#999999
    CSAHi TabLine term=reverse cterm=underline ctermbg=235 ctermfg=71 gui=underline guibg=#222222 guifg=#228822
    CSAHi TabLineSel term=bold cterm=bold ctermbg=71 ctermfg=235 gui=bold guibg=#228822 guifg=#222222
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=65 ctermfg=235 gui=reverse guibg=#222222 guifg=#226622
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=95 ctermfg=fg gui=NONE guibg=#663333 guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#333366 guifg=fg
    CSAHi Cursor term=reverse cterm=NONE ctermbg=114 ctermfg=16 gui=NONE guibg=#559955 guifg=#000000
    CSAHi User1 term=NONE cterm=bold ctermbg=71 ctermfg=196 gui=bold guibg=#228822 guifg=#FF0000
    CSAHi Debug term=bold cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=#000000 guifg=#dc0000
    CSAHi CursorIM term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=71 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=reverse guibg=bg guifg=#336633
    CSAHi Title term=reverse cterm=bold ctermbg=46 ctermfg=16 gui=bold guibg=#00ff00 guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VisualNOS term=reverse,bold cterm=bold,underline ctermbg=71 ctermfg=16 gui=bold,underline guibg=#228822 guifg=#000000
    CSAHi WarningMsg term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#007a7a guifg=#000000
    CSAHi WildMenu term=reverse cterm=NONE ctermbg=40 ctermfg=20 gui=NONE guibg=#00ac00 guifg=#000099
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=bold cterm=NONE ctermbg=37 ctermfg=40 gui=NONE guibg=DarkCyan guifg=#009900
    CSAHi Comment term=italic cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#00a594
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#0099dd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Identifier term=underline cterm=underline ctermbg=bg ctermfg=34 gui=underline guibg=bg guifg=#008800
    CSAHi Statement term=NONE cterm=bold ctermbg=bg ctermfg=160 gui=bold guibg=bg guifg=#ac0000
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#22bb22
    CSAHi Type term=NONE cterm=bold ctermbg=bg ctermfg=114 gui=bold guibg=bg guifg=#559955
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi DiffAdd term=reverse cterm=NONE ctermbg=34 ctermfg=16 gui=NONE guibg=#007200 guifg=#000000
    CSAHi DiffChange term=underline cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#006700 guifg=#000000
    CSAHi DiffDelete term=NONE cterm=bold ctermbg=34 ctermfg=16 gui=bold guibg=#007200 guifg=#000000
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=40 gui=bold guibg=#000000 guifg=#00ac00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi SpellLocal term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=248 gui=NONE guibg=#000000 guifg=#aaaaaa
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#33bb33
    CSAHi Error term=reverse,bold cterm=NONE ctermbg=160 ctermfg=16 gui=NONE guibg=#dc0000 guifg=#000000
    CSAHi Todo term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#22bb22
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=130 gui=bold guibg=bg guifg=#b26818
    CSAHi Directory term=underline cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=#000000 guifg=#336633
    CSAHi ErrorMsg term=reverse,bold cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dc0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=59 gui=reverse guibg=#336633 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Pmenu term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuSel term=bold cterm=NONE ctermbg=246 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi PmenuSbar term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuThumb term=reverse cterm=NONE ctermbg=246 ctermfg=16 gui=reverse guibg=#000000 guifg=#999999
    CSAHi TabLine term=reverse cterm=underline ctermbg=235 ctermfg=28 gui=underline guibg=#222222 guifg=#228822
    CSAHi TabLineSel term=bold cterm=bold ctermbg=28 ctermfg=235 gui=bold guibg=#228822 guifg=#222222
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=22 ctermfg=235 gui=reverse guibg=#222222 guifg=#226622
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#663333 guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#333366 guifg=fg
    CSAHi Cursor term=reverse cterm=NONE ctermbg=65 ctermfg=16 gui=NONE guibg=#559955 guifg=#000000
    CSAHi User1 term=NONE cterm=bold ctermbg=28 ctermfg=196 gui=bold guibg=#228822 guifg=#FF0000
    CSAHi Debug term=bold cterm=NONE ctermbg=16 ctermfg=160 gui=NONE guibg=#000000 guifg=#dc0000
    CSAHi CursorIM term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=reverse guibg=bg guifg=#336633
    CSAHi Title term=reverse cterm=bold ctermbg=46 ctermfg=16 gui=bold guibg=#00ff00 guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VisualNOS term=reverse,bold cterm=bold,underline ctermbg=28 ctermfg=16 gui=bold,underline guibg=#228822 guifg=#000000
    CSAHi WarningMsg term=reverse cterm=NONE ctermbg=30 ctermfg=16 gui=NONE guibg=#007a7a guifg=#000000
    CSAHi WildMenu term=reverse cterm=NONE ctermbg=34 ctermfg=18 gui=NONE guibg=#00ac00 guifg=#000099
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=40 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi lCursor term=NONE cterm=NONE ctermbg=248 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=bold cterm=NONE ctermbg=30 ctermfg=28 gui=NONE guibg=DarkCyan guifg=#009900
    CSAHi Comment term=italic cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#00a594
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=32 gui=NONE guibg=bg guifg=#0099dd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Identifier term=underline cterm=underline ctermbg=bg ctermfg=28 gui=underline guibg=bg guifg=#008800
    CSAHi Statement term=NONE cterm=bold ctermbg=bg ctermfg=124 gui=bold guibg=bg guifg=#ac0000
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#22bb22
    CSAHi Type term=NONE cterm=bold ctermbg=bg ctermfg=65 gui=bold guibg=bg guifg=#559955
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=40 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi DiffAdd term=reverse cterm=NONE ctermbg=22 ctermfg=16 gui=NONE guibg=#007200 guifg=#000000
    CSAHi DiffChange term=underline cterm=NONE ctermbg=22 ctermfg=16 gui=NONE guibg=#006700 guifg=#000000
    CSAHi DiffDelete term=NONE cterm=bold ctermbg=22 ctermfg=16 gui=bold guibg=#007200 guifg=#000000
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=34 gui=bold guibg=#000000 guifg=#00ac00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=40 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=46 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi SpellLocal term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=84 gui=NONE guibg=#000000 guifg=#aaaaaa
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#33bb33
    CSAHi Error term=reverse,bold cterm=NONE ctermbg=48 ctermfg=16 gui=NONE guibg=#dc0000 guifg=#000000
    CSAHi Todo term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#22bb22
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00ff00
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=#b26818
    CSAHi Directory term=underline cterm=NONE ctermbg=16 ctermfg=20 gui=NONE guibg=#000000 guifg=#336633
    CSAHi ErrorMsg term=reverse,bold cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#dc0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=20 gui=reverse guibg=#336633 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Pmenu term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuSel term=bold cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=#999999 guifg=#000000
    CSAHi PmenuSbar term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#337733 guifg=#000000
    CSAHi PmenuThumb term=reverse cterm=NONE ctermbg=84 ctermfg=16 gui=reverse guibg=#000000 guifg=#999999
    CSAHi TabLine term=reverse cterm=underline ctermbg=80 ctermfg=20 gui=underline guibg=#222222 guifg=#228822
    CSAHi TabLineSel term=bold cterm=bold ctermbg=20 ctermfg=80 gui=bold guibg=#228822 guifg=#222222
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=20 ctermfg=80 gui=reverse guibg=#222222 guifg=#226622
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#663333 guifg=fg
    CSAHi CursorLine term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#333366 guifg=fg
    CSAHi Cursor term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#559955 guifg=#000000
    CSAHi User1 term=NONE cterm=bold ctermbg=20 ctermfg=64 gui=bold guibg=#228822 guifg=#FF0000
    CSAHi Debug term=bold cterm=NONE ctermbg=16 ctermfg=48 gui=NONE guibg=#000000 guifg=#dc0000
    CSAHi CursorIM term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=#ff0000
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#228822 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=reverse guibg=bg guifg=#336633
    CSAHi Title term=reverse cterm=bold ctermbg=28 ctermfg=16 gui=bold guibg=#00ff00 guifg=#000000
    CSAHi Visual term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#336633 guifg=#000000
    CSAHi VisualNOS term=reverse,bold cterm=bold,underline ctermbg=20 ctermfg=16 gui=bold,underline guibg=#228822 guifg=#000000
    CSAHi WarningMsg term=reverse cterm=NONE ctermbg=21 ctermfg=16 gui=NONE guibg=#007a7a guifg=#000000
    CSAHi WildMenu term=reverse cterm=NONE ctermbg=20 ctermfg=17 gui=NONE guibg=#00ac00 guifg=#000099
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi lCursor term=NONE cterm=NONE ctermbg=84 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=bold cterm=NONE ctermbg=21 ctermfg=20 gui=NONE guibg=DarkCyan guifg=#009900
    CSAHi Comment term=italic cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#00a594
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#0099dd
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Identifier term=underline cterm=underline ctermbg=bg ctermfg=20 gui=underline guibg=bg guifg=#008800
    CSAHi Statement term=NONE cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=#ac0000
    CSAHi PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=24 gui=NONE guibg=bg guifg=#22bb22
    CSAHi Type term=NONE cterm=bold ctermbg=bg ctermfg=37 gui=bold guibg=bg guifg=#559955
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi DiffAdd term=reverse cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#007200 guifg=#000000
    CSAHi DiffChange term=underline cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#006700 guifg=#000000
    CSAHi DiffDelete term=NONE cterm=bold ctermbg=20 ctermfg=16 gui=bold guibg=#007200 guifg=#000000
    CSAHi DiffText term=bold cterm=bold ctermbg=16 ctermfg=20 gui=bold guibg=#000000 guifg=#00ac00
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=24 gui=NONE guibg=#000000 guifg=#20de20
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=28 gui=undercurl guibg=bg guifg=fg guisp=#00ff00
    CSAHi SpellLocal term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
endif

if 1
    delcommand CSAHi
endif
