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
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=188 gui=NONE guibg=#151b1d guifg=#babdb6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=250 gui=underline guibg=bg guifg=gray
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=black guifg=red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=224 gui=NONE guibg=black guifg=pink
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#ffaa33
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#2c3032 guifg=#4f5b5d
    CSAHi NonText term=bold cterm=NONE ctermbg=235 ctermfg=102 gui=NONE guibg=#232729 guifg=#4f5b5d
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=black guifg=red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=115 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Search term=reverse cterm=NONE ctermbg=108 ctermfg=59 gui=NONE guibg=#55af66 guifg=#223322
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=108 gui=bold guibg=black guifg=#55af66
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=108 gui=bold guibg=black guifg=#55af66
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=black guifg=#607075
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=black guifg=#88ee99
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=black guifg=#446644
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=black guifg=#88ee99
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#232729 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=115 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Char term=NONE cterm=NONE ctermbg=bg ctermfg=115 gui=NONE guibg=bg guifg=#77dd88
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=115 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=108 gui=bold guibg=black guifg=#55af66
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=black guifg=#88ee99
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=black guifg=#446644
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=157 gui=reverse guibg=#88ee99 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=#000000 guifg=#88ee99
    CSAHi Visual term=reverse cterm=NONE ctermbg=71 ctermfg=115 gui=NONE guibg=#448844 guifg=#77dd88
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=108 gui=bold,underline guibg=black guifg=#55af66
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=115 gui=NONE guibg=black guifg=#77dd88
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=115 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=108 gui=NONE guibg=black guifg=#55af66
    CSAHi lCursor term=NONE cterm=NONE ctermbg=115 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=215 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#656565
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#88ee99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=pink
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8fffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=lightred
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=22 ctermfg=102 gui=NONE guibg=#102010 guifg=#557755
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=65 ctermfg=115 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffChange term=bold cterm=NONE ctermbg=65 ctermfg=115 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#223322 guifg=#223322
    CSAHi DiffText term=reverse cterm=bold ctermbg=71 ctermfg=115 gui=bold guibg=#448844 guifg=#77dd88
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=23 ctermfg=51 gui=NONE guibg=#151b1d guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=23 ctermfg=188 gui=NONE guibg=#151b1d guifg=#babdb6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=250 gui=underline guibg=bg guifg=gray
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=black guifg=red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=black guifg=pink
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#ffaa33
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#2c3032 guifg=#4f5b5d
    CSAHi NonText term=bold cterm=NONE ctermbg=59 ctermfg=102 gui=NONE guibg=#232729 guifg=#4f5b5d
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=255 gui=bold guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=black guifg=red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=157 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Search term=reverse cterm=NONE ctermbg=114 ctermfg=59 gui=NONE guibg=#55af66 guifg=#223322
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=114 gui=bold guibg=black guifg=#55af66
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=114 gui=bold guibg=black guifg=#55af66
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=109 gui=NONE guibg=black guifg=#607075
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=158 gui=NONE guibg=black guifg=#88ee99
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=23 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=black guifg=#446644
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=16 ctermfg=158 gui=NONE guibg=black guifg=#88ee99
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#232729 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=157 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Char term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#77dd88
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=157 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=114 gui=bold guibg=black guifg=#55af66
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=158 gui=NONE guibg=black guifg=#88ee99
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=102 gui=NONE guibg=black guifg=#446644
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=158 gui=reverse guibg=#88ee99 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=158 gui=NONE guibg=#000000 guifg=#88ee99
    CSAHi Visual term=reverse cterm=NONE ctermbg=108 ctermfg=157 gui=NONE guibg=#448844 guifg=#77dd88
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=114 gui=bold,underline guibg=black guifg=#55af66
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=black guifg=#77dd88
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=157 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=114 gui=NONE guibg=black guifg=#55af66
    CSAHi lCursor term=NONE cterm=NONE ctermbg=157 ctermfg=65 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=221 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=158 gui=NONE guibg=bg guifg=#88ee99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=pink
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#8fffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=lightred
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=255 gui=NONE guibg=bg guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=22 ctermfg=108 gui=NONE guibg=#102010 guifg=#557755
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=65 ctermfg=157 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffChange term=bold cterm=NONE ctermbg=65 ctermfg=157 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=59 ctermfg=59 gui=NONE guibg=#223322 guifg=#223322
    CSAHi DiffText term=reverse cterm=bold ctermbg=108 ctermfg=157 gui=bold guibg=#448844 guifg=#77dd88
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=23 ctermfg=51 gui=NONE guibg=#151b1d guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=37 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=145 gui=NONE guibg=#151b1d guifg=#babdb6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=250 gui=underline guibg=bg guifg=gray
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=black guifg=red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=218 gui=NONE guibg=black guifg=pink
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#ffaa33
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=236 ctermfg=59 gui=NONE guibg=#2c3032 guifg=#4f5b5d
    CSAHi NonText term=bold cterm=NONE ctermbg=235 ctermfg=59 gui=NONE guibg=#232729 guifg=#4f5b5d
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=196 gui=NONE guibg=black guifg=red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=114 ctermfg=59 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Search term=reverse cterm=NONE ctermbg=71 ctermfg=22 gui=NONE guibg=#55af66 guifg=#223322
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=black guifg=#55af66
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=black guifg=#55af66
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=60 gui=NONE guibg=black guifg=#607075
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=black guifg=#88ee99
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=black guifg=#446644
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=black guifg=#88ee99
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#232729 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=114 ctermfg=59 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Char term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#77dd88
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=114 ctermfg=59 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=71 gui=bold guibg=black guifg=#55af66
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=black guifg=#88ee99
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=59 gui=NONE guibg=black guifg=#446644
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=120 gui=reverse guibg=#88ee99 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=120 gui=NONE guibg=#000000 guifg=#88ee99
    CSAHi Visual term=reverse cterm=NONE ctermbg=65 ctermfg=114 gui=NONE guibg=#448844 guifg=#77dd88
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=71 gui=bold,underline guibg=black guifg=#55af66
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=114 gui=NONE guibg=black guifg=#77dd88
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=114 ctermfg=59 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=71 gui=NONE guibg=black guifg=#55af66
    CSAHi lCursor term=NONE cterm=NONE ctermbg=114 ctermfg=59 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=215 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#656565
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#88ee99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=218 gui=NONE guibg=bg guifg=pink
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#8fffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=lightred
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=65 gui=NONE guibg=#102010 guifg=#557755
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=59 ctermfg=114 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffChange term=bold cterm=NONE ctermbg=59 ctermfg=114 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=22 ctermfg=22 gui=NONE guibg=#223322 guifg=#223322
    CSAHi DiffText term=reverse cterm=bold ctermbg=65 ctermfg=114 gui=bold guibg=#448844 guifg=#77dd88
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=51 gui=NONE guibg=#151b1d guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=85 gui=NONE guibg=#151b1d guifg=#babdb6
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=85 gui=underline guibg=bg guifg=gray
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=black guifg=red
    CSAHi Todo term=NONE cterm=NONE ctermbg=16 ctermfg=74 gui=NONE guibg=black guifg=pink
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#77dd88
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ffaa33
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=#2c3032 guifg=#4f5b5d
    CSAHi NonText term=bold cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=#232729 guifg=#4f5b5d
    CSAHi Directory term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=white
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=16 ctermfg=64 gui=NONE guibg=black guifg=red
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=41 ctermfg=20 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Search term=reverse cterm=NONE ctermbg=41 ctermfg=80 gui=NONE guibg=#55af66 guifg=#223322
    CSAHi MoreMsg term=bold cterm=bold ctermbg=16 ctermfg=41 gui=bold guibg=black guifg=#55af66
    CSAHi ModeMsg term=bold cterm=bold ctermbg=16 ctermfg=41 gui=bold guibg=black guifg=#55af66
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=black guifg=#607075
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=black guifg=#88ee99
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#202530 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=16 ctermfg=20 gui=NONE guibg=black guifg=#446644
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=black guifg=#88ee99
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#232729 guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#303035 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=41 ctermfg=20 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Char term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#77dd88
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=41 ctermfg=20 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Question term=NONE cterm=bold ctermbg=16 ctermfg=41 gui=bold guibg=black guifg=#55af66
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=black guifg=#88ee99
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=20 gui=NONE guibg=black guifg=#446644
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=45 gui=reverse guibg=#88ee99 guifg=black
    CSAHi Title term=bold cterm=NONE ctermbg=16 ctermfg=45 gui=NONE guibg=#000000 guifg=#88ee99
    CSAHi Visual term=reverse cterm=NONE ctermbg=20 ctermfg=41 gui=NONE guibg=#448844 guifg=#77dd88
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=16 ctermfg=41 gui=bold,underline guibg=black guifg=#55af66
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=16 ctermfg=41 gui=NONE guibg=black guifg=#77dd88
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=41 ctermfg=20 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi Folded term=NONE cterm=NONE ctermbg=16 ctermfg=41 gui=NONE guibg=black guifg=#55af66
    CSAHi lCursor term=NONE cterm=NONE ctermbg=41 ctermfg=20 gui=NONE guibg=#77dd88 guifg=#3a553a
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=68 ctermfg=16 gui=NONE guibg=#ffaa33 guifg=#000000
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#656565
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#88ee99
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=pink
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#8fffff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=lightred
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=white
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#102010 guifg=#557755
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=20 ctermfg=41 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffChange term=bold cterm=NONE ctermbg=20 ctermfg=41 gui=NONE guibg=#3a553a guifg=#77dd88
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=80 ctermfg=80 gui=NONE guibg=#223322 guifg=#223322
    CSAHi DiffText term=reverse cterm=bold ctermbg=20 ctermfg=41 gui=bold guibg=#448844 guifg=#77dd88
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=16 ctermfg=31 gui=NONE guibg=#151b1d guifg=Cyan
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=DarkCyan
endif

if 1
    delcommand CSAHi
endif
