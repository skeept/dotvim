if exists('b:current_syntax')
    finish
endif

syn match auAnnRevision    /\v^\ *\S+\ / nextgroup=auAnnDescription
syn match auAnnDescription /\v.*%38v/    nextgroup=auAnnDescNameSep contained
syn match auAnnDescNameSep @\V / @       nextgroup=auAnnAuthor      contained
syn match auAnnAuthor      /\v.*$/                                  contained

hi def link auAnnRevision    Special
hi def link auAnnDescNameSep Comment

let b:current_syntax=expand('<sfile>:t:r')
