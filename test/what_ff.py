#1/usr/bin/env python

import os
import sys
import textwrap

TOP_FOLDER=os.path.join('C:\\Users\\faramir', 'vimfiles')

# create vim script
def create_vim_script(fscript, fname):
  fout = open(fscript, 'w')
  fout.write(textwrap.dedent("""\
    python <<< END
    import vim
    ft = vim.eval('&ff')
    fout = open('xxx.res', 'w')
    fout.write(ft)
    fout.close()
    END"""))

  cmd = 'vim {0} -u NONE --noplugins -c "source {1}" -c quit'.format(fname, fscript)
  #cmd = 'vim {0} -u NONE --noplugins -c "source {1}"'.format(fname, fscript)
  #print cmd
  os.system(cmd)
  res = open('xxx.res', 'r').read().strip()
  return res

IGNORE_START = '.git'.split()
IGNORE_END = '.pyc'.split()

def walk_and_get_res(top_folder=TOP_FOLDER):
  all_res = []
  for dirpath, dirnames, fnames in os.walk(top_folder):
    for fname in fnames:
      for fstart in IGNORE_START:
        if fname.startswith(fstart):
          continue
        for fend in IGNORE_END:
          if fname.endswith(fend):
            continue
      fname = os.path.join(dirpath, fname)
      script_name = os.path.join(os.path.abspath(os.curdir), 'get_name.vim')
      res = create_vim_script(script_name, fname)
      all_res.append(res)
  print all_res



if __name__ == '__main__':
  walk_and_get_res()      
