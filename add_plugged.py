#!/usr/bin/env python3

# loop over all the files in plugged (ignore .git) and add those to git index

import os
import subprocess

def force_add(pathn):
    cmd = F'git add --force {pathn}'.split()
    subprocess.run(cmd)

for dirn in os.listdir('plugged'):
    curdir = os.path.join('plugged', dirn)
    for fn in os.listdir(curdir):
        if fn == '.git':
            continue
        fn = os.path.join(curdir, fn)
        print(fn)
        force_add(fn)

