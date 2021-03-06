# lh-tags : a ctags wrapper for Vim
[![Last release](https://img.shields.io/github/tag/LucHermitte/lh-tags.svg)](https://github.com/LucHermitte/lh-tags/releases) [![Project Stats](https://www.openhub.net/p/21020/widgets/project_thin_badge.gif)](https://www.openhub.net/p/21020)

## Introduction

lh-tags is a ctags wrapper plugin for Vim.

This plugin has two main features:
 * The generation of `tags` files is simplified,
 * and tag selection is simplified (the support for overloads (when
   _overloading_ is supported) is more ergonomic than what
   [`:tselect`](http://vimhelp.appspot.com/tagsrch.txt.html#%3atselect)
   permits)

It also provides a feature aimed at plugin developpers:
 * an [API](doc/API.md) to request information on the current file -- local
   variables,
   information on an enumeration, function boundaries... In other Words, the
   API gives on-the-fly access to information that is not necesserally stored
   in the current tag database.

## Features

### Tags generation
 * Is portable: the plugin is regularly used on nixes, windows (with or without
   cygwin, and with
   [`'shellslash'`](http://vimhelp.appspot.com/options.txt.html#%27shellslash%27)
   on).
 * Is incremental: when a file under the watch of lh-tags is modified, only
   this file is parsed -- its previous information is deleted from the current
   `tags` file.
 * Can be run on the whole project, when needed.
 * Is, of course, [parametrisable](#options).
 * Can be run asynchronously (this is the default starting from Vim 7.4-1980).
   When this happens, [airline](https://github.com/vim-airline/vim-airline)
   will display information about the background jobs -- if _airline_ plugin is
   installed, of course.
 * Can be done on a third-party project freshly cloned/checked out without a
   need to define any configuration file for a
   [local_vimrc](http://github.com/LucHermitte/local_vimrc) plugin.
 * Doesn't have external dependencies other than `ctags` and `cd`.
   BTW, I highly recommend [universal ctags](http://github.com/universal-ctags/ctags)
   over exhuberant ctags.
 * Is project friendly: i.e. multiple projects can be opened simultaneously in
   a single vim session, and we can run `ctags` on each of them with different
   specialized options to produced dedicaded tag files.
 * Tag files built can be used to (automatically) fill
   [`'spellfile'`](http://vimhelp.appspot.com/options.txt.html#%27spellfile%27)
   option with words to be ignored by vim spell checker.
 * Generated tags can also automatically be highlighted (see
   `g:tags_options.auto_highlight`)

### Tags selection
 * Presents all tags that match the selected text (`META-W-META-DOWN`), or the
   pattern used (`:LHTags`).
 * Can hide, or show, functions signatures (on `s`).
 * Permits to sort the results by `K`ind, `N`ame, or `F`ilename.
 * Can filter the results on any (ctags) field (_kind_, _name_, _filename_,
   _signature_, _namespace_, ...)
 * The selected tag can be jumped to in the current window (`CR`,
   _double-click_), or in a split window (`o`) -- the tags stack is updated
   along the way.

![LHTags and filter demo](doc/screencast-LHTags.gif ":LHTags and filter demo")

## Usage

In order to use lh-tags, I highly recommend to use a plugin like
[local_vimrc](http://github.com/LucHermitte/local_vimrc).

In the buffer local section, you can:
 * set some `(bpg):tags_options....` if the default values don't suit you -- I
   use it to add exclusion lists in my projects.
 * force another root directory where to store the ctags database
 * ...

Then, you'll have to generate the `tags` database once (`<C-X>ta`), then you
can enjoy lh-tags automagic update of the database, and improved tag selection.

## Options
Regarding the conventions used in my plugins, and how to set options, see
the following
[documentation](https://github.com/LucHermitte/lh-vim-lib/blob/master/doc/Options.md).
I explain what I mean by `(bpg)`, what each scope covers, and how (and where)
related variables can be set.

### Directory and pathnames related options
lh-tags can distinguish the directory where a tag database is stored from the
directory where the source files are. By default, both directories will be the
same.

#### Dirname to source code: `(bpg):paths.tags.src_dir`

How ever this directory name is deduced, its value will be cached in the
[project variable](http://github.com/LucHermitte/lh-vim-lib/blob/master/doc/Project.md)
`p:paths.tags.src_dir`.

The heuristic to deduce where the source code to index is located consists in
searching the first option which is set among:

1. `(bpg):paths.tags.src_dir` -- cached, specific to lh-tags, permits to
   override `(bpg):paths.sources` if need be
2. `(bpg):tags_dirname` -- old (deprecated) options previously used by lh-tags
   V2; kept for retro-compatibility
3. `(bpg):paths.sources` -- where sources files are supposed to be found
   according to lh-vim-lib _Project feature_.
4. `b:project_source_dir` -- old option used by previous versions of
   [mu-template](https://github.com/LucHermitte/mu-template/); kept for
   retro-compatibility
5. `(bpg):BTW_project_config._.paths.sources` -- internal information used by
   [Build Tools Wrapper](https://github.com/LucHermitte/vim-build-tools-wrapper);
   not meant to be set from lh-tags
6. If none of the previous options is set, lh-tags will search a
   parent directory which contains any sign of being under source control
   (`.git/`, `.svn/`, `.hg/`...)
7. Ultimately, lh-tags asks to the end-user where the source files to index are
   stored (previous values are recorded in case several files from a same
   project are opened).

   Note: At this time, we cannot say _"never ask for this directory"_ as it's
   possible with lh-vim-lib _Project feature_. I'm likelly to change the
   current behaviour to the one used in lh-vim-lib.

#### Name of the tag database: `(pbg):tags_filename`
The name defaults to `"tags"` with ctags indexers.

This option permits to have another name -- this can be useful when all tag
databases are stored with a policy such as `projects/.tags/{projectname}.ctags`.

If you want to change the directory where the tag database is stored, it must
be done through this option. Relative pathnames are expressed relativelly to
the sources directory `(bpg):paths.tags.src_dir`.

### Filetypes and languages related options

#### Indexed filetype: `lh#tags#add_indexed_ft()`

This option helps managing the filetypes whose files will be indexed. Files of
other types are ignored.

Internally, this updates the project option `p:tags_options.indexed_ft` --
prefer this function when using
[local_vimrc](http://github.com/LucHermitte/local_vimrc) to configure a
project.

It's also possible to set the option `g:tags_options.indexed_ft` that'll be
used instead. The global option is meant to be used when no project are
defined.

```vim
" In this project we index only C and C++ files
:call lh#tags#add_indexed_ft('c', 'cpp')
```

#### Language map: `lh#tags#set_lang_map()`
Manages the extensions associated to a filetype.

The point of this helper function is to set the options to the best possible
value according to the current tag-indexer which could be exhuberant-ctags,
universal-ctags, or eventually any other indexer like _global_.

```vim
:call lh#tags#set_lang_map('cpp', '+.txx')
```

Since version 3.0.0, it's best to avoid to directly set
`b:tags_options.{ft}.flags` to either `--langmap=C++:+.txx` or
`--map-C++=+.txx` as it's not _portable_ between the various flavours of ctags.

### Option to highlight tags

 * `g:tags_options.auto_highlight` boolean option that tells to automatically
   highlight tags with `TagsGroup` style -- which is linked to `Special` group.

   Defaults to 0.

   This option is best set in your `.vimrc`. If you want to change or toggle
   its value, you'd best use the menu `Project->Tags->Auto Highlight Tags` when running
   gvim, or the `:Toggle` command:

   ```vim
   :Toggle ProjectTagsAutoHighlightTags
   ```

Notes:
 * At this point, there is a bug: the highlighting isn't propagated to all
   buffers.
 * This feature can incur an observable slow down with current
   non-multithreaded implementations of Vim.

### Options to add tags to the list of correctly spelled words

 * `lh#tags#ignore_spelling()` option permits to add all the current tags to
   Vim spellchecker ignore list. If no parameter is passed to the function, it
   will assume the dictionary file to be named `code-symbols-spell.{enc}.add`.
   If no file was specified in
   [`'spellfile'`](http://vimhelp.appspot.com/options.txt.html#%27spellfile%27),
   one is automatically added to contain words the end-user would want to
   manually register with [`zg`](http://vimhelp.appspot.com/spell.txt.html#zg)
   and all.

 * `g:tags_options.auto_spellfile_update` specifies whether spellfiles are
   automatically generated from updated tag files:
   - `0`    : _never_, use `CTRL-X_ts` instead.
   - `1`    : _always_
   - `"all"`: only when tags are regenerated for the whole project, never when
            a file is saved.

       Indeed, updating spellfile may be very long on some projects, and we may
       not wish to see this task automated.

 * `(bg):tags_to_spellfile` has been deprecated since Version 2.0.0. Use
   `lh#tags#ignore_spelling()` instead.

Note:
 * This feature can incur an observable slow down with current
   non-multithreaded implementations of Vim.

### Tag selection (options)

 * `(bpg):tags_select` defaults to `'expand('<cword>')'`; this policy says how
   the current word under the cursor is selected by normal mode mapping
   `META-W-META-DOWN`.

### Indexer related options

Since V 3.0.0, lh-tags can support multiple indexers. At this time only
indexers for ctags are supported. I'm likelly to eventually support _GNU
global_. Any other indexer needs to be typically dropped into
`{rtp}/autoload/lh/tags/indexers/{indexername}.vim`

If you want to contribute another indexer, check
`autoload/lh/tags/indexers/interface.vim` and the implementation of ctags
indexer.

 * `lh#tags#set_indexer(indexer [,scope])`

    This function permits to change the current indexer. The indexer will be
    binded to the specified scope (the default value is `"p"`).

#### Options common to all indexers

 * (V3.0+) `(bpg):tags_options.excludes`
   [List](http://vimhelp.appspot.com/eval.txt.html#List) of excluded patterns,
   in `ctags` format.

 * (V3.0+) `(bpg):tags_options._...` and `(bpg):tags_options._.{&ft}.... `
    dictionaries of options. This is the prefered way to specify ctags
    `--fields`, `--extra(s)` and `--kinds` parameters. The supported suboptions
    are:

    * all field names and shortcut names that can be obtained with `ctags
      --list-field`. The plugin will try to find the best fit for each indexer
      supported.
    * `absolute_path` used to generate absolute path of tag locations
    * `extract_local_variables`
    * `extract_variables`
    * TODO: add generic support for other kinds
    * `recursive_or_all` used internally to work on all files of a directory
    * `index_file` used internally to index a single file
    * `ft` to force a filetype

    Note: these options can also be injected while calling
    `cmd_line()` method on indexers.

    Indexers other than _ctags_ indexer are expected to translate the possible
    values to something they could understand.

#### Options specific to the ctags indexer

 * `(bpg):tags_executable` defaults to `"ctags"`; you should not need to change
   it unless you want to play with different flavours of ctags installed on a
   same system.

 * `(bpg):tags_must_go_recursive` defaults to 1; set it to 0 if you really want
   to not explore subdirectories.

 * `g:tags_options.explicit_cmdline'` -- default: 0;
    Tells to not rely on implicit options when indexing files. For instance,
    many _fields_ are enabled or disabled by default with ctags; this options
    will procude command line 100% explicit about which fields should produced,
    or ignored.

 * `(wbpg):tags_options.flags` defaults to an empty string; It contains extra
   flags you could pass to `ctags` execution. You may have to adjust these
   options to your needs. Note that most options are already covered by the
   indexer generic options: `(bpg):tags_options._...` and
   `(bpg):tags_options._.{&ft}....`.

 * (V2.0+) `(wbpg):tags_options.{ft}.flags` defaults to nothing since Version 3.0.
   It can be  used to set anything specific to a filetype, yet prefer the new
   dedicated interface to specify ctags `--fields`, `--extra(s)` and `--kinds`
   parameters.

   Note: This was renamed from `(bg):tags_options_{ft}` in version 2.0.0.

### Other options
 * `(bpg):tags_options.no_auto` defaults to 1; set it to 0 if you want to enable the
   automatic incremental update. IOW, if you want incremental update, force
   this option to 0.
   Note: this has changed in version 2.0.0; it used to be named
   `(bg):LHT_no_auto`, and it had the opposite default value.

 * `g:tags_options.run_in_bg` ; set to 1 by default, if
   |[+job](http://vimhelp.appspot.com/various.txt.html#%2bjob)|s are supported.
   Tells to execute `<Plug>CTagsUpdateCurrent` and `<Plug>CTagsUpdateAll` in
   background (through
   |[+job](http://vimhelp.appspot.com/various.txt.html#%2bjob)| feature).

   This option is best set in your `.vimrc`. If you want to change or toggle
   its value, you'd best use the menu `Project->Tags->Generate` when running
   gvim, or the `:Toggle` command:

   ```vim
   :Toggle ProjectTagsGenerate
   ```

  * `lh#tags#update_tagfiles()` instructs the plugin to automatically set
   `'tags'` with the current tagfile.
   This may be deprecated in the future for something less cumbersome to use.

### Example

A typical configuration file for
[local_vimrc](http://github.com/LucHermitte/local_vimrc) will be:

```vim
" #### In _vimrc_local.vim

" Define the project
Project --define FooBar

...
" ======================[ tags generation {{{2

" Be sure tags are automatically updated on the current file
LetIfUndef p:tags_options.no_auto 0

" Declare the indexed filetypes
call lh#tags#add_indexed_ft('c', 'cpp')

" Files and directories to ignore
LetIfUndef p:tags_options.excludes = ['"tests/*"', 'aspecificdir']

" Update Vim &tags option w/ the tag file produced for the current project
" (the folowing line is the only one which is required in all projects)
call lh#tags#update_tagfiles() " uses b:project_sources_dir/BTW_project_config

" Register ITK/OTB extensions as C++ extensions
call lh#tags#set_lang_map('cpp', '+.txx')

" Instruct to ignore spelling of code constructs
call lh#tags#ignore_spelling()

" But automatically when a file has been saved (this is too slow on OTB!)
LetIfUndef g:tags_options.auto_spellfile_update 'all'
```

## Mappings and commands

 * The tags for the current file can be explicitly updated with `CTRL-X_tc` --
   this mappings defaults to `<Plug>CTagsUpdateCurrent`
 * All the tags for the current project can be explicitly updated with
   `CTRL-X_ta` -- this mappings defaults to `<Plug>CTagsUpdateAll`
 * The list of words to ignore with the spellchecker can be updated on demand
   with `CTRL-X_ts` -- bound by default to `<Plug>CTagsUpdateSpell`
   This requires `lh#tags#ignore_spelling()` to have been explicitly called.
   Otherwise nothing will be done.
 * Tags matching the current word (or selection) will be presented on
   `META-W-META-DOWN` -- these two mappings default to `<Plug>CTagsSplitOpen`

 * We can also present the tags that match a pattern with `:LHTags` command
   (this command supports auto-completion on tag names)

## To Do

 * Tag selection
     * Have behaviour similar to the one from the quickfix mode (possibility to
       close and reopen the search window; prev&next moves)
     * Show/hide declarations -- merge declaration and definitions
     * Pluggable filters (that will check the number of parameters, their type, etc)
 * Tag generation
     * Get rid of `lh#tags#update_tagfiles()` is possible.
     * Be able to specify a directory to store all spellfiles automatically.
       `{prjroot}/spell/`, `{prjroot}/.spell/`?
     * `g:tags_options.auto_spellfile_update` should be overridable for each
       project.
     * See to update spellfile in the background thanks to Python.
     * Auto-update on other events like `CursorHold`
 * Auto-highlight tags
     * Cache tag list generated for spell file (as long it's not generated in
     background in another vim instance)
     * `g:tags_options.auto_highlight` should be overridable for each project.
     * Different highlighting for different Identifier kind (type, function,
     variable, ...)
     * Specify syn hl.
     * Incrementally add/remove highlighted keywords when tags are incrementally
     updated.
       * And do the same for ignored words

## Design Choices

 * 100% in Vim script language
 * [API](doc/API.md) usable from other plugins -- to extract function
   boundaries, local variables...
 * Avoid dependencies other than [lh-vim-lib](http://github.com/LucHermitte/lh-vim-lib)
 * Support project specific settings (options may differ from one project to
   the other)

## Installation
  * Requirements: Vim 7.2-295, [lh-vim-lib](http://github.com/LucHermitte/lh-vim-lib) v5.0.0
  * With [vim-addon-manager](https://github.com/MarcWeber/vim-addon-manager), install lh-tags (this is the preferred method because of the dependencies)

    ```vim
    ActivateAddons lh-tags
    ```

  * or with [vim-flavor](http://github.com/kana/vim-flavor) which also supports dependencies

    ```
    flavor 'LucHermitte/lh-tags'
    ```

  * or you can clone the git repositories

    ```bash
    git clone git@github.com:LucHermitte/lh-vim-lib.git
    git clone git@github.com:LucHermitte/lh-tags.git
    ```

  * or with Vundle/NeoBundle:

    ```vim
    Bundle 'LucHermitte/lh-vim-lib'
    Bundle 'LucHermitte/lh-tags'
    ```
