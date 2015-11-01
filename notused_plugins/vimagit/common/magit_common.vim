" Section names
" These are used to beautify the magit buffer and to help for some block
" selection
let g:magit_sections = {
 \ 'info':           'Info',
 \ 'staged':         'Staged changes',
 \ 'unstaged':       'Unstaged changes',
 \ 'commit_start':   'Commit message',
 \ 'commit_end':     'Commit message end',
 \ 'stash':          'Stash list'
 \ }

let g:magit_git_status_code = {
 \ 'M': 'modified', 
 \ 'A': 'added',
 \ 'D': 'deleted',
 \ 'R': 'renamed',
 \ 'C': 'copied',
 \ 'U': 'updated but unmerged',
 \ '?': 'untracked',
 \ '!': 'ignored',
 \ 'E': 'empty',
 \ 'L': 'symlink',
 \ 'N': 'new dir',
 \ 'S': 'submodule',
 \ }

" Regular expressions used to select blocks
let g:magit_file_re  = '^\('
for status_code in values(g:magit_git_status_code)
	let g:magit_file_re .= status_code . '\|'
endfor
let g:magit_file_re .= 'unknown status\): \(.\{-\}\)\%( -> .*\)\?$'

let g:magit_section_re  = '^\('
for section_name in values(g:magit_sections)
	let g:magit_section_re .= section_name . '\|'
endfor
let g:magit_section_re .= 'unknown section\)$'

let g:magit_diff_re  = '^diff --git'
let g:magit_end_diff_re  = '^$'
let g:magit_stash_re = '^stash@{\d\+}:'
let g:magit_hunk_re  = '^@@ -\(\d\+\),\?\(\d*\) +\(\d\+\),\?\(\d*\) @@'
let g:magit_bin_re   = '^Binary files '
let g:magit_eof_re   = '\%$'


