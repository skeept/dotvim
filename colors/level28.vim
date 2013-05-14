" Maintainer:	Marco Sordi (gabriev82@gmail.com)
" Last Change:	January 22 2010

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "level28"


hi CursorLine	guibg=#2d2d2d
hi CursorColumn	guibg=#2d2d2d
hi MatchParen	guifg=#f6f3e8 guibg=#857b6f gui=bold
hi Pmenu		guifg=#f6f3e8 guibg=#444444
hi PmenuSel		guifg=#000000 guibg=#cae682

" General colors
hi Cursor		guifg=#000000 guibg=#fff600 gui=none
hi Normal		guifg=#f6f3e8 guibg=#242424 gui=none
hi NonText		guifg=#808080 guibg=NONE	gui=none
hi LineNr		guifg=#857b6f guibg=#222222 gui=none
hi FoldColumn   guifg=#857b6f guibg=#111111 gui=none
hi StatusLine	guifg=#111111 guibg=#60acca gui=bold
hi StatusLineNC guifg=#aaaaaa guibg=#444444 gui=none
hi VertSplit	guifg=#222222 guibg=#444444 gui=none
hi Folded		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
" hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi Visual		guifg=#333333 guibg=#92d4f9 gui=none
hi SpecialKey	guifg=#808080 guibg=NONE	gui=none
hi Search		guifg=#000000 guibg=#ffaa00 gui=none


" Syntax highlighting
hi Comment		guifg=#99968b gui=italic
hi Todo			guifg=#8f8f8f gui=italic
hi Constant		guifg=#e5786d gui=none
hi String		guifg=#95e454 gui=none
" hi String		guifg=#f4f473 gui=none
hi Identifier	guifg=#cae682 gui=none
hi Function		guifg=#cae682 gui=none
hi Type			guifg=#cae682 gui=none
hi Statement	guifg=#8ac6f2 gui=none
hi Keyword		guifg=#8ac6f2 gui=none
hi PreProc		guifg=#e5786d gui=none
hi Number		guifg=#e5786d gui=none
hi Special		guifg=#e7f6da gui=none
hi Delimiter	guifg=#e5786d gui=none
" hi Delimiter	guifg=#e5786d guibg=#1b1b1b gui=none

hi vimTodo		guifg=#99968b guibg=#111111

" == NERDtree ==
hi treeDir		guifg=#feee00 guibg=NONE gui=none
hi treeUp		guifg=#ffff00 guibg=NONE gui=none

" == Netrw ==
hi netrwDir		guifg=#feee00 guibg=NONE gui=none


" == CSS ==
hi cssIdentifier	guifg=#b4b8e0 gui=none
hi cssClassName		guifg=#f6d584 gui=none
hi cssPseudoClass	guifg=#dea39e gui=none


" == HTML ==
hi htmlTag			guifg=#8ac6f2 gui=none
hi link				htmlTagN	htmlTag
hi link				htmlEndTag	htmlTag
hi link				htmlTagName	htmlTag
hi htmlSpecialTagName guifg=#b4abf3 gui=none

" == Javascript ==
hi javaScriptParens		guifg=#eaf4f6 gui=none
hi link					javaScriptBraces javaScriptParens
hi link					javaScriptNumber Number


" == PHP ==
" hi phpRegion		guibg=#cccccc gui=none
hi phpIdentifier	guifg=#e7f6da gui=none
hi phpVarSelector	guifg=#e7f6da gui=none
hi phpParent		guifg=#eaf4f6 gui=none
hi phpIntVar		guifg=#b4b8e0 gui=none
hi phpDefine		guifg=#8ac6f2 gui=none
" hi phpDefine		guifg=#ffa35b gui=none
hi phpStringDouble	guifg=#f4f473 gui=none
hi phpStringSingle	guifg=#f4f473 gui=none


" == C/C++ ==
" hi cParen			guifg=#ff0000 gui=none
hi cCustomCppFunc  guifg=#e7f6ba gui=none
hi cCustomCppClass guifg=#f4f4a3 gui=none

hi cCustomDefine   guifg=#f6d584 gui=none
