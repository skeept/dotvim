# Copilot Instructions

## Architecture

This is a personal Vim/Neovim configuration repository (`~/.vim`). Configuration loads through a modular pipeline:

```
vimrc (full) or simple.vim (lightweight)
  → local_settings.vim (optional machine-specific overrides)
  → plug_load.vim (vim-plug plugin declarations)
  → common.vim (shared settings, ~940 lines — the core of the config)
  → conf_plugins.rc.vim (plugin-specific configuration)
  → autoload/jraf.vim (lazy-loaded utility functions)
  → after/ftplugin/* (language-specific overrides)
```

- **`vimrc`** — Full-featured entry point. Sets `g:p0` (runtime path), `g:is_win` (platform flag), and `g:addon_manager` (plugin manager selector: 1=pathogen, 2=vam, 3=plug). Sources everything else.
- **`simple.vim`** — Minimal entry point for constrained environments. Sets `g:is_vimrc_simple = 1` and loads a subset of plugins.
- **`common.vim`** — Shared settings sourced by both entry points. Contains mappings, autocommands, completion config, statusline, and most non-plugin settings. Organized into `{{{`/`}}}` fold sections with banner comments.
- **`conf_plugins.rc.vim`** — Plugin configuration, separated from declarations.
- **`gvimrc`** — GUI-only settings (fonts, mouse, window size).
- **`_vsvimrc`** — VS Code VsVim extension config.

### Plugin Management

Three systems coexist:

1. **vim-plug** (`plug_load.vim` → `plugged/`) — Primary manager for ~46 active plugins.
2. **Native pack** (`pack/bundle/opt/`, `pack/bundle/start/`) — ~82 optional/lazy plugins loaded with `:packadd`.
3. **pathogen** (`autoload/pathogen.vim`) — Legacy, still present in autoload.

Conditional plugin loading uses a `Cond()` helper in `plug_load.vim`:
```vim
Plug 'plugin/name', Cond(v:version > 800)
```

Check if a plugin is available with `IsAddonActive('plugin-name')` (defined in `common.vim`).

### Key Directories

- **`keep/`** — Archived/experimental code, including a full Neovim LazyVim setup in Lua (`keep/nvim/`).
- **`dotfiles/`** — Chezmoi-managed dotfiles (git, tmux, starship, lazygit, etc.) using `dot_` prefix convention.
- **`snippets/`** — UltiSnips format (`.snippets`) plus one neosnippet file (`neo/cpp.snip`).
- **`test/`** — Ad-hoc test configs and reference scripts, not a formal test suite.

## Conventions

### Section Markers

Sections in `common.vim` and `conf_plugins.rc.vim` use fold markers with banner comments:
```vim
"================== SectionName =========================================={{{
" ... content ...
"==============================================================================}}}
```

### Plugin Configuration Pattern

Plugin-specific settings in `conf_plugins.rc.vim` guard on availability:
```vim
if IsAddonActive('plugin-name')
  " configuration here
endif
```

### Autoload Namespace

Custom utility functions live in `autoload/jraf.vim` under the `jraf#` namespace (e.g., `jraf#stripTrailingWhitespace()`, `jraf#loadCtrlP()`). Work-related utilities use `autoload/wk.vim` under the `wk#` namespace.

### Mapping Prefixes

- `,` (comma) — Primary command prefix (e.g., `,ff` for FilePicker, `,di` for registers)
- `<Space>` — Alternative/plugin commands
- Function keys — F1=save, F3=NERDTree, F4=close tab, F9=quickrun, F10=snippets
- `;` and `:` are swapped for faster command-line access

### Platform Handling

Cross-platform logic uses `g:is_win` and `g:p0`:
```vim
let g:p0 = g:is_win ? expand('~/vimfiles') : expand('~/.vim')
```

## Scripts

- **`add_plugged.py`** — Force-adds all plugin files under `plugged/` to git (bypassing `.gitignore`). Usage: `python add_plugged.py --path plugged`
- **`doSetUpProgs.py`** — Creates symlinks from a source directory to a destination. Usage: `python doSetUpProgs.py <origin> [destination]`
- **`update_addons.sh`** — Runs migration scripts for plugins in `pack/bundle/` and shows git status.
