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
aurum_buffer_type_hl = [u"aurum_buffer_type", u"line_current_symbol"]
aurum_filler_segment = {u"type": u"string", u"width": u"auto", u"highlight_groups": [u"background"], "draw_divider": False, "draw_soft_divider": False, "draw_hard_divider": False}
def aurum_add_local_theme(name, theme):
    for k in ("left", "right"):
        for seg in theme["segments"][k]:
            try:
                seg.update(highlight_group=seg["highlight_groups"])
            except KeyError:
                pass
    powerline.add_local_theme(name, theme)
aurum_add_local_theme("aurum.powerline.is_commit", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"function": u"powerline.segments.vim.mode",
                u"priority": 40,
            },
            {
                u"type": u"string",
                u"contents": u"Commit",
                u"highlight_groups": aurum_buffer_type_hl,
                u"priority": 20,
            },
            {
                u"function": u"branch",
                u"priority": 35,
            },
            aurum_filler_segment
        ],
        u"right": [
            {
                u"function": "powerline.segments.vim.virtcol_current",
                u"priority": 30,
            },
        ],
    }
})
aurum_add_local_theme("aurum.powerline.is_annotate", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Ann",
                u"highlight_groups": aurum_buffer_type_hl,
                u"priority": 30,
            },
            {
                u"function": u"annotated_changeset",
                u"priority": 40,
            },
        ],
        u"right": [
        ],
    }
})
aurum_add_local_theme("aurum.powerline.is_status", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Status",
                u"highlight_groups": aurum_buffer_type_hl,
                u"priority": 30,
            },
            {
                u"function": u"status_changesets",
                u"priority": 40,
            },
        ],
        u"right": [
        ],
    }
})
aurum_add_local_theme("aurum.powerline.is_log", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Log",
                u"highlight_groups": aurum_buffer_type_hl,
                u"priority": 30,
            },
            {
                u"function": u"repository_root",
                u"priority": 33,
            },
            {
                u"function": u"log_options",
                u"priority": 40,
            },
            aurum_filler_segment
        ],
        u"right": [
            {
                u"function": u"powerline.segments.vim.line_percent",
                u"priority": 37,
                # Keys args, after, width and align must be inherited from the 
                # top theme (currently not implemented)
            },
            {
                u"function": u"powerline.segments.vim.line_current",
                u"priority": 35,
            },
        ],
    }
})
aurum_add_local_theme("aurum.powerline.is_file", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"File",
                u"highlight_groups": aurum_buffer_type_hl,
                u"priority": 30,
            },
            {
                u"function": u"repository_root",
                u"priority": 33,
            },
            {
                u"function": u"file_directory",
                u"priority": 40,
            },
            {
                u"function": u"file_name",
                u"priority": 45,
            },
            aurum_filler_segment
        ],
        u"right": [
            {
                u"function": u"powerline.segments.vim.line_percent",
                u"priority": 37,
                # Keys args, after, width and align must be inherited from the 
                # top theme (currently not implemented)
            },
            {
                u"function": u"powerline.segments.vim.line_current",
                u"priority": 35,
            },
        ],
    }
})
aurum_add_local_theme("aurum.powerline.is_diff", {
    u"default_module": u"aurum.powerline",
    u"segments": {
        u"left": [
            {
                u"type": u"string",
                u"contents": u"Diff",
                u"highlight_groups": aurum_buffer_type_hl,
                u"priority": 30,
            },
            {
                u"function": u"repository_root",
                u"priority": 33,
            },
            {
                u"function": u"diff_files",
                u"priority": 40,
            },
            aurum_filler_segment
        ],
        u"right": [
            {
                u"function": u"diff_changesets",
                u"priority": 38,
            },
            {
                u"function": u"powerline.segments.vim.line_percent",
                u"priority": 37,
                # Keys args, after, width and align must be inherited from the 
                # top theme (currently not implemented)
            },
            {
                u"function": u"powerline.segments.vim.line_current",
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