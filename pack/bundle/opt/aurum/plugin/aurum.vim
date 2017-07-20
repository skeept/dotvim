"▶1 Setup
scriptencoding utf-8
execute frawor#Setup('2.0', {'@/commands': '0.0',
            \               '@/functions': '0.1',
            \              '@/decorators': '0.0',
            \                '@/mappings': '0.0',
            \            '@/autocommands': '0.0',
            \                    '@aurum': '2.0',})
"▶1 aurum_cache_wipe decorator
function s:F.aurum_cache_wipe(plugdict, fname, wipes)
    call s:_f.require('@%aurum/cache', [2, 4], 1)
    if a:wipes is# 'all'
        return [0, '@@@', {'wipes':s:_r.cache.allkeys, 'wipe':s:_r.cache.wipe},
                    \['call map(copy(@%@.wipes), "@%@.wipe(v:val)")'],
                    \[], 1]
    else
        return [0, '@@@', {'wipes': a:wipes, 'wipe': s:_r.cache.wipe},
                    \['call map(copy(@%@.wipes), "@%@.wipe(v:val)")'],
                    \[], 1]
    endif
endfunction
call s:_f.adddecorator('aurum_cache_wipe', s:F.aurum_cache_wipe)
"XXX AuRecord notes:
function s:F.opts(opts, cmd, ver)
    return extend({'nargs': '*', 'usedictcompsplitfunc': 1, 'complete':
                \{'function': ['@%aurum/'.tolower(a:cmd), a:ver, 'comp']}},
                \a:opts)
endfunction
for [s:cmd, s:ver, s:opts, s:wipe] in [
            \['Annotate',  [0],{},             0                              ],
            \['Branch',    [0],{'bang': 1},    ["branch","changeset"         ]],
            \['Commit',    [0],{},             'all'                          ],
            \['Diff',      [0],{},             0                              ],
            \['File',      [0],{},             0                              ],
            \['Grep',      [0],{},             0                              ],
            \['Hyperlink', [0],{'range': '%'}, 0                              ],
            \['Junk',      [0],{},             [                     "status"]],
            \['Log',       [0],{},             0                              ],
            \['Move',      [0],{'bang': 1},    [                     "status"]],
            \['Name',      [0],{'bang': 1},    ["branch","changeset"         ]],
            \['Other',     [0],{'bang': 1},    'all'                          ],
            \['Record',    [0],{},             0                              ],
            \['Status',    [0],{},             0                              ],
            \['Track',     [0],{},             [                     "status"]],
            \['Update',    [0],{'bang': 1},    ["branch","changeset","status"]],
            \['VimDiff',   [0],{},             0                              ],
            \]
    call s:_f.command.add('Au'.s:cmd,
                \extend({'function': ['@%aurum/'.tolower(s:cmd), s:ver, 'cmd']},
                \       (empty(s:wipe) ? {} : {'@aurum_cache_wipe': s:wipe})),
                \s:F.opts(s:opts, s:cmd, s:ver))
    unlet s:wipe
endfor
unlet s:F.opts
unlet s:cmd s:ver s:opts
"▶1 Global mappings
" TODO mapping that closes status window
call s:_f.mapgroup.add('Aurum', {
            \'Commit':    {'lhs':  'i', 'rhs': ':<C-u>AuCommit<CR>'          },
            \'CommitAll': {'lhs':  'I', 'rhs': ':<C-u>AuCommit all<CR>'      },
            \'Open':      {'lhs':  'o', 'rhs': ':<C-u>AuFile<CR>'            },
            \'OpenAny':   {'lhs':  'O', 'rhs': ':<C-u>AuFile : : prompt<CR>' },
            \'Revert':    {'lhs': 'go', 'rhs': ':<C-u>AuFile : : replace<CR>'},
            \'Vdiff':     {'lhs':  'D', 'rhs': ':<C-u>AuVimDiff<CR>'         },
            \'FVdiff':    {'lhs': 'gD', 'rhs': ':<C-u>AuVimDiff full<CR>'    },
            \'Diff':      {'lhs':  'd', 'rhs': ':<C-u>AuDiff :<CR>'          },
            \'Fdiff':     {'lhs': 'gd', 'rhs': ':<C-u>AuDiff<CR>'            },
            \'Annotate':  {'lhs':  'a', 'rhs': ':<C-u>AuAnnotate<CR>'        },
            \'Status':    {'lhs':  's', 'rhs': ':<C-u>AuStatus|wincmd p<CR>' },
            \'Record':    {'lhs':  'r', 'rhs': ':<C-u>AuRecord<CR>'          },
            \'Log':       {'lhs':  'L', 'rhs': ':<C-u>AuLog<CR>'             },
            \'LogFile':   {'lhs':  'l', 'rhs': ':<C-u>AuLog : files :<CR>'   },
            \'URL':       {'lhs':  'H', 'rhs': ':<C-u>AuHyperlink<CR>'       },
            \'LineURL':   {'lhs':  'h', 'rhs': ':<C-u>AuHyperlink line 0<CR>'},
            \'Track':     {'lhs':  'A', 'rhs': ':<C-u>AuTrack<CR>'           },
            \'Forget':    {'lhs':  'R', 'rhs': ':<C-u>AuJunk forget :<CR>'   },
            \'Push':      {'lhs':  'P', 'rhs': ':<C-u>AuOther push<CR>'      },
            \'Pull':      {'lhs':  'p', 'rhs': ':<C-u>AuOther pull<CR>'      },
        \}, {'mode': 'n', 'silent': 1, 'leader': '<Leader>a'})
call s:_f.mapgroup.add('AurumNP', {
            \'CurRevHex': {'lhs': '<C-r><C-h>', 'rhs': '<C-r>=aurum#currev("hex")<CR>'},
            \'CurRev'   : {'lhs': '<C-r><C-v>', 'rhs': '<C-r>=aurum#currev("rev")<CR>'},
        \}, {'mode': 'ic', 'silent': 0})
"▶1 Autocommands
let s:aurun={'function': ['@%aurum/edit', [1], 'event']}
call s:_f.augroup.add('Aurum',
            \[['BufReadCmd',   'aurum://*', 1, [s:aurun,  0]],
            \ ['FileReadCmd',  'aurum://*', 1, [s:aurun,  1]],
            \ ['SourceCmd',    'aurum://*', 1, [s:aurun,  2]],
            \ ['BufWriteCmd',  'aurum://*', 1, [s:aurun, -1]],
            \ ['FileWriteCmd', 'aurum://*', 1, [s:aurun, -2]],
            \])
"▶1
call frawor#Lockvar(s:, '_r,_f')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
