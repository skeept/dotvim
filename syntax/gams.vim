" Vim syntax file
" Language:	gams


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case ignore

" A bunch of gams keywords
syn keyword gamsStatement       set sets table tables parameter parameters
syn keyword gamsStatement       model models solve equation equations variable variables
syn keyword gamsStatement       display option alias scalar scalars sum
syn keyword gamsStatement       Acronym positive binary not free integer
syn keyword gamsStatement       yes no put files file
syn keyword gamsStatement       putclose sameas

syntax keyword gamsFunction	ABS abs Abs ASC asc Asc
syntax keyword gamsFunction     abs acos acos asin asinh atan atan2
syntax keyword gamsFunction     atanh ceil ctime cos cosh exp floor log log10
syntax keyword gamsFunction     max min precision round sin sinh sqr sqrt tan tanh smin smax
syntax keyword gamsFunction     time trunc div mod power
syntax keyword gamsFunction     ord card 

syntax keyword gamsConditional  if else eq le lt gt ne and or ge elseif
syntax keyword gamsRepeat 	for loop repeat until while
syntax keyword gamsTodo contained	TODO

"integer number, or floating point number without a dot.
syn match  gamsNumber		"\<\d\+\>"
"floating point number, with dot
syn match  gamsNumber		"\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  gamsNumber		"\.\d\+\>"

"integer number, or floating point number without a dot.
syn match  gamsNumber		"\<\d\+\>"
"floating point number, with dot
syn match  gamsNumber		"\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  gamsNumber		"\.\d\+\>"

" String and Character contstants
syn region  gamsString		  start=+"+  skip=+\\\\\|\\"+  end=+"+ 

syn match   gamsNonText "\$"
syn match   gamsNonText "\.\."

syn match gamsSpecial 		"^\$\<[^ ]\+\>"
syntax match gamsComment       "^\*.*" 
syntax region  gamsComment         start="^\$ontext" end="^\$offtext"
syntax region  gamsComment         start="\!\!" end="$"
syntax region  gamsTitle         start="^\$title" end="$"
syn match   gamsMathsOperator   "-\|=\|[:<>+\*^/\\]\|\<AND\>\|\<OR\>"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gams_syntax_inits")
  if version < 508
    let did_gams_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gamsLabel		Label
  HiLink gamsConditional	Conditional
  HiLink gamsRepeat		Repeat
  HiLink gamsNumber		Number
  HiLink gamsError		Error
  HiLink gamsStatement		Statement
  HiLink gamsString		String
  HiLink gamsSpecial		Special
  HiLink gamsTodo		Todo
  HiLink gamsFunction		Identifier
  HiLink gamsTypeSpecifier 	Type
"  HiLink gamsNonText 		NonText
  HiLink gamsNonText 		SpecialChar
  HiLink gamsTitle 		Title
  HiLink gamsComment		Comment
  hi gamsMathsOperator term=bold cterm=bold gui=bold

  delcommand HiLink
endif

syntax match gamsComment "^\*.*$"
let b:current_syntax = "gams"

" vim: ts=8
