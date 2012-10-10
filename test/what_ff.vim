python << EOF
import os
import vim

cur_buf =  vim.current.buffer 

IGNORE_START = '.git'.split()
IGNORE_END = '.pyc'.split()

for dirpath, dirnames, fnames in os.walk(os.curdir):
  for fname in fnames:
    for fstart in IGNORE_START:
      if fname.startswith(fstart):
        continue
      for fend in IGNORE_END:
        if fname.endswith(fend):
          continue
    fname = os.path.join(dirpath, fname)
    vim.command('view {}'.format(fname))
    curr_ff = vim.eval('&ff')
    vim.command('bw!')
    cur_buf.append('{} {}'.format(curr_ff, fname))

EOF
