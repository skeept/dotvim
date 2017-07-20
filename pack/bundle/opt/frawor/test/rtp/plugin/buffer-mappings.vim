execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \          '@buffer-mappings': '0.0',})
nnoremap a :call WriteFile("a-orig")<CR>
call s:_f.mapgroup.add('Global',
            \{
            \   'a': {'rhs': 'WriteFile("a-global")',
            \        'expr':  1,
            \         'lhs': 'a'},
            \}, {'nouser': 1, 'mode': 'n'})
call s:_f.mapgroup.add('Buffers',
            \{
            \   'a': {'rhs': 'WriteFile("a-buf")',
            \        'expr':  1,
            \         'lhs': 'a'},
            \}, {'nouser': 1, 'buffer': 1, 'mode': 'n'})
call s:_f.mapgroup.add('CurBuffer',
            \{
            \   'a': {'rhs': 'WriteFile("a-cur")',
            \        'expr':  1,
            \         'lhs': 'a'},
            \}, {'nouser': 1, 'buffer': 1, 'dontmap': 1, 'mode': 'n'})
call s:_f.mapgroup.add('Manual',
            \{
            \   'a': {'rhs': 'WriteFile("a-manual")',
            \        'expr':  1,
            \         'lhs': 'a'},
            \}, {'nouser': 1, 'dontmap': 1, 'mode': 'n'})

normal a
let buf1=bufnr('%')
new
let buf2=bufnr('%')
W: 2
normal a
W> Manual
call s:_f.mapgroup.map('Manual', buf2)
normal a
W> CurBuffer
call s:_f.mapgroup.map('CurBuffer', buf2)
normal a
W> Manual for 1
call s:_f.mapgroup.map('Manual', buf1)
normal a
W: 1
wincmd p
normal a
W: 2
wincmd p
normal a
W< CurBuffer
call s:_f.mapgroup.unmap('CurBuffer', buf2)
normal a
