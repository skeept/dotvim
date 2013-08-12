"------------------------------------------------------------------------------
" LithoChromatic - Color Theme for Vim
" Copyright (C) 2013 Göktuğ Kayaalp <goktug.kayaalp@gmail.com>
"
" LithoChromatic is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" LithoChromatic is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied
" warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
" PURPOSE.  See the GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
"------------------------------------------------------------------------------
" Some boilerplate code here.
set background="light"
highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "lithochromatic"

highlight Include ctermfg=22 cterm=bold guifg=#005f00 gui=bold
highlight Type  ctermfg=127 cterm=bold guifg=#af00af gui=bold
highlight Statement ctermfg=127 cterm=bold guifg=#af00af gui=bold
highlight StorageClass ctermfg=127 cterm=bold guifg=#af00af gui=bold
highlight Conditional ctermfg=127 cterm=bold guifg=#af00af gui=bold
highlight Constant ctermfg=160 guifg=#d70000
highlight String ctermfg=22 cterm=bold guifg=#005f00 gui=bold
highlight Special ctermfg=17 cterm=bold guifg=#00005f gui=bold
highlight Comment ctermfg=18 guifg=#000087
highlight Number ctermfg=61 cterm=bold guifg=#5f5faf cterm=bold
highlight Identifier ctermfg=127 cterm=bold guifg=#af00af gui=bold
highlight Ignore ctermbg=255 ctermfg=16 guifg=#000000 guibg=#eeeeee
highlight link  Boolean  Type
highlight link Function Type
highlight link Keyword  Type


highlight Normal  ctermbg=255 ctermfg=16 guifg=#000000 guibg=#eeeeee
highlight Title ctermbg=255 ctermfg=16 guifg=#000000 guibg=#eeeeee cterm=bold,underline gui=bold,underline
highlight ErrorMsg  ctermbg=52 ctermfg=255 guifg=#eeeeee guibg=#5f0000
highlight LineNr  ctermfg=238 ctermbg=144 guifg=#444444 guibg=#afaf87
highlight Pmenu  ctermfg=0 ctermbg=144 guifg=#000000 guibg=#afaf87
highlight PmenuSel  ctermbg=52 ctermfg=144 guibg=#5f0000 guibg=#afaf87
highlight PmenuSbar  ctermfg=52 ctermbg=0 guifg=#5f0000 guibg=#000000
highlight PmenuThumb  ctermfg=52 guifg=#5f0000
highlight ModeMsg  ctermfg=22 guifg=#005f00
highlight Search  ctermbg=NONE ctermfg=NONE cterm=underline,bold
highlight Visual  ctermbg=191 ctermfg=0 guifg=#000000 guibg=#d7ff5f
highlight ColorColumn  ctermbg=250 ctermfg=NONE guibg=#bcbcbc
highlight MatchParen  cterm=underline,bold ctermbg=NONE ctermfg=16 guifg=#000000
highlight NonText ctermfg=250 guifg=#bcbcbc
highlight SpecialKey ctermbg=250 ctermfg=NONE guibg=#bcbcbc
highlight Question ctermfg=22 cterm=bold guifg=#005f00 gui=bold
highlight MoreMsg ctermfg=22 cterm=bold guifg=#005f00 gui=bold
highlight Directory ctermfg=22 cterm=bold guifg=#005f00 gui=bold
highlight WarningMsg ctermbg=52 ctermfg=255 guifg=#eeeeee guibg=#5f0000
highlight CursorLineNr ctermfg=238 ctermbg=144 guifg=#444444 guibg=#afaf87 cterm=underline gui=underline
highlight Folded ctermbg=191 ctermfg=0 guifg=#000000 guibg=#d7ff5f
highlight FoldColumn ctermbg=191 ctermfg=0 guifg=#000000 guibg=#d7ff5f
highlight ExtraWhitespace ctermbg=250 guibg=#bcbcbc
highlight DiffAdd ctermbg=NONE ctermfg=34 guifg=#00af00 guibg=NONE
highlight DiffChange ctermbg=NONE ctermfg=22 guifg=#005f00 guibg=NONE
highlight DiffText ctermbg=NONE ctermfg=160 guifg=#d70000 guibg=NONE cterm=bold,underline, gui=bold,underline
highlight DiffDelete ctermbg=NONE ctermfg=160 guifg=#d70000 guibg=NONE
highlight CursorColumn ctermbg=229 ctermfg=NONE guibg=#ffffaf cterm=NONE guifg=NONE gui=NONE
highlight CursorLine ctermbg=229 ctermfg=NONE guibg=#ffffaf cterm=NONE guifg=NONE gui=NONE
highlight TabLine cterm=underline,bold gui=underline,bold 
highlight VertSplit ctermfg=16 guifg=#000000 ctermbg=16 guibg=#000000
highlight link Structure StorageClass
highlight link Define  Include
highlight link PreCondit  Define
highlight link Label   Statement
highlight link Repeat   Conditional
highlight link Operator  Conditional

"highlight DefinedName
"highlight EnumerationValue
"highlight VisualNOS
"highlight Member
"highlight GlobalVariable
"highlight StatusLine

" Markdown
highlight markdownH1 ctermfg=NONE guifg=NONE cterm=bold,underline
highlight markdownH2 ctermfg=NONE guifg=NONE cterm=bold,underline
highlight markdownH3 ctermfg=NONE guifg=NONE cterm=bold,underline
highlight markdownH4 ctermfg=NONE guifg=NONE cterm=bold,underline
highlight markdownH5 ctermfg=NONE guifg=NONE cterm=bold,underline
highlight markdownH6 ctermfg=NONE guifg=NONE cterm=bold,underline
highlight markdownH7 ctermfg=NONE guifg=NONE cterm=bold,underline
highlight markdownLinkText ctermfg=17 cterm=underline guifg=#00005f
highlight markdownListMarker ctermfg=160 cterm=bold guifg=#d70000 gui=bold
highlight link markdownHeadingRule markdownH1
highlight link markdownItalic String
highlight link markdownBold String
highlight link markdownIdDeclaration markdownLinkText
highlight link markdownUrl markdownLinkText

" Python
highlight link pythonFunction Normal
highlight link pythonExceptions Normal

highlight VimHiAttrib ctermfg=232 guifg=#080808
highlight link VimSet Type
highlight link VimOption Normal
highlight link helpHyperTextJump markdownUrl
highlight link vimVar Normal
highlight link vimHiGroup Normal
