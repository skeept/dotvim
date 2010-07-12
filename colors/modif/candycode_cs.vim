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
    CSAHi Normal term=NONE cterm=NONE ctermbg=232 ctermfg=231 gui=NONE guibg=#050505 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#888888
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=208 ctermfg=231 gui=bold guibg=#ee7700 guifg=#ffffff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#ff6050
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=107 gui=NONE guibg=bg guifg=#559933
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=119 gui=bold guibg=bg guifg=#77ff22
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00bbdd
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=221 ctermfg=16 gui=bold guibg=#eedd33 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=137 ctermfg=230 gui=NONE guibg=#937340 guifg=#efefd0
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#39d049
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#eecc18
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=144 gui=NONE guibg=bg guifg=#928c75
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#a6a190 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=25 ctermfg=231 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=240 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=25 ctermfg=231 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#ffff99 guifg=#000000
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#aaccff guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=114 gui=NONE guibg=bg guifg=#66d077
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=187 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=187 ctermfg=238 gui=NONE guibg=#c2bfa5 guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=187 ctermfg=187 gui=NONE guibg=#c2bfa5 guifg=#c2bfa5
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=168 gui=bold guibg=bg guifg=#dd4452
    CSAHi Visual term=reverse cterm=NONE ctermbg=102 ctermfg=231 gui=NONE guibg=#606070 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#ccae22
    CSAHi WildMenu term=NONE cterm=bold ctermbg=25 ctermfg=231 gui=bold guibg=#133293 guifg=#ffffff
    CSAHi Folded term=NONE cterm=underline ctermbg=232 ctermfg=187 gui=underline guibg=#050505 guifg=#c2bfa5
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=232 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=67 ctermfg=fg gui=NONE guibg=#3377aa guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=215 gui=NONE guibg=bg guifg=#ff9922
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff6050
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=145 gui=bold guibg=bg guifg=#9999aa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#eecc44
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=114 gui=bold guibg=bg guifg=#66d077
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=182 gui=NONE guibg=bg guifg=#bb88dd
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=74 gui=bold guibg=bg guifg=#4093cc
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=102 ctermfg=188 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=31 ctermfg=231 gui=NONE guibg=#126493 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=139 ctermfg=16 gui=NONE guibg=#976398 guifg=#000000
    CSAHi DiffDelete term=bold cterm=bold ctermbg=161 ctermfg=16 gui=bold guibg=#be1923 guifg=#000000
    CSAHi DiffText term=reverse cterm=bold ctermbg=139 ctermfg=231 gui=bold guibg=#976398 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=bold ctermbg=102 ctermfg=188 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0011
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=27 gui=undercurl guibg=bg guifg=fg guisp=#0044ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=207 gui=undercurl guibg=bg guifg=fg guisp=#ff22ee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=43 gui=undercurl guibg=bg guifg=fg guisp=#00dd99
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=232 ctermfg=255 gui=NONE guibg=#050505 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#888888
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=214 ctermfg=255 gui=bold guibg=#ee7700 guifg=#ffffff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#ff6050
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#559933
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=155 gui=bold guibg=bg guifg=#77ff22
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#00bbdd
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=255 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=227 ctermfg=16 gui=bold guibg=#eedd33 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=144 ctermfg=231 gui=NONE guibg=#937340 guifg=#efefd0
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=84 gui=NONE guibg=bg guifg=#39d049
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=227 gui=NONE guibg=bg guifg=#eecc18
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=145 gui=NONE guibg=bg guifg=#928c75
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#a6a190 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=25 ctermfg=255 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=25 ctermfg=255 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=230 ctermfg=16 gui=NONE guibg=#ffff99 guifg=#000000
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=195 ctermfg=16 gui=NONE guibg=#aaccff guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=121 gui=NONE guibg=bg guifg=#66d077
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=224 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=224 ctermfg=238 gui=NONE guibg=#c2bfa5 guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=224 ctermfg=224 gui=NONE guibg=#c2bfa5 guifg=#c2bfa5
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#dd4452
    CSAHi Visual term=reverse cterm=NONE ctermbg=103 ctermfg=255 gui=NONE guibg=#606070 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=#ccae22
    CSAHi WildMenu term=NONE cterm=bold ctermbg=25 ctermfg=255 gui=bold guibg=#133293 guifg=#ffffff
    CSAHi Folded term=NONE cterm=underline ctermbg=232 ctermfg=224 gui=underline guibg=#050505 guifg=#c2bfa5
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=232 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=74 ctermfg=fg gui=NONE guibg=#3377aa guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#ff9922
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff6050
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=188 gui=bold guibg=bg guifg=#9999aa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=228 gui=NONE guibg=bg guifg=#eecc44
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=121 gui=bold guibg=bg guifg=#66d077
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=183 gui=NONE guibg=bg guifg=#bb88dd
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#4093cc
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=144 ctermfg=224 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=31 ctermfg=255 gui=NONE guibg=#126493 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=176 ctermfg=16 gui=NONE guibg=#976398 guifg=#000000
    CSAHi DiffDelete term=bold cterm=bold ctermbg=167 ctermfg=16 gui=bold guibg=#be1923 guifg=#000000
    CSAHi DiffText term=reverse cterm=bold ctermbg=176 ctermfg=255 gui=bold guibg=#976398 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=bold ctermbg=144 ctermfg=224 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0011
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=33 gui=undercurl guibg=bg guifg=fg guisp=#0044ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=207 gui=undercurl guibg=bg guifg=fg guisp=#ff22ee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=50 gui=undercurl guibg=bg guifg=fg guisp=#00dd99
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=232 ctermfg=231 gui=NONE guibg=#050505 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#888888
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=208 ctermfg=231 gui=bold guibg=#ee7700 guifg=#ffffff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=203 gui=bold guibg=bg guifg=#ff6050
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#559933
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=118 gui=bold guibg=bg guifg=#77ff22
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#00bbdd
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=221 ctermfg=16 gui=bold guibg=#eedd33 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=95 ctermfg=230 gui=NONE guibg=#937340 guifg=#efefd0
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=77 gui=NONE guibg=bg guifg=#39d049
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#eecc18
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#928c75
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=144 ctermfg=16 gui=NONE guibg=#a6a190 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=240 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=252 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=228 ctermfg=16 gui=NONE guibg=#ffff99 guifg=#000000
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=153 ctermfg=16 gui=NONE guibg=#aaccff guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#66d077
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=145 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=238 gui=NONE guibg=#c2bfa5 guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=145 gui=NONE guibg=#c2bfa5 guifg=#c2bfa5
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=167 gui=bold guibg=bg guifg=#dd4452
    CSAHi Visual term=reverse cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#606070 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=178 gui=bold guibg=bg guifg=#ccae22
    CSAHi WildMenu term=NONE cterm=bold ctermbg=24 ctermfg=231 gui=bold guibg=#133293 guifg=#ffffff
    CSAHi Folded term=NONE cterm=underline ctermbg=232 ctermfg=145 gui=underline guibg=#050505 guifg=#c2bfa5
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=232 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=67 ctermfg=fg gui=NONE guibg=#3377aa guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#ff9922
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff6050
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=103 gui=bold guibg=bg guifg=#9999aa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#eecc44
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=78 gui=bold guibg=bg guifg=#66d077
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=140 gui=NONE guibg=bg guifg=#bb88dd
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=68 gui=bold guibg=bg guifg=#4093cc
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=95 ctermfg=181 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=24 ctermfg=231 gui=NONE guibg=#126493 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=96 ctermfg=16 gui=NONE guibg=#976398 guifg=#000000
    CSAHi DiffDelete term=bold cterm=bold ctermbg=124 ctermfg=16 gui=bold guibg=#be1923 guifg=#000000
    CSAHi DiffText term=reverse cterm=bold ctermbg=96 ctermfg=231 gui=bold guibg=#976398 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=bold ctermbg=95 ctermfg=181 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0011
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=27 gui=undercurl guibg=bg guifg=fg guisp=#0044ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff22ee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=42 gui=undercurl guibg=bg guifg=fg guisp=#00dd99
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#050505 guifg=#ffffff
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#888888
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=bold ctermbg=68 ctermfg=79 gui=bold guibg=#ee7700 guifg=#ffffff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#ff6050
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=36 gui=NONE guibg=bg guifg=#559933
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=44 gui=bold guibg=bg guifg=#77ff22
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#00bbdd
    CSAHi ErrorMsg term=NONE cterm=bold ctermbg=64 ctermfg=79 gui=bold guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=bold ctermbg=72 ctermfg=16 gui=bold guibg=#eedd33 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=36 ctermfg=78 gui=NONE guibg=#937340 guifg=#efefd0
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=25 gui=NONE guibg=bg guifg=#39d049
    CSAHi ModeMsg term=bold cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#eecc18
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#928c75
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#a6a190 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#555555 guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#cccccc guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi TabLineSel term=bold cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#133293 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#1b1b1b guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=77 ctermfg=16 gui=NONE guibg=#ffff99 guifg=#000000
    CSAHi CursorIM term=NONE cterm=NONE ctermbg=43 ctermfg=16 gui=NONE guibg=#aaccff guifg=#000000
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#66d077
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=57 ctermfg=16 gui=bold guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=57 ctermfg=80 gui=NONE guibg=#c2bfa5 guifg=#444444
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=57 ctermfg=57 gui=NONE guibg=#c2bfa5 guifg=#c2bfa5
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=#dd4452
    CSAHi Visual term=reverse cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=#606070 guifg=#ffffff
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=bold ctermbg=bg ctermfg=56 gui=bold guibg=bg guifg=#ccae22
    CSAHi WildMenu term=NONE cterm=bold ctermbg=17 ctermfg=79 gui=bold guibg=#133293 guifg=#ffffff
    CSAHi Folded term=NONE cterm=underline ctermbg=16 ctermfg=57 gui=underline guibg=#050505 guifg=#c2bfa5
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=21 ctermfg=fg gui=NONE guibg=#3377aa guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ff9922
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff6050
    CSAHi Special term=bold cterm=bold ctermbg=bg ctermfg=84 gui=bold guibg=bg guifg=#9999aa
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=72 gui=NONE guibg=bg guifg=#eecc44
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=41 gui=bold guibg=bg guifg=#66d077
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=54 gui=NONE guibg=bg guifg=#bb88dd
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#4093cc
    CSAHi FoldColumn term=NONE cterm=bold ctermbg=37 ctermfg=58 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#126493 guifg=#ffffff
    CSAHi DiffChange term=bold cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#976398 guifg=#000000
    CSAHi DiffDelete term=bold cterm=bold ctermbg=48 ctermfg=16 gui=bold guibg=#be1923 guifg=#000000
    CSAHi DiffText term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#976398 guifg=#ffffff
    CSAHi SignColumn term=NONE cterm=bold ctermbg=37 ctermfg=58 gui=bold guibg=#786d65 guifg=#c8bcb9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0011
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0044ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff22ee
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=25 gui=undercurl guibg=bg guifg=fg guisp=#00dd99
endif

if 1
    delcommand CSAHi
endif
