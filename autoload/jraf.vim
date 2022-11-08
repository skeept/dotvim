" my own functions comming either from common.vim, simple.vim or vimrc
" that can be autoladed

"================== Unite ====================================================={{{
function! jraf#uniteColorSchemeResume()
  if !exists("s:unite_init_colorscheme")
    let s:unite_init_colorscheme = 1
    Unite -buffer-name=colorscheme colorscheme
  else
    UniteResume colorscheme
  endif
endfunction

function! jraf#unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC> <Plug>(unite_exit)
  "inoremap <buffer> jj <Plug>(unite_insert_leave)
  "inoremap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  nmap <buffer> s jp
  nmap <buffer> S kp

  " <C-L>: manual neocomplcache completion.
  inoremap <buffer> <C-;> <C-X><C-U><C-P><Down>

  inoremap <silent><expr><buffer> <C-X> unite#do_action('cd')
  nnoremap <silent><expr><buffer> <C-X> unite#do_action('cd')

  " Start insert.
  "let g:unite_enable_start_insert = 1
  setlocal nonumber
  setlocal norelativenumber
endfunction"}}}
"==============================================================================}}}

"================== Buffergator ==============================================={{{
function! jraf#loadBuffergator()
  if exists("s:loaded_buffergator") | return '' | endif
  ActivateAddons Buffergator
  let s:loaded_buffergator = 1
endfunction
"==============================================================================}}}

"================== CtrlP ====================================================={{{
function! jraf#ctrlpShowArrFun(count)
  let i = 0
  let msg = ''
  for v in g:ctrlp_comm
    if a:count == i | let msg .= '*' | endif
    let msg .= i
    let msg .= ':'
    let msg .= g:ctrlp_comm[i]
    let msg .= ' '
    let i = i + 1
  endfor
  echo msg
endfunction
"==============================================================================}}}

"================== Tagbar ===================================================={{{

function! jraf#tagbarSettings()
  if exists("g:tagbarSettings_init")
    return ""
  endif
  let g:tagbarSettings_init = 1

  let g:tagbar_autofocus = 1
  let g:tagbar_width = 30 "tagbar width (default is 40)
  let g:tagbar_sort = 0 "by default sort by order in the file

  let g:tagbar_type_gams = {
        \ 'ctagstype': 'gams',
        \ 'kinds' : [
        \ 'e:equation',
        \ 'c:variable',
        \ 'm:model',
        \ 's:Solve Statement',
        \ ],
        \ }

  let g:tagbar_type_gamslst = {
        \ 'ctagstype': 'gamslst',
        \ 'kinds' : [
        \ 'm:Model Solution Report',
        \ 'e:Equation',
        \ 'c:Variable Val:1',
        \ 'a:Equation val:1',
        \ ],
        \ }

  let g:tagbar_type_rmclog = {
        \ 'ctagstype': 'rmclog',
        \ 'kinds' : [
        \ 'a:Affected Crew Group',
        \ 'g:Global Iteration',
        \ ],
        \ }

  let g:tagbar_type_tex = {
        \ 'ctagstype' : 'latex',
        \ 'kinds'     : [
        \ 's:sections',
        \ 'l:labels',
        \ 'r:refs:1',
        \ 'g:graphics:1:0',
        \ 'p:pagerefs:1:0'
        \ ],
        \ 'sort'    : 0,
        \ }
endfunction

function! jraf#toggleTBarListNT()
  "always use last explicit argument
  if !exists("s:tbartoggle")
    let s:tbartoggle = 1
    call jraf#tagbarSettings()
  endif

  let s:tbartoggle_names = ['1: tagbar', '3: nerdtree']

  if v:count >= 1 && v:count <= 4
    let s:tbartoggle = v:count
  endif

  if v:count <= 4
    if s:tbartoggle == 1
      let s:loaded_tagbar = 1
      if !exists("s:loaded_tagbar")
        call vam#ActivateAddons(['Tagbar'],
              \ {'auto_install' : 0, 'force_loading_plugins_now': 1})
        let s:loaded_tagbar = 1
      endif
      TagbarToggle

    "elseif s:tbartoggle == 2
      "if !exists("s:loaded_taglist")
        ""taglist settings
        ""let Tlist_Close_On_Select = 1
        "let Tlist_Enable_Fold_Column = 0
        "let Tlist_GainFocus_On_ToggleOpen = 1
        "let Tlist_Use_Horiz_Window = 0
        "let Tlist_WinWidth = 31
        "let Tlist_Compact_Format = 1
        "let Tlist_Exit_OnlyWindow = 1
        "let Tlist_Use_SingleClick = 1
        "" the following is useful to use configure ctags for using taglist with gams
        "let tlist_gams_settings='gams;e:Equation;c:Variable;m:Model;s:Solve Statement'
        "let tlist_gamslst_settings = 'gamslst;m:Model Solution Report;'
        "let tlist_gamslst_settings .= 'e:Equation;c:Variable Val;a:Equation Val'

        ""ActivateAddons taglist
        "let s:loaded_taglist = 1
      "endif
      "TlistToggle

    elseif s:tbartoggle == 3
      if !exists("s:loaded_nerdtree")
        let NERDTreeShowBookmarks = 1
        "silent ActivateAddons nerdtree
        let s:loaded_nerdtree = 1
      endif
      NERDTreeToggle

    "elseif s:tbartoggle == 4
      ""if !exists("s:loaded_buffergator") | call jraf#loadBuffergator() | endif
      "BuffergatorToggle
    endif

  endif
  let s:tbartoggle_display = copy(s:tbartoggle_names)
  let s:tbartoggle_display[s:tbartoggle-1] .= '(*)'
  echom join(s:tbartoggle_display, ', ')
endfunction
"==============================================================================}}}

"================== UltiSnips ================================================={{{
function! jraf#loadUltisnips()
  if (has("python") || has("python3")) && g:addon_manager == 2
    call vam#ActivateAddons(['UltiSnips'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
    inoremap <silent> <NL> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
    nnoremap <silent> <NL> :call UltiSnips#ListSnippets()<CR>
    snoremap <silent> <NL> <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR>
    xnoremap <silent> <NL> :call UltiSnips#SaveLastVisualSelection()<CR>gvs

    inoremap <silent> <F10> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
    nnoremap <silent> <F10> :call UltiSnips#ListSnippets()<CR>
    snoremap <silent> <F10> <ESC>:call UltiSnips#ExpandSnippetOrJump()<CR>

    nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=jraf#ultiSnipsCallUnite()<CR>
    inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=jraf#ultiSnipsCallUnite()<CR>

    return 1
  else
    echom "vim compiled without python"
    return 0
  endif
endfunction

function! jraf#ultiSnipsCallUnite()
  Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
  return ''
endfunction
"==============================================================================}}}

"================== Supertab =================================================={{{
function! jraf#mySupertabAltCompletion()
  "alternate between keyword completion and user omni completion
  "when in latex complete tags
  let g:mysupertabaltcom = 1 - g:mysupertabaltcom
  if g:mysupertabaltcom == 0 && (&completefunc != "" || &filetype == 'tex')
    if &completefunc != ""
      return SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-u>")
    else
      return SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-]>")
    endif
  else
    return SuperTabAlternateCompletion("\<lt>c-p>")
  endif
endfunction
"==============================================================================}}}

"================== Python Settings ==========================================={{{

"pysmell {{{
function! jraf#loadPysmell()
  if exists("s:loadedPysmell")
    return ''
  endif
  if has("python")
    silent python << EOF
import vim
try:
  import pysmell
  vim.command('let s:has_pysmell = 1')
except:
  vim.command('let s:has_pysmell = 0')
EOF

    if s:has_pysmell == 1
        ActivateAddons pysmell
      setlocal completefunc=pysmell#Complete
      augroup ft_py_pysmellcomp
        autocmd!
        autocmd filetype python setlocal completefunc=pysmell#Complete
      augroup END
    else
      echom "No Pysmell installed!"
    endif
  else
    echom "Cannot Load PySmell: No Python!"
  endif
  let s:loadedPysmell = 1
endfunction "}}}

"Jedi {{{
function! jraf#loadJedi()
  if exists("s:loadedJedi")
    return ''
  endif
  let s:loadedJedi = 1
  let s:has_jedi = 0
  if has("python3")
    silent python3 << EOF
import vim
try:
  import jedi
  vim.command('let s:has_jedi = 1')
except:
  pass
EOF

    if s:has_jedi == 1
      let g:jedi#force_py_version = 3
      let g:jedi#show_call_signatures = "0"
      packadd jedi-vim
      setlocal omnifunc=jedi#complete
    else
      echom "No Jedi installed!"
    endif
  else
    echom "Cannot Load Jedi No Python support!"
  endif
endfunction "}}}
"==============================================================================}}}

"================== Latex ====================================================={{{
function! jraf#loadLatexSettings()
  if exists("g:loaded_LatexSettings")
    return ''
  endif
  let g:loaded_LatexSettings = 1


  "latex options
  "let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'
  " in case we get errors when using compiling because of python set to 0
  let g:Tex_UsePython=1
  let g:Tex_MultipleCompileFormats='dvi,pdf'

  "make vim load .tex files as latex files
  "let g:tex_flavor='latex'
  let g:tex_flavor='pdflatex'
  let g:Tex_DefaultTargetFormat='pdf'
  let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
  "let g:Tex_CompileRule_pdf = 'pdflatex  --synctex=1 -interaction=nonstopmode $*'
  let g:Tex_IgnoreLevel = 3
  let g:tex_comment_nospell= 1 "don't do spelling in comments
  "if has("autocmd") && g:is_win "why only on windows? don't remember now

  "for plugin in ftplugin/tex/tex_pdf.vim
  let g:tex_pdf_map_keys = 0

  if g:is_win
    let g:SumatraPdfLoc = expand("$HOME" .
          \ "/Programs/PApps/PortableApps/SumatraPDFPortable/SumatraPDFPortable")
    let g:Tex_ViewRule_pdf = g:SumatraPdfLoc . " -reuse-instance"
    " setting for summatra pdf
    " gvim -c ":RemoteOpenMod +%l %f"
    " code_bat.bat -g "%f:%l"
  else
    let g:Tex_ViewRule_pdf = 'okular'
  endif

  let compname = hostname()
  if compname == "MIDDLE-EARTH" || compname == "Gondor" || compname == 'Erebor'
    let g:thesis_path = $HOME . "/Desktop/tmp/Thesis"
  elseif compname == "ISENGARD2"
    let g:thesis_path = $HOME . ""
  elseif compname == "Isengard-3000-N100"
    let g:thesis_path = $HOME .  "/Documents/Thesis"
  elseif compname == "SHABBIRSTU3"
    let g:thesis_path = 'U:\WORK\Thesis'
  elseif compname =~ 'isye.gatech.edu' || compname == 'ISENGARD'
    let g:thesis_path = $HOME . "/WORK/Thesis"
  endif


  "LatexBox
  let g:LatexBox_latexmk_async = 1
  let g:LatexBox_latexmk_preview_continuously = 1
  let g:LatexBox_quickfix = 4

endfunction

function! jraf#loadLatexPlugins()
  if exists("s:loaded_latex_plugins") | return '' | endif

  imap <F8> <Plug>IMAP_JumpForward
  nmap <F8> <Plug>IMAP_JumpForward
  vmap <F8> <Plug>IMAP_JumpForward
  vmap <F8> <Plug>IMAP_DeleteAndJumpForward

  "ActivateAddons LaTeX-Box
  ActivateAddons vlatex
  ActivateAddons SpellCheck
  ActivateAddons LanguageTool
  packadd LaTeX_Box
  "will it be necessary to load after/ftplugin/tex again?
  let s:loaded_latex_plugins = 1
endfunction

"" fix viewing pdf, using \la to view pdf by default
function! jraf#setPdfDestination(...)
  "without args get current working file and add pdf, else specific arg
  if a:0 > 0
    let g:fix_pdf_dest = substitute(a:1, '.pdf', '', '')
  else
    let g:fix_pdf_dest = substitute(expand('%:t'), '.tex', '', '')
  endif

  "just change to the folder of the current file already. Should be there in
  "the first place
  silent exe "cd " . expand('%:p:h')
  echo "changed folder to " . expand('%p:h')

  if 0 && has("gui")
    winpos 0 0
    set guioptions-=m "no menu bar for now
    set lines=100 columns=91
  endif

  let g:did_setpdfdestination = 1
  let g:fix_pdf_dest_target = (expand('%:p:h') . '/' . g:fix_pdf_dest)
  nnoremap <Leader>la :<C-U>call jraf#fixForwardSeach()<CR>
  command! -complete=file -nargs=* CompileViewLatex
        \ exec "!start latexmk -pvc " . shellescape(g:fix_pdf_dest_target)
endfunction

function! jraf#fixForwardSeach()
  if !exists("g:did_setpdfdestination")
    call jraf#setPdfDestination()
  endif
  let target = shellescape(g:fix_pdf_dest_target . '.pdf')
  let cmd = g:SumatraPdfLoc . " -reuse-instance -forward-search "
        \ . shellescape(expand('%:p')) . ' ' . line('.') . ' ' . target
  let execString = 'silent! !start ' . cmd
  exe execString
endfunction

function! jraf#myThesisEnv(...)
  if a:0 > 0
    let s:thesis_target = substitute(a:1, ".pdf", "", "")
  else
    "let s:thesis_target = 'tdraft'
    "let s:thesis_target = 'defensePresentation'
    let s:thesis_target = 'thesis-main'
  endif
  if has("gui")
    winpos 0 0
    set guioptions-=m "no menu bar for now
    set lines=100 columns=91
  endif
  silent exec "cd " . g:thesis_path
  nmap <silent> \tt :silent !perl OtherFiles/do_tags.pl<CR>
  "command! ThesisCompileView !start perl run_latexmk.pl
  command! ThesisCompileView exec "!start perl run_latexmk.pl " . s:thesis_target

  set wildignore+=*.log,*.aux,*.toc,*.blg,*.fls

  "exe "command! MLRT1 '<'>s/\(xl\|xu\|yl\|yu\|zl\|zu\)/\=" .
        "\ "{'xu':'x^u', 'xl':'x^l', 'yl':'y^l', 'yu':'y^u', 'zl':'z^l', 'yu':'y^u'}" .
        "\ "[submatch(0)]/gc"
  command! MLRT1 call histadd("cmd", "'<,'>s/" . '\(x\|y\|z\)\(l\|u\)/\1^\2/gc')
  command! MLRT2 call histadd("cmd", "'<,'>s/" . '\(x\|y\|z\)\(l\|u\)^/(\1^\2)^/gc')
  command! MLRT3 call histadd("cmd", "'<,'>s/" . '\\text{\([^}]*\)}/\1/gc')
  function! MyLatexReplaceText(...)
    call histadd("cmd", "'<,'>s/\\\\text{\\([^}]*\\)}/\\1/gc")
    if a:0 > 0
      if a:0 != 2
        echom "provide two lists to the function"
        return ''
      endif
      let g:replace_list_in = a:1
      let g:replace_list_out = a:2
      let g:replace_ncur = 0
    endif
    if a:0 == 0 && !exists("g:replace_ncur")
      let g:replace_list_in = ['xl^', 'xl', 'xu^', 'xu', 'yl', 'yu', 'zl', 'zu']
      let g:replace_list_out = ['(x^l)^', 'x^l', '(x^u)^', 'x^u', 'y^l', 'y^u', 'z^l', 'z^u']
      let g:replace_ncur = 0
    endif
    if g:replace_ncur == len(g:replace_list_in)
      let g:replace_cmd = ":echom 'reached end of list'\<CR>"
      let g:replace_ncur = -1
    else
      let range_ = "'<,'>"
      let extra_flags = 'gc'
      let g:replace_cmd = ':' .range_ . "s/" .  g:replace_list_in[g:replace_ncur]
            \ . "/" . g:replace_list_out[g:replace_ncur] . "/" . extra_flags
            \ . "\<CR>"
      call histadd("cmd", g:replace_cmd)
    endif
    let g:replace_ncur += 1
    return g:replace_cmd
  endfunction
  nnoremap <silent><expr> <Leader>ns MyLatexReplaceText()

  function! MyForwardSearch()
    let target = g:thesis_path . '/' . s:thesis_target . '.pdf'
    let cmd = g:SumatraPdfLoc .  " -reuse-instance -forward-search " . expand('%:p') . " " . line('.') . " " . target
    let execString = 'silent! !start ' . cmd
    exe execString
  endfunction
  if g:is_win
    nnoremap <Leader>la :<C-U>call MyForwardSearch()<CR>
  else
    nnoremap <Leader>la <Leader>ls
  endif

endfunction

"==============================================================================}}}

"================== full screen with plugin ==================================={{{
"plugin: http://www.vim.org/scripts/script.php?script_id=2596
function! jraf#fullScreenToogle()
  if g:isMaximized == 0
    let g:defaultNumCols = &columns
    let g:defaultNumLines = &lines
    let g:currposx = getwinposx()
    let g:currposy = getwinposy()
    call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
    let g:isMaximized = 1
  else
    call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
    let g:isMaximized = 0
    exec "set columns=" . g:defaultNumCols
    exec "set lines=" . g:defaultNumLines
    exec "winpos" . g:currposx . " " . g:currposy
  endif
endfunction
"==============================================================================}}}

"================== LibClang =================================================={{{
function! jraf#loadClangComplete()
  if 1 || exists("s:loaded_clang_complete") || g:is_win | return '' | endif
  ActivateAddons clang_complete
  let s:loaded_clang_complete = 1
endfunction
"==============================================================================}}}

"================== Bufstop ==================================================={{{
"function! jraf#myBuffStopCall()
  "if     v:count == 1 | Bufstop
  "elseif v:count == 2 | BufstopFast
  "elseif v:count == 3 | BufstopMode
  "else
    "BufstopModeFast
  "endif
"endfunction
"==============================================================================}}}

"================== Delete Whitespace (DeltTrailWhiteSpace) ==================={{{
function! jraf#stripTrailingWhitespace() range
  if !&binary && &filetype != 'diff'
    let cmd = '' . a:firstline . ',' . a:lastline
    let cmd .= 's/\s\+$//e'
    execute cmd
    normal 'yz<CR>
    normal `z
  endif
endfunction
"==============================================================================}}}

"================== Uniq Line (Uniq) =========================================={{{
function! jraf#uniq () range "{{{
  " from Damian Conway scripting the vim editor
  " Nothing unique seen yet...
  let have_already_seen = {}
  let unique_lines = []

  " Walk through the lines, remembering only the hitherto-unseen ones...
  for original_line in getline(a:firstline, a:lastline)
    let normalized_line = '>' . original_line
    if !has_key(have_already_seen, normalized_line)
      call add(unique_lines, original_line)
      let have_already_seen[normalized_line] = 1
    endif
  endfor

  " Replace the range of original lines with just the unique lines...
  exec a:firstline . ',' . a:lastline . 'delete'
  call append(a:firstline-1, unique_lines)
endfunction "}}}
"==============================================================================}}}

"================== Plugin Loading (simple.vim) ==============================={{{
function! jraf#loadCtrlP()
  if g:addon_manager == 2
    call vam#ActivateAddons(['ctrlp.vim'], {'auto_install' : 0, 'force_loading_plugins_now': 1})
  else "assume packadd
    packadd ctrlp
  endif
  nnoremap <silent> <C-P> :<C-U>call jraf#ctrlpShowArrFun(v:count)
        \ \| silent! exe 'CtrlP' . g:ctrlp_comm[v:count]<CR>
  nnoremap <silent> ,b :<C-U>CtrlPBuffer<CR>
endf
"==============================================================================}}}

"================== Scratch Edit =============================================={{{
function! jraf#ScratchEdit(cmd, options)
  exe a:cmd tempname()
  setl buftype=nofile bufhidden=wipe nobuflisted
  if !empty(a:options) | exe 'setl' a:options | endif
endfunction
"==============================================================================}}}

"================== QuoteCommaJoin ============================================{{{
function! jraf#quoteCommaJoin() range
  let cmd = '' . a:firstline . ',' . a:lastline
  execute cmd . "yank u"
  call jraf#ScratchEdit('split', '')
  normal "upggdd
  silent! %s/^\s\+//
  DelTrailWhiteSpace
  " replace one or more space with newline
  if search("\s+", 'w') > 0
    %s/\s\+/\r/g
  endif
  DelTrailWhiteSpace
  %s/^/"/
  %s/$/",/
  normal G$x
  %join
  normal O
  normal "uPG^yg_
endfunction
"==============================================================================}}}

"================== SplitInLines =============================================={{{
" split buffer in different lines. delete blank lines
function! jraf#splitInLines()
  silent! %s/\s\+/\r/g
  DelTrailWhiteSpace
  silent! g/^$/d
endfunction
"==============================================================================}}}


"================== quickrun-jq ==============================================={{{
function! jraf#quickrunjqset(json_file)
  let g:quickrun_config = get(g:, 'quickrun_config', {})
  let g:quickrun_config["conf.jq"] = {
        \ 'runner': 'jq',
        \ 'exec': "jq -f %s " . a:json_file
        \ }
  let file_name = '.last_qr_jq'
  call writefile([a:json_file], file_name)
endfunction
function! jraf#quickrunjqload()
  " check if file .last_qr_jq exists and if so load with those contents
  let file_name = '.last_qr_jq'
  if filereadable(file_name)
    for line in readfile(file_name)
      call jraf#quickrunjqset(line)
      return ''
    endfor
  endif
endfunction
"==============================================================================}}}

" vim: foldmethod=marker
