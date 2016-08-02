vim-peekaboo
============

![](https://cloud.githubusercontent.com/assets/700826/6095261/bb00340c-af96-11e4-9df5-9cd869673a11.gif)

Peekaboo extends `"` and `@` in normal mode and `<CTRL-R>` in insert mode so
you can see the contents of the registers.

Installation
------------

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'junegunn/vim-peekaboo'
```

Usage
-----

Peekaboo will show you the contents of the registers on the sidebar when you
hit `"` or `@` in normal mode or `<CTRL-R>` in insert mode. The sidebar is
automatically closed on subsequent key strokes.

You can toggle fullscreen mode by pressing spacebar.

Customization
-------------

```vim
" Default peekaboo window
let g:peekaboo_window = 'vertical botright 30new'

" Delay opening of peekaboo window (in ms. default: 0)
let g:peekaboo_delay = 750

" Compact display; do not display the names of the register groups
let g:peekaboo_compact = 1

" Prefix for the peekaboo key mapping (default: '')
let g:peekaboo_prefix = '<leader>'

" Prefix for CTRL-R insert key mapping (default: '')
let g:peekaboo_ins_prefix = '<c-x>'
```

FAQ
---

### "Peekaboo conflicts with my maps and abbrevs"

Use non-recursive maps and abbreviations (e.g. `nnoremap`, `inoreabbrev`) so
that they are not expanded. It is strongly advised that [you always stick to
`nore`-versions][m] unless you know exactly what you're doing.

[m]: http://learnvimscriptthehardway.stevelosh.com/chapters/05.html

### "Can I use Peekaboo in command-line mode?"

There's no native support for command-line mode, but it's possible with another
plugin. See [here](https://github.com/junegunn/vim-peekaboo/issues/23#issuecomment-84500667).

Known issues
------------

### Compatibility with macros

Peekaboo internally uses `feedkeys()` function which can break macros. So
Peekaboo temporarily disables itself when replaying macros with `@`. However,
if you invoke `@` via a non-recursive map (e.g. `nnoremap Q @q`), Peekaboo
doesn't get a chance to do so and your macros may not work as expected. The
workaround is to use recursive maps: `nmap Q @q`.

License
-------

MIT

