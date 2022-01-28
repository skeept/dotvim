__doc__ = (
    """ loop over all the files in plugged (ignore .git) and add those to git index"""
)

import os
import subprocess
import argparse
from os.path import basename, join, isdir
from typing import Generator


def get_individual_files(path_name: str) -> Generator[str, None, None]:
    for root, _, files in os.walk(path_name):
        for fn in files:
            if basename(fn) == "tags":
                continue
            # can add more exceptions
            yield join(root, fn)


def git_force_add(path_name: str) -> None:
    """git force add files or folder"""
    if isdir(path_name):
        files = list(get_individual_files(path_name))
    else:
        files = [path_name]

    if not files:
        return
    files = " ".join(files)

    cmd = f"git add --force {files}".split()
    subprocess.run(cmd)


def add_path(path_name: str) -> None:
    path_is_plugged = basename(path_name) == "plugged"
    packages = os.listdir(path_name) if path_is_plugged else [path_name]
    if not path_is_plugged:
        path_name = ""
    for dir_name in packages:
        curdir = join(path_name, dir_name)
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
