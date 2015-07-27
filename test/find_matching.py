#!/usr/bin/env python
# -*- coding: utf-8 -*-


"""Find matching files or folders"""

import os
import sys


def find_matching(folder_name, folder_criteria=None, folder_action=None, file_criteria=None, file_action=None):
    """find files or folders according to criteria and apply criteria"""
    default_action = lambda x : sys.stdout.write("{}\n".format(x))
    if file_action is None:
        file_action = default_action
    if folder_action is None:
        folder_action = default_action
    for root, dirs, files in os.walk(folder_name):
        if '.git' in dirs:
            dirs.remove('.git')
        if file_criteria is not None:
            for ff in files:
                fname = os.path.join(root,)
                if file_criteria(fname):
                    file_action(fname)
        if folder_criteria(root):
            folder_action(root)


def empty_folder_or_with_tags(name):
    all_files = os.listdir(name)
    return len([x for x in all_files if x != 'tags']) == 0

def fd_do(root):
    print(root)
    print(os.listdir(root))
    print(" ")

if __name__ == "__main__":
    any_folder = lambda x : True
    find_matching('.', folder_criteria=empty_folder_or_with_tags, folder_action=None)
