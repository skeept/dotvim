"▶1 
scriptencoding utf-8
execute frawor#Setup('0.0', {'@%aurum/cache': '2.3',
            \                 '@%aurum/repo': '5.0',
            \              '@%aurum/bufvars': '0.0',
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
buffer_type_hl = [u"aurum_buffer_type", u"line_current_symbol"]
filler_segment = {u"type": u"string", u"width": u"auto", u"highlight_group": u"background", "draw_divider": False}
powerline.add_local_theme("aurum.powerline.is_commit", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"name": u"mode",
                u"module": u"powerline.segments.vim",
                u"priority": 40,
            },
            {
                u"type": u"string",
                u"contents": u"Commit",
                u"highlight_group": buffer_type_hl,
                u"priority": 20,
            },
            {
                u"name": u"branch",
                u"priority": 35,
            },
            filler_segment
        ],
        u"right": [
            {
                u"name": "virtcol_current",
                u"module": u"powerline.segments.vim",
                u"priority": 30,
            },
        ],
    }
})
powerline.add_local_theme("aurum.powerline.is_annotate", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Ann",
                u"highlight_group": buffer_type_hl,
                u"priority": 30,
            },
            {
                u"name": u"annotated_changeset",
                u"priority": 40,
            },
        ],
        u"right": [
        ],
    }
})
powerline.add_local_theme("aurum.powerline.is_status", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Status",
                u"highlight_group": buffer_type_hl,
                u"priority": 30,
            },
            {
                u"name": u"status_changesets",
                u"priority": 40,
            },
        ],
        u"right": [
        ],
    }
})
powerline.add_local_theme("aurum.powerline.is_log", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Log",
                u"highlight_group": buffer_type_hl,
                u"priority": 30,
            },
            {
                u"name": u"repository_root",
                u"priority": 33,
            },
            {
                u"name": u"log_options",
                u"priority": 40,
            },
            filler_segment
        ],
        u"right": [
            {
                u"name": "line_percent",
                u"module": u"powerline.segments.vim",
                u"priority": 37,
                # Keys args, after, width and align must be inherited from the 
                # top theme (currently not implemented)
            },
            {
                u"name": "line_current",
                u"module": u"powerline.segments.vim",
                u"priority": 35,
            },
        ],
    }
})
powerline.add_local_theme("aurum.powerline.is_file", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"File",
                u"highlight_group": buffer_type_hl,
                u"priority": 30,
            },
            {
                u"name": u"repository_root",
                u"priority": 33,
            },
            {
                u"name": u"file_directory",
                u"priority": 40,
            },
            {
                u"name": u"file_name",
                u"priority": 45,
            },
            filler_segment
        ],
        u"right": [
            {
                u"name": "line_percent",
                u"module": u"powerline.segments.vim",
                u"priority": 37,
                # Keys args, after, width and align must be inherited from the 
                # top theme (currently not implemented)
            },
            {
                u"name": "line_current",
                u"module": u"powerline.segments.vim",
                u"priority": 35,
            },
        ],
    }
})
powerline.add_local_theme("aurum.powerline.is_diff", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Diff",
                u"highlight_group": buffer_type_hl,
                u"priority": 30,
            },
            {
                u"name": u"repository_root",
                u"priority": 33,
            },
            {
                u"name": u"diff_files",
                u"priority": 40,
            },
            filler_segment
        ],
        u"right": [
            {
                u"name": u"diff_changesets",
                u"priority": 38,
            },
            {
                u"name": "line_percent",
                u"module": u"powerline.segments.vim",
                u"priority": 37,
                # Keys args, after, width and align must be inherited from the 
                # top theme (currently not implemented)
            },
            {
                u"name": "line_current",
                u"module": u"powerline.segments.vim",
                u"priority": 35,
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
