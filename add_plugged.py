#!/usr/bin/env python3

# loop over all the files in plugged (ignore .git) and add those to git index

import os
import subprocess
import argparse
from os.path import basename, join, isdir


def get_individual_files(pathn):
    for root, _, files in os.walk(pathn):
        for fn in files:
            if basename(fn) == "tags":
                continue
            # can add more exceptions
            yield join(root, fn)


def git_force_add(pathn):
    """git force add files or folder"""
    if isdir(pathn):
        files = list(get_individual_files(pathn))
    else:
        files = [pathn]

    if not files:
        return
    files = " ".join(files)

    cmd = f"git add --force {files}".split()
    subprocess.run(cmd)


def add_path(pathn):
    path_is_plugged = basename(pathn) == "plugged"
    packages = os.listdir(pathn) if path_is_plugged else [pathn]
    if not path_is_plugged:
        pathn = ""
    for dirn in packages:
        curdir = join(pathn, dirn)
        for fn in os.listdir(curdir):
            if fn == ".git":
                continue
            fn = join(curdir, fn)
            print("***", fn)
            git_force_add(fn)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--path", help="path to convert", default="plugged")

    args = parser.parse_args()
    add_path(args.path)


if __name__ == "__main__":
    main()
