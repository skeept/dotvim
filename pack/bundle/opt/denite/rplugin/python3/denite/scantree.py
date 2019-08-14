# ============================================================================
# FILE: scantree.py
# AUTHOR: Jorge Rodrigues <skeept at gmail.com>
# License: MIT license
# ============================================================================

import sys
from os import curdir, scandir
from os.path import basename
import argparse
import fnmatch
import time
import typing

DEFAULT_SKIP_LIST = ['.git', '.hg']
SkipList = typing.Optional[typing.List[str]]


def scantree(path_name: str, skip_list: SkipList = None,
             types: str = 'f') -> typing.Generator[str, None, None]:
    """This function returns the files present in path_name, including the
    files present in subfolders.

    Implementation uses scandir, if available, as it is faster than
    os.walk"""

    if skip_list is None:
        skip_list = DEFAULT_SKIP_LIST

    try:
        for entry in (e for e in scandir(path_name)
                      if not is_ignored(e.path, skip_list)):
            if entry.is_dir(follow_symlinks=False):
                if 'd' in types:
                    yield entry.path
                yield from scantree(entry.path, skip_list, types)
            elif 'f' in types:
                yield entry.path
    except PermissionError:
        yield f'PermissionError reading {path_name}'


def output_lines(lines: typing.List[str]) -> None:
    try:
        sys.stdout.write(''.join(lines))
        sys.stdout.flush()
    except UnicodeEncodeError:
        pass


def is_ignored(name: str, ignore_list: typing.List[str]) -> bool:
    """checks if file name matches the ignore list"""
    name = basename(name)
    return bool(any(fnmatch.fnmatch(name, p) for p in ignore_list))


def output_files() -> None:
    """print the list of files to stdout"""
    parser = argparse.ArgumentParser()
    parser.add_argument('--path', type=str, default=curdir,
                        help='path to look for the files')
    parser.add_argument('--ignore', type=str,
                        help='command separated list of patterns to ignore',
                        default='.hg,.git')
    parser.add_argument('--type', type=str, nargs='*',
                        choices=['f', 'd'], default='f',
                        help='output file types')

    args = parser.parse_args()
    ignore = list(set(args.ignore.split(',')))
    types = ''.join(set(args.type))
    # later we can account for more paths
    for path_name in [args.path]:
        curr_list = []
        max_size = 40
        max_time_without_write = 0.005
        last_write_time = time.time()
        for name in scantree(path_name, ignore, types):
            curr_list.append(name + '\n')
            if (len(curr_list) >= max_size or curr_list and
                    time.time() - last_write_time > max_time_without_write):
                output_lines(curr_list)
                curr_list = []
                last_write_time = time.time()

        if curr_list:
            output_lines(curr_list)


if __name__ == "__main__":
    output_files()
