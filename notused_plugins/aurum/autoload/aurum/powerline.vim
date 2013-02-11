"▶1 
scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cache': '2.3',
            \                 '@%aurum/repo': '5.0',
            \             '@%aurum/cmdutils': '4.2',
            \                     '@/python': '1.0',})
python import aurum.powerline
"▶1 plwipe
function s:F.plwipe(key)
    python aurum.powerline.wipe_key(vim.eval('a:key'))
endfunction
call s:_f.addwiper(s:F.plwipe)
augroup AuRemovePowerlineRC
    autocmd! VimLeave * python aurum.repeatedcmd.finish()
augroup END
let s:_augroups+=['AuRemovePowerlineRC']
"▶1 plswitch
augroup AuRemovePowerlineRC
    autocmd! BufEnter * python aurum.powerline.switch()
augroup END
"▶1 Python setup
python << EOF
aurum.powerline.sid     = str(int(vim.eval('s:_sid')))
aurum.powerline.started = True
EOF
"▶1 VimEnter
function s:F.define_local_themes()
python <<EOF
powerline.add_local_theme("aurum.powerline.is_commit", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Commit",
                u"highlight_group": [u"line_current_symbol"],
            },
            {
                u"name": u"branch",
            },
        ],
    }
})
EOF
augroup AuAddPowerlineThemes
    autocmd!
augroup END
augroup! AuAddPowerlineThemes
endfunction

augroup AuAddPowerlineThemes
    autocmd! VimEnter * call s:F.define_local_themes()
augroup END
"▶1 _unload
function s:._unload()
    python reload(aurum.powerline)
endfunction
"▶1
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲
