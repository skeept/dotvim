"""Loop over all the files in plugged (ignore .git) and add those to git index."""

import argparse
import subprocess
import typing
from pathlib import Path


def get_individual_files(path_name: Path) -> typing.Iterator[Path]:
    """Get all files in specific folder."""
    if path_name.is_file():
        yield path_name
        return
    for fn in path_name.glob("**/*"):
        if fn.name == "tags":
            continue
        yield fn


def git_force_add(path_name: Path) -> None:
    """Use --force arg to git to force add files or folder."""
    files = list(get_individual_files(path_name=path_name))
    if not files:
        return

    cmd = "git add --force".split()
    cmd.extend(str(fn) for fn in files)
    subprocess.run(cmd)


def add_path(path_name: Path) -> None:
    """Add specific path."""
    path_is_plugged = path_name.name == "plugged"
    packages = list(path_name.iterdir()) if path_is_plugged else [path_name]
    for dir_name in packages:
        for fn in dir_name.iterdir():
            if fn.name == ".git":
                continue
            print("***", fn)
            git_force_add(fn)


def main() -> None:
    """Parse arguments and run action."""
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--path", help="path to convert", default="plugged")

    args = parser.parse_args()
    add_path(Path(args.path))


if __name__ == "__main__":
    main()
