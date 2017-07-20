execute frawor#Setup('0.0', {'@/mappings': '0.0',
            \                '@/commands': '0.0',})
call s:_f.mapgroup.add('FtGroup', {'test': {'expr': 1, 'lhs': 'a', 'rhs': 'WriteFile("a")'}})
call s:_f.command.add('FtWrite', 'execute "W In buffer ".bufnr("%").":".&ft', {})
autocmd BufNewFile test setlocal ft=test
