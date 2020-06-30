" denite gina

"---------------------------------------------------------------------------
" denite.nvim
"
if has("python3") && IsAddonActive('denite')
  if executable('rg')
    call denite#custom#alias('source', 'rgf', 'file/rec')
    call denite#custom#var('rgf', 'command',
          \ ['rg', '--files', '--glob', '!.git'])

    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'default_opts',
          \ ['--vimgrep', '--no-heading'])
  else
    "call denite#custom#var('file/rec', 'command',
          "\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  endif

  let ignore_files=&wildignore . ",*.pyc,.git,.hg,.svn,.p2,.cache"
  let ignore_files .= ',*.swp'
  call denite#custom#var('file/rec', 'command',
   \ ['scantree.py', '--ignore', ignore_files])

  call denite#custom#source('file_old', 'matchers',
        \ ['matcher_fuzzy', 'matcher_project_files'])

  if has('nvim')
    call denite#custom#source('file/rec,grep', 'matchers',
          \ ['matcher_cpsm'])
  endif

  call denite#custom#source('file_old', 'converters',
        \ ['converter_relative_word'])

  call denite#custom#map('insert', '<C-j>',
        \ '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-k>',
        \ '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', "'",
        \ '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('normal', 'r',
        \ '<denite:do_action:quickfix>', 'noremap')

  call denite#custom#alias('source', 'file/rec/git', 'file/rec')
  call denite#custom#var('file/rec/git', 'command',
        \ ['git', 'ls-files', '-co', '--exclude-standard'])

  call denite#custom#alias('source', 'file/rec/py', 'file/rec')
  call denite#custom#var('file/rec/py', 'command',['scantree.py'])

  call denite#custom#option('default', 'prompt', '>')
  call denite#custom#option('default', 'short_source_names', v:true)

  let s:menus = {}
  let s:menus.vim = {
      \ 'description': 'Vim',
      \ }
  let s:menus.vim.file_candidates = [
      \ ['    > Edit configuration file (init.vim)', '~/vimfiles/vimrc']
      \ ]
  call denite#custom#var('menu', 'menus', s:menus)

  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        \ [ '.git/', '.ropeproject/', '__pycache__/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


  " mappings
  nnoremap ,d<SPACE> :<C-U>Denite<SPACE><C-D>
  nnoremap ,df :<C-U>Denite file/rec<CR>
  nnoremap ,db :<C-U>Denite buffer<CR>
endif

"================== Gina ======================================================{{{
function! LoadGina()
  call gina#custom#command#alias('status', 'st')
  call gina#custom#command#alias('branch', 'br')
  call gina#custom#command#option('br', '-v', 'v')
  call gina#custom#command#option(
        \ '/\%(log\|reflog\)',
        \ '--opener', 'vsplit'
        \)

  call gina#custom#command#option('status', '--opener', 'split')
  call gina#custom#command#option('commit', '--opener', 'tabedit')

  call gina#custom#command#option(
        \ 'log', '--group', 'log-viewer'
        \)
  call gina#custom#command#option(
        \ 'reflog', '--group', 'reflog-viewer'
        \)
  call gina#custom#command#option(
        \ 'commit', '-v|--verbose'
        \)
  call gina#custom#command#option(
        \ '/\%(status\|commit\)',
        \ '-u|--untracked-files'
        \)

  call gina#custom#command#option(
        \ '/\%(status\|changes\)',
        \ '--ignore-submodules'
        \)

  call gina#custom#action#alias(
        \ 'branch', 'track',
        \ 'checkout:track'
        \)
  call gina#custom#action#alias(
        \ 'branch', 'merge',
        \ 'commit:merge'
        \)

  call gina#custom#action#alias(
        \ 'branch', 'rebase',
        \ 'commit:rebase'
        \)

  call gina#custom#mapping#nmap(
        \ 'branch', 'g<CR>',
        \ '<Plug>(gina-commit-checkout-track)'
        \)
  call gina#custom#mapping#nmap(
        \ 'status', '<C-^>',
        \ ':<C-u>Gina commit<CR>',
        \ {'noremap': 1, 'silent': 1}
        \)
  call gina#custom#mapping#nmap(
        \ 'commit', '<C-^>',
        \ ':<C-u>Gina status<CR>',
        \ {'noremap': 1, 'silent': 1}
        \)

  call gina#custom#execute(
        \ '/\%(status\|branch\|ls\|grep\|changes\|tag\)',
        \ 'setlocal winfixheight',
        \)
endfunction

if exists('g:loaded_gina') && g:loaded_gina
  call LoadGina()
endif
"==============================================================================}}}

"================== Mucomplete ================================================{{{
if IsAddonActive('vim-mucomplete')
	let g:mucomplete#chains = {}
	let g:mucomplete#chains.default = ['path', 'nsnp', 'keyn']
        let g:mucomplete#enable_auto_at_startup = 1
        set completeopt+=noselect
        set completeopt+=menuone

        if IsAddonActive('neosnippet.vim')
          inoremap <silent> <expr> <plug><MyCR>
              \ mucomplete#neosnippet#expand_snippet("\<cr>")
          imap <F10> <plug><MyCR>
        endif

        "imap <F11> <plug>(MUcompleteCR)
        "inoremap <silent> <plug>(MUcompleteFwdKey) <C-L>
        "imap <C-L> <plug>(MUcompleteCycFwd)

	inoremap <silent> <plug>(MUcompleteFwdKey) <right>
	imap <right> <plug>(MUcompleteCycFwd)
	inoremap <silent> <plug>(MUcompleteBwdKey) <left>
	imap <left> <plug>(MUcompleteCycBwd)

endif
"==============================================================================}}}

"================== asyncomplete =============================================={{{
function! SetupAsyncomplete()
  if !IsAddonActive('asyncomplete.vim')
    return
  endif

  let g:asyncomplete_remove_duplicates = 1

  if IsAddonActive('asyncomplete-buffer.vim')
    call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
          \ 'name': 'buffer',
          \ 'whitelist': ['*'],
          \ 'blacklist': ['go'],
          \ 'completor': function('asyncomplete#sources#buffer#completor'),
          \ }))
  endif

  if IsAddonActive('asyncomplete-omni.vim')
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
          \ 'name': 'omni',
          \ 'whitelist': ['*'],
          \ 'blacklist': ['c', 'cpp', 'html'],
          \ 'completor': function('asyncomplete#sources#omni#completor')
          \  }))
  endif

  if IsAddonActive('asyncomplete-file.vim')
    "au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
          \ 'name': 'file',
          \ 'whitelist': ['*'],
          \ 'priority': 10,
          \ 'completor': function('asyncomplete#sources#file#completor')
          \ }))
  endif

  if IsAddonActive('asyncomplete-neosnippet.vim')
    call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
          \ 'name': 'neosnippet',
          \ 'whitelist': ['*'],
          \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
          \ }))
  endif
endfunction

" for now call it here, may call it somewhere else
call SetupAsyncomplete()
"==============================================================================}}}

"================== lightline  =============================================={{{
if IsAddonActive('lightline')
let g:lightline = {
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'tabsindicator', 'fileformat', 'fileencoding', 'filetype' ] ]
      \  },
      \ 'component_function': {
      \ 'tabsindicator': 'GetNumTabsStr'
      \ },
      \ }


"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ 'active': {
      "\   'right': [ [ 'lineinfo' ],
      "\              [ 'percent' ],
      "\              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      "\ },
      "\ 'component': {
      "\   'charvaluehex': '0x%B'
      "\ },
      "\ }
endif
"==============================================================================}}}
