"""Copy files to/from config folder."""

import argparse
from pathlib import Path
import os
import shutil

def get_all_elems(name: Path):
    """Get all elements recursively."""
    for elem in name.iterdir():
        yield elem
        if elem.is_dir():
            yield from get_all_elems(elem)

def copy_files(origin: Path, destination: Path, dry_run:bool=True) -> None:
    """Assume folders and copy nested files."""
    for elem in get_all_elems(origin):
        print(elem, elem.relative_to(origin))
    if not dry_run:
        for elem in get_all_elems(origin):
            backup = destination / elem.relative_to(origin)
            if elem.is_dir():
                backup.mkdir(exist_ok=True, parents=True)
            else:
                shutil.copy(elem, backup)


def main():
    """setup args and do the copy."""
    parser = argparse.ArgumentParser("copy files from folder.")
    parser.add_argument("-c", "--copy", help="copy from", action="store_true")
    parser.add_argument("-f", "--force", action="store_true", help="copy the files")
    args = parser.parse_args()

    nvim_conf = Path.home() / ".config/nvim/lua"
    saved = Path("lua")
    saved.mkdir(exist_ok=True, parents=True)

    if args.copy:
        dry_run = not args.force
        copy_files(nvim_conf, saved, dry_run=dry_run)
    else:
        copy_files(saved, nvim_conf, dry_run=dry_run)


if __name__ == "__main__":
    main()
