" usage example:
"
" call nix#ExportPluginsForNix({'path_to_nixpkgs': '/etc/nixos/nixpkgs', 'names': ["vim-addon-manager", "vim-addon-nix"], 'cache_file': 'cache'})

" without deps
fun! nix#NixDerivation(path_to_nixpkgs, name, repository) abort
  let type = get(a:repository, 'type', '')
  if type == 'git'
    " should be using shell abstraction ..
    echo 'fetching '. a:repository.url
    let s = vam#utils#System(a:path_to_nixpkgs.'/pkgs/build-support/fetchgit/nix-prefetch-git $', a:repository.url)
    let rev = matchstr(s, 'git revision is \zs[^\n\r]\+\ze')
    let sha256 = matchstr(s, 'hash is \zs[^\n\r]\+\ze')

    return join([
          \ '  "'.a:name.'" = buildVimPlugin {',
          \ '    name = "'.a:name.'";',
          \ '    src = fetchgit {',
          \ '      url = "'. a:repository.url .'";',
          \ '      rev = "'.rev.'";',
          \ '      sha256 = "'.sha256.'";',
          \ '    };',
          \ '    dependencies = ['.join(map(get(a:repository, 'dependencies', []), "'\"'.v:val.'\"'")).'];',
          \ '  };',
          \ '',
          \ ], "\n")

  elseif type == 'hg'
    " should be using shell abstraction ..
    echo 'fetching '. a:repository.url
    let s = vam#utils#System(a:path_to_nixpkgs.'/pkgs/build-support/fetchgit/nix-prefetch-git $', a:repository.url)
    let rev = matchstr(s, 'git revision is \zs[^\n\r]\+\ze')
    let sha256 = matchstr(s, 'hash is \zs[^\n\r]\+\ze')

    return join([
          \ '  "'.a:name.'" = buildVimPlugin {',
          \ '    name = "'.a:name.'";',
          \ '    src = fetchgit {',
          \ '      url = "'. a:repository.url .'";',
          \ '      rev = "'.rev.'";',
          \ '      sha256 = "'.sha256.'";',
          \ '    };',
          \ '    dependencies = ['.join(map(get(a:repository, 'dependencies', []), "'\"'.v:val.'\"'")).'];',
          \ '  };',
          \ '',
          \ ], "\n")

  elseif type == 'archive'
    let sha256 = split(vam#utils#System('nix-prefetch-url $ 2>/dev/null', a:repository.url), "\n")[0]
    return join([
          \ '  "'.a:name.'" = buildVimPlugin {',
          \ '    name = "'.a:name.'";',
          \ '    src = fetchurl {',
          \ '      url = "'. a:repository.url .'";',
          \ '      name = "'. a:repository.archive_name .'";',
          \ '      sha256 = "'.sha256.'";',
          \ '    };',
          \ '    buildInputs = [ unzip ];',
          \ '    dependencies = ['.join(map(get(a:repository, 'dependencies', []), "'\"'.v:val.'\"'")).'];',
          \ '    meta = {',
          \ '       url = "http://www.vim.org/scripts/script.php?script_id='.a:repository.vim_script_nr.'";',
          \ '    };',
          \ '  };',
          \ '',
          \ ], "\n")
  else
    throw a:name.' TODO: implement source '.string(a:repository)
  endif
endf

" also tries to handle dependencies
fun! nix#AddNixDerivation(path_to_nixpkgs, derivations, name, ...) abort
  if has_key(a:derivations, a:name) | return | endif
  let repository = a:0 > 0 ? a:1 : {}

  if repository == {}
    call vam#install#LoadPool()
    let repository = get(g:vim_addon_manager.plugin_sources, a:name, {})
    if repository == {}
      throw "repository ".a:name." unkown!"
    end
  endif

  " check for dependencies
  let info = vam#ReadAddonInfo(vam#AddonInfoFile(vam#PluginDirFromName(a:name), a:name))
  let dependencies = keys(get(info, 'dependencies', {}))
  for dep in dependencies
    call nix#AddNixDerivation(a:path_to_nixpkgs, a:derivations, dep)
  endfor

  if len(dependencies) > 0
    let repository.dependencies = dependencies
  endif
  let a:derivations[a:name] = nix#NixDerivation(a:path_to_nixpkgs, a:name, repository)
endf

" with dependencies
fun! nix#ExportPluginsForNix(opts) abort
  let path_to_nixpkgs = a:opts.path_to_nixpkgs
  let cache_file = get(a:opts, 'cache_file', '')
  let names = a:opts.names

  let derivations = (cache_file == '' || !filereadable(cache_file)) ? {} : eval(readfile(cache_file)[0])
  let failed = {}
  for name in names
    try
      call nix#AddNixDerivation(path_to_nixpkgs, derivations, name)
    catch /.*/
      echom 'failed : '.name.' '.v:exception
      let failed[name] = v:exception
    endtry
  endfor
  echom join(keys(failed), ", ")
  echom string(failed)

  if cache_file != ''
    call writefile([string(derivations)], cache_file)
  endif

  enew
  for derivation in values(derivations)
    call append('$', split(derivation,"\n"))
  endfor
endf
