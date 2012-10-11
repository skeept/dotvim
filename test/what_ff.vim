"use this script to check which files are in dos format according to vim
"use: in the folder that you want to check
"create a file, say res.txt
"> vim -u NONE --noplugins res.txt
"> in vim: source this_script.vim

python << EOF
import os
import vim

cur_buf =  vim.current.buffer 

IGNORE_START = ''.split()
IGNORE_END = '.pyc .swp .png ~'.split()

IGNORE_DIRS = '.hg .git dd_ .bzr'.split()

for dirpath, dirnames, fnames in os.walk(os.curdir):
  for dirn in dirnames:
    for diri in IGNORE_DIRS:
      if dirn.endswith(diri):
        dirnames.remove(dirn)
        break
  for fname in fnames:
    skip = False
    for fstart in IGNORE_START:
      if fname.startswith(fstart):
        skip = True
    for fend in IGNORE_END:
      if fname.endswith(fend):
        skip = True
    if skip is True:
      continue
    fname = os.path.join(dirpath, fname)
    vim.command('view {}'.format(fname))
    curr_ff = vim.eval('&ff')
    if vim.current.buffer != cur_buf:
      vim.command('bw!')
    if curr_ff == 'dos':
      cur_buf.append('{} {}'.format(curr_ff, fname))
EOF
