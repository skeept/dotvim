
This plugin provides a vim <--> VCS (currently mercurial, git and subversion) 
integration for your projects. Features:

  - Partially committing changes ([:AuRecord](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuRecord)).

  - Viewing file state at particular revision ([aurum://file](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#aurum%3A%2F%2Ffile), [:AuFile](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuFile)).

  - Viewing uncommited changes in a vimdiff, as well as changes between 
    specific revisions ([:AuVimDiff](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuVimDiff)). It is also possible to open multiple 
    tabs with all changes to all files viewed as side-by-side diffs.

  - Viewing revisions log ([:AuLog](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuLog)). Output is highly customizable.

  - Viewing working directory status ([:AuStatus](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuStatus)).

  - Commiting changes ([:AuCommit](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuCommit)), commit messages are remembered in case of 
    rollback ([g:aurum_remembermsg](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#g%3Aaurum_remembermsg)).

  - Obtaining various URL’s out of remote repository URL (like URL of the HTML 
    version of the current file with URL fragment pointing to the current line 
    attached: useful for sharing) ([:AuHyperlink](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuHyperlink)). For mercurial it also 
    supports git and subversion revisions (in case you are using hg-git and 
    hgsubversion respectively).

  - [aurum#changeset()](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#aurum%23changeset%28%29), [aurum#repository()](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#aurum%23repository%28%29) and [aurum#status()](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#aurum%23status%28%29) functions 
    that are to be used from modeline.

  - Frontends for various other VCS commands.

Most commands can be reached with a set of mappings (see [aurum-mappings](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#aurum-mappings)), 
all mappings are customizable.


Plugin’s mercurial driver is able to use mercurial python API as well as its 
CLI, but remember that the former is much slower and less tested. In order to 
use mercurial python API you must have vim compiled with +python (mercurial 
currently does not support python 3) and have mercurial in python’s sys.path 
(note: on windows msi installer is not adding mercurial to sys.path, so you 
won’t be able to use its python API).


Plugin requires some additional plugins:

  - [frawor](https://bitbucket.org/ZyX_I/frawor)

  - (optional) [ansi_esc_echo](https://bitbucket.org/ZyX_I/ansi_esc_echo)

  - (optional) one of

      - [Command-T](http://www.vim.org/scripts/script.php?script_id=3025)

      - [ctrlp](http://www.vim.org/scripts/script.php?script_id=3736)

      - [FuzzyFinder](http://www.vim.org/scripts/script.php?script_id=1984)

      - [unite](http://www.vim.org/scripts/script.php?script_id=3396)

      - [ku](http://www.vim.org/scripts/script.php?script_id=2337)

      - [tlib](http://www.vim.org/scripts/script.php?script_id=1863)

    for [:AuFile](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html#%3AAuFile) prompt option and a number of OpenAny/AnnotateAny mappings.

(with their dependencies).


Note: aurum supports [VAM](https://github.com/MarcWeber/vim-addon-manager). It 
      is prefered that you use it for aurum installation.

Documentation is available online at [http://vimpluginloader.sourceforge.net/doc/aurum.txt.html](http://vimpluginloader.sourceforge.net/doc/aurum.txt.html).
