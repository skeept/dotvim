if exists('b:current_syntax')
    finish
endif

syn region auStatusModified matchgroup=auStatusModifiedStart start=/\m^[\-\^+*]\?M / end=/\v$/ contains=auStatusFile
syn region auStatusAdded    matchgroup=auStatusAddedStart    start=/\m^[\-\^+*]\?A / end=/\v$/ contains=auStatusFile
syn region auStatusRemoved  matchgroup=auStatusRemovedStart  start=/\m^[\-\^+*]\?R / end=/\v$/ contains=auStatusFile
syn region auStatusDeleted  matchgroup=auStatusDeletedStart  start=/\m^[\-\^+*]\?! / end=/\v$/ contains=auStatusFile
syn region auStatusUnknown  matchgroup=auStatusUnknownStart  start=/\m^[\-\^+*]\?? / end=/\v$/ contains=auStatusFile
syn region auStatusIgnored  matchgroup=auStatusIgnoredStart  start=/\m^[\-\^+*]\?I / end=/\v$/ contains=auStatusFile
syn region auStatusClean    matchgroup=auStatusCleanStart    start=/\m^[\-\^+*]\?C / end=/\v$/ contains=auStatusFile

hi def link auStatusModifiedStart  auStatusModified
hi def link auStatusAddedStart     auStatusAdded
hi def link auStatusRemovedStart   auStatusRemoved
hi def link auStatusDeletedStart   auStatusDeleted
hi def link auStatusUnknownStart   auStatusUnknown
hi def link auStatusIgnoredStart   auStatusIgnored
hi def link auStatusCleanStart     auStatusClean

hi def link auStatusModified PreProc
hi def link auStatusAdded    Type
hi def link auStatusRemoved  String
hi def link auStatusDeleted  Underlined
hi def link auStatusUnknown  Identifier
hi def link auStatusIgnored  Comment

let b:current_syntax=expand('<sfile>:t:r')
