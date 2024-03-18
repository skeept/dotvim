"""Copy files to/from config folder."""

import argparse
import os
import shutil
from pathlib import Path


def get_all_elems(name: Path):
    """Get all elements recursively."""
    for elem in name.iterdir():
        yield elem
        if elem.is_dir():
            yield from get_all_elems(elem)


def copy_files(origin: Path, destination: Path, dry_run: bool = True) -> None:
    """Assume folders and copy nested files."""
    for elem in get_all_elems(origin):
        backup = destination / elem.relative_to(origin)
        print(f"{str(elem):<50} => {backup}")
    if not dry_run:
        for elem in get_all_elems(origin):
            backup = destination / elem.relative_to(origin)
            if elem.is_dir():
                backup.mkdir(exist_ok=True, parents=True)
            else:
                shutil.copy(elem, backup)


def main() -> None:
    """Setup args and copy."""
    parser = argparse.ArgumentParser("copy files from folder.")
    parser.add_argument("-c", "--copy", help="copy from", action="store_true")
    parser.add_argument("-f", "--force", action="store_true", help="copy the files")
    args = parser.parse_args()

    nvim_conf_dir = (
        Path(os.path.expandvars(r"%LOCALAPPDATA%\nvim"))
        if os.name == "nt"
        else Path.home() / ".config/nvim"
    )
    nvim_conf = nvim_conf_dir / "lua"

    saved = Path("lua")
    saved.mkdir(exist_ok=True, parents=True)

    origin, dest = (nvim_conf, saved) if args.copy else (saved, nvim_conf)
    dry_run = not args.force
    copy_files(origin, dest, dry_run=dry_run)


if __name__ == "__main__":
    main()
