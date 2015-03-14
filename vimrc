" is_windows, evim? {{{

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" This must be first, because it changes other options as a side effect.
set nocompatible

"default path for runtime files
"let g:p0 = split(&runtimepath, ',')[0]
if has("unix")
  let g:p0 = "~/.vim"
else
  let g:p0 = "~/vimfiles"
endif

let g:is_win = has('win32') || has('win64')
"}}}

" decide on pathogen or vam (pathogen: 1, vam: 2)
let g:addon_manager = 2
let g:is_vimrc_simple = 0

"================== pathogen ================================================{{{
"we still use g:pathogen_disabled
let g:pathogen_disabled = []

if g:addon_manager == 1
  function! PathogenSetup()
    "call pathogen#helptags()
    "call pathogen#runtime_append_all_bundles()
    let g:pathogen_disabled += ['pyflakes', 'python-mode', 'pysmell']
    let g:pathogen_disabled += ['powerline']
    let g:pathogen_disabled += ['hilinks']
    let g:pathogen_disabled += ['snipmate']
    let g:pathogen_disabled += ['powershell', 'lycosaexplorer'] "lycosa is to heavy
    "let g:pathogen_disabled += ['supertab']
    "let g:pathogen_disabled += ['vlatex']
    let g:pathogen_disabled += ['Align', 'AutoAlign']
    if !has("python")
      let g:pathogen_disabled += ['lycosaexplorer', 'headlights']
      let g:pathogen_disabled += ['UltiSnips', 'pyflakes', 'python-mode']
    endif
    if g:is_win
      let g:pathogen_disabled += ['pysmell']
    endif

    call pathogen#infect()
  endfunction

  call PathogenSetup()
endif
"==============================================================================}}}

"================== vim-addon-manager========================================{{{
if g:addon_manager == 2
function! SetupVAM()
  let g:active_addons = []
  command! -nargs=* -bar VAMAddToActiveAddons let g:active_addons += [<f-args>]

  let g:vim_addon_manager = {}
  let vam_install_path = escape(expand(g:p0 . '/bundle'), ' \')
  exec 'set rtp+='.vam_install_path.'/vam'
  let g:vim_addon_manager.additional_addon_dirs = [
        \ escape(expand(g:p0 . '/notused_plugins'), ' \'),
        \ escape(expand(g:p0 . '/local_plugins'), ' \'),
        \ ]

  "VAMAddToActiveAddons ctrlp SmartusLine TaskList Supertab
  VAMAddToActiveAddons ctrlp TaskList Supertab
  VAMAddToActiveAddons d.0 Bufstop delimitMate CountJump
  VAMAddToActiveAddons vimproc tlib NrrwRgn
  VAMAddToActiveAddons neocomplete
  VAMAddToActiveAddons UltiSnips startify
  VAMAddToActiveAddons argumentative projectionist
  VAMAddToActiveAddons Syntastic powershell fugitive
  "VAMAddToActiveAddons LaTeX-Box vlatex SpellCheck LanguageTool
  "VAMAddToActiveAddons SnippetCompleteSnipMate SnippetComplete
  "VAMAddToActiveAddons yankstack
  if has("python")
    "let g:active_addons += ['UltiSnips']
    "VAMAddToActiveAddons UltiSnips
  endif

  call vam#ActivateAddons(g:active_addons, {'auto_install' : 0})

  command! -nargs=* -bar -complete=customlist,vam#install#InstalledAddonCompletion AA
        \ :call vam#ActivateAddons([<f-args>], {'auto_install' : 0, 'force_loading_plugins_now': 1})
endfunction
call SetupVAM()
endif
"==============================================================================}}}

"this is where all vimrc and simple settings go
execute "source " . g:p0 . "/common.vim"

let s:work_common = expand(g:p0 . "/work_common.vim")
if filereadable(s:work_common)
  execute "source " . s:work_common
endif

"================== PreciseJump ==============================================={{{
"nnoremap ,f :call PreciseJumpF(-2, -1, 0)<CR>
nnoremap ,f :call PreciseJumpF(-1, -1, 0)<CR>
vnoremap ,f <ESC>:call PreciseJumpF(-1, -1, 1)<CR>
onoremap ,f :call PreciseJumpF(-1, -1, 0)<CR>
"==============================================================================}}}

"================== LibClang =================================================={{{
let g:clang_use_library = 1
"note, this does not work when the first file is loaded. Just reload the first
"file (:e!) and chill out

augroup ft_cpp_clang
  autocmd!
  autocmd FileType c,cpp call jraf#loadClangComplete()
augroup END
"==============================================================================}}}

"================== Bufstop ==================================================={{{
nnoremap <Leader>b :<C-U>call jraf#myBuffStopCall()<CR>
"==============================================================================}}}

"================== Statusline ================================================{{{
"set statusline=%-3.3n%t\ \ \ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%-3.3n%t\ \ %h%m%r\ %y%=%l/%L\ %3c\ \ \ %P
"set statusline=%-3.3n%t\ \ \ %h%m%r\ %y%=%{strftime(\"[%H:%M%p]\")}\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
"set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]
"set statusline+=\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]
"set statusline+=\ %=\ Line:%l\/%L\ Column:%c%V\ %P
"
"set statusline=%-3.3n%t\ \ \ %h%m%r%=[%{&ft}\,
"set statusline+=%{&ff}]\ \ \ %{strftime(\"[%H:%M%p]\")}
"set statusline+=\ \ \ \ \ %l/%L\ \ %3c\ \ \ %P
"
"set statusline=%2.2n\ %t\ %h%m%r%=[%{&ft}\,%{&ff}]
set statusline=%2.2n\ %t
set statusline+=\ %h%#Modified#%m%r%*%=
"set statusline+=%{XgetTagbarFunc()}
"set statusline+=%{GetWindowNR()}
set statusline+=%{GetNumTabsStr()}
set statusline+=%{CondDispFtFf()}
set statusline+=%{DispLTXCF()}
"set statusline+=\ %h%m%r%=%{CondDispFtFf()}
"set statusline+=%{tagbar#currenttag('[%s] ', '')}
"set statusline+=\ %{strftime(\"[%H:%M%p]\")} "do we want to show time?
set statusline+=\ %l/%L\ %2c\ %P

"=============================== smartusline =================================={{{
"%-3.3n%t   %h%m%r%=[%{&ft},%{&ff}]   %{strftime("[%H:%M%p]")}     %l/%L  %3c   %P
hi Modified guifg=black guibg=#FFA500
let g:smartusline_string_to_highlight = '%2.2n %t %h'
"let smartusline_deep_eval = 1
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"==============================================================================}}}
"==============================================================================}}}

"================== Python Settings ==========================================={{{
"some pylint settings
let g:pylint_onwrite = 0

"mapping for running python code
"nmap <F9> :SingleCompileRun<CR>

"================== python_mode (plugin) ======================================{{{
"some python mode configuration. Don't always use but for now disable some
"settings when used
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_options_indent = 0
let g:pymode_breakpoint = 0
"==============================================================================}}}

"==============================================================================}}}

"================== Other commands/mappings/settings =========================={{{

"source explorer
let g:SrcExpl_isUpdateTags = 0

"don't enable showmarks, use \mt to toogle it
let g:showmarks_enable=0

"================== snipmate =================================================={{{
let g:snippets_dir = g:p0 . "/bundle/snipmate/snippets"
"==============================================================================}}}

"================== localvim =================================================={{{
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
"==============================================================================}}}

"================== yankRing / yankstack ======================================{{{
let g:yankring_paste_using_g = 0 "I want gp to select the pasted text
let g:yankring_history_file = '.yankring_history'
let g:yankring_history_dir = g:p0

if index(g:active_addons, 'yankstack') >= 0
  nmap ,y <Plug>yankstack_substitute_older_paste
  nmap ,Y <Plug>yankstack_substitute_newer_paste
endif
"==============================================================================}}}

"================== autocomplpop (acp) ========================================{{{
if 0
"don't want to start this completion thing before x chars
let g:acp_behaviorKeywordLength = 12
let g:acp_completeOption = '.,w,b,k,t'

"fuction to toogle behaviour of autocomplpop
let g:is_acp_disabled = 0
function! ToggleAcpDisable()
  if g:is_acp_disabled == 0
    AcpLock
    let g:is_acp_disabled = 1
  else
    AcpUnlock
    let g:is_acp_disabled = 0
  endif
endfunction

"noremap <f11> :call ToggleAcpDisable()<CR>
"inoremap <f11> <ESC>:call ToggleAcpDisable()<CR>a
endif
"==============================================================================}}}

"================== ManPageView ==============================================={{{
let g:manpageview_winopen = "hsplit="
augroup manpageview
  autocmd!
  autocmd FileType man setlocal norelativenumber nonumber
augroup END
"also created a file in bundle/manpageview/ftplugin/man.vim with map q to quit
"==============================================================================}}}

"================== LanguageTool =============================================={{{
let g:languagetool_disable_rules = "WHITESPACE_RULE,EN_QUOTES,CURRENCY," .
      \ "COMMA_PARENTHESIS_WHITESPACE,EN_UNPAIRED_BRACKETS"
"==============================================================================}}}

"================== LustyExplorer and Juggler ================================={{{
"nmap <silent> ,lf :LustyFilesystemExplorer<CR>
"nmap <silent> ,lr :LustyFilesystemExplorerFromHere<CR>
"nmap <silent> ,lb :LustyBufferExplorer<CR>
"nmap <silent> ,lg :LustyBufferGrep<CR>
"nmap <silent> ,lj :LustyJuggler<CR>

"lusty juggler
let g:LustyJugglerShowKeys = 'a'
"==============================================================================}}}

"================== vim-pipe commands ========================================={{{
augroup vim_pipe
  autocmd!
  autocmd FileType python let b:vimpipe_command="python"
  autocmd FileType perl let b:vimpipe_command="perl"
  autocmd FileType tex let b:vimpipe_command="latexmk"
augroup END
"==============================================================================}}}

"================== ConqueTerm ================================================{{{
let g:ConqueTerm_ReadUnfocused = 1
"==============================================================================}}}

"================== Tasklist =================================================={{{
"useful for managing a todo list
noremap <leader>t_ <Plug>TaskList
noremap <leader>td :TaskList<CR>
"==============================================================================}}}

"================== LycosaExplorer ============================================{{{
if index(g:active_addons, 'lycosaexplorer') >= 0
  call jrar#setupLycosa()
endif
"==============================================================================}}}

"some plugins don't work well with some enviroments, just try to adjust them
let g:LustyExplorerSuppressRubyWarning = 1
if !has("python")
  let g:loaded_gundo = 1
  let loaded_gundo = 1
endif

"don't load plugins in that cause errors for previous versions
if v:version < 702
  let g:loaded_ZoomWinPlugin = 1
  let g:loaded_tagbar = 1
endif
if v:version < 703
  let g:loaded_autoload_l9 = 1
endif

"load cscope in two levels up
noremap <Leader>csa :cs add ../../cscope.out ../..<CR>

"==============================================================================}}}

"================== delimitmate ==============================================={{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
"==============================================================================}}}

"================== fugitive =================================================={{{
nnoremap ,gcf :<C-U>Gcommit -v %<CR>
nnoremap ,gca :<C-U>Gcommit -v -a<CR>
nnoremap ,gp :<C-U>Git push<CR>
nnoremap ,gdf :<C-U>Git diff<CR>
"==============================================================================}}}

"================== Thesis Specific Settings =================================={{{
command! -complete=file -nargs=* Mtorig call jraf#myThesisEnv(<f-args>)
"==============================================================================}}}

"================== neocomplete ============================================={{{
if (1 || g:addon_manager == 2 && index(g:active_addons, 'neocomplete') >= 0)
  call SetupNeocomplete()
endif
"==============================================================================}}}

"================== neocomplcache ============================================={{{
" Use neocomplcache? Not for now!
if 0
  call SetupNeocomplcache()
  function! SetupNeocomplcache()
    let g:neocomplcache_enable_at_startup = 1 && (
          \ (g:addon_manager == 1 && index(g:pathogen_disabled, 'neocomplcache') == -1) ||
          \ (g:addon_manager == 2 && index(g:active_addons, 'neocomplcache') >= 0))
    if g:neocomplcache_enable_at_startup == 1
      let g:acp_enableAtStartup = 0
      " Use smartcase.
      let g:neocomplcache_enable_smart_case = 0
      " Use camel case completion.
      let g:neocomplcache_enable_camel_case_completion = 0
      " Use underbar completion.
      let g:neocomplcache_enable_underbar_completion = 1
      " Set minimum syntax keyword length.
      let g:neocomplcache_min_syntax_length = 6
      let g:neocomplcache_min_keyword_length = 6
      let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

      " Define dictionary.
      let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

      " disable file name completion
      let g:neocomplcache_source_disable = {
            \ 'filename_complete' : 1
            \ }

      " Define keyword.
      if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
      endif
      let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

      " Plugin key-mappings.
      "inoremap <expr><C-G>     neocomplcache#undo_completion()
      "inoremap <expr><C-L>     neocomplcache#complete_common_string()

      " Recommended key-mappings.
      " <CR>: close popup and save indent.
      inoremap <expr><silent> <CR> <SID>my_cr_function()
      function! s:my_cr_function()
        return pumvisible() ? neocomplcache#close_popup() . "\<CR>" : "\<CR>"
      endfunction
      " <TAB>: completion.
      "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
      " <C-h>, <BS>: close popup and delete backword char.
      inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
      inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
      inoremap <expr><C-y> pumvisible() ? neocomplcache#close_popup() : "\<C-Y>"
      inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() :
            \ IsLineEndInsert() ? "\<C-E>" : "\<C-O>$"

      " For cursor moving in insert mode(Not recommended)
      "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
      "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
      "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
      "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
      "let g:neocomplcache_enable_cursor_hold_i = 1
      "let g:neocomplcache_enable_insert_char_pre = 1

      " AutoComplPop like behavior.
      "let g:neocomplcache_enable_auto_select = 1

      " Shell like behavior(not recommended).
      set completeopt+=longest
      let g:neocomplcache_enable_auto_select = 0
      let g:neocomplcache_disable_auto_complete = 1
      "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
      "inoremap <expr><TAB>  pumvisible() ? "\<C-N>" : "\<C-X>\<C-U>\<C-N>"
      "inoremap <expr><S-TAB>  pumvisible() ? "\<C-P>" : "\<C-X>\<C-U>\<C-P>"
      inoremap <expr><F12> pumvisible() ? "\<C-N>" : "\<C-X>\<C-U>\<C-N>"
      "inoremap <expr><CR>  pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
      inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"

      inoremap <expr><C-U> pumvisible() ? neocomplcache#smart_close_popup() . "\<C-U>" : "\<C-G>u\<C-U>"

      " Enable omni completion.
      augroup neocomplcache_1
        autocmd!
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
      augroup END

      " Enable heavy omni completion.
      if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
      endif
      let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
      "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
      let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
      let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
      let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

      " For perlomni.vim setting.
      " https://github.com/c9s/perlomni.vim
      let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    endif
  endfunction
endif
"==============================================================================}}}

if g:is_win
  let Grep_Path = 'C:\cygwin\bin\grep'
endif

" vim: foldmethod=marker
