call ale#Set('ruby_rubocop_options', '')
call ale#Set('ruby_rubocop_auto_correct_all', 0)
call ale#Set('ruby_rubocop_executable', 'rubocop')

function! ale#fixers#rubocop#GetCommand(buffer) abort
    let l:executable = ale#Var(a:buffer, 'ruby_rubocop_executable')
    let l:config = ale#path#FindNearestFile(a:buffer, '.rubocop.yml')
    let l:options = ale#Var(a:buffer, 'ruby_rubocop_options')
    let l:auto_correct_all = ale#Var(a:buffer, 'ruby_rubocop_auto_correct_all')

    return ale#ruby#EscapeExecutable(l:executable, 'rubocop')
    \   . (!empty(l:config) ? ' --config ' . ale#Escape(l:config) : '')
    \   . (!empty(l:options) ? ' ' . l:options : '')
    \   . (l:auto_correct_all ? ' --auto-correct-all' : ' --auto-correct')
    \   . ' --force-exclusion %t'
endfunction

function! ale#fixers#rubocop#Fix(buffer) abort
    return {
    \   'command': ale#fixers#rubocop#GetCommand(a:buffer),
    \   'read_temporary_file': 1,
    \}
endfunction
