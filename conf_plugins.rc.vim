" denite gina

"---------------------------------------------------------------------------
" denite.nvim
"
if has("python3") && GetIsAddonActive('denite')
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
if exists('g:loaded_gina') && g:loaded_gina
  call gina#custom#command#alias('status', 'st')
  call gina#custom#command#alias('branch', 'br')
  call gina#custom#command#option('br', '-v', 'v')
  call gina#custom#command#option(
        \ '/\%(log\|reflog\)',
        \ '--opener', 'vsplit'
        \)
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
endif
"==============================================================================}}}