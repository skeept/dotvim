if exists('b:current_syntax')
    finish
endif

syn match auCommitComment /\v^\#.*/

hi def link auCommitComment Comment

let b:current_syntax=expand('<sfile>:t:r')

