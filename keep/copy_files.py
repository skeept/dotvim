"""Copy files to/from config folder."""

import argparse
import dataclasses
import enum
import filecmp
import os
import shutil
import subprocess
from pathlib import Path
from typing import Optional
import typing


@dataclasses.dataclass
class FolderConfig:
    actual: Path
    local: Path
    skip: list[str] = dataclasses.field(default_factory=list)

    @classmethod
    def nvim(cls, windows: Optional[bool] = None):
        """Get nvim config.

        windows option is to force windows path (e.g. for WSL)."""
        conf_dir = (
            Path(os.path.expandvars(r"%LOCALAPPDATA%"))
            if os.name == "nt"
            else (
                Path("/mnt/c/Users/SG0216489/AppData/Local")
                if windows
                else Path.home() / ".config"
            )
        )
        skip = ["example.lua", "lazy.lua"]
        return cls(actual=conf_dir / "nvim/lua", local=Path("nvim/lua"), skip=skip)

    def flip(self):
        return FolderConfig(actual=self.local, local=self.actual)


def get_all_elements(name: Path, skip: list[str]) -> typing.Iterator[Path]:
    """Get all elements recursively."""
    for elem in name.iterdir():
        if elem.name in skip:
            print(f"Skipping {elem}")
            continue
        yield elem
        if elem.is_dir():
            yield from get_all_elements(elem, skip=skip)


class CmpStatus(enum.Enum):
    """Status of file comparison."""

    same = enum.auto()
    missing = enum.auto()
    diff = enum.auto()


def copy_files(
    origin: Path,
    destination: Path,
    skip: list[str],
    backup_folder: Path = Path("tmp"),
    dry_run: bool = True,
    display_all: bool = False,
    show_diff: bool = True,
) -> None:
    """Assume folders and copy nested files."""
    show_diff = not dry_run or show_diff
    has_delta = shutil.which("delta") is not None
    for elem in get_all_elements(origin, skip=skip):
        status = CmpStatus.same
        target = destination / elem.relative_to(origin)
        if not target.exists():
            status = CmpStatus.missing
        elif not elem.is_dir() and not filecmp.cmp(elem, target, shallow=False):
            status = CmpStatus.diff
        if display_all or status != CmpStatus.same:
            print(f"{status.name:<7} {elem!s:<50} => {target}")
            if show_diff and status == CmpStatus.diff and has_delta:
                delta_options = ["--side-by-side"]
                subprocess.run(["delta", *delta_options, elem, target], check=False)

        if not dry_run:
            if not backup_folder.is_dir():
                backup_folder.mkdir(parents=True, exist_ok=True)
            if elem.is_dir():
                target.mkdir(exist_ok=True, parents=True)
            elif status != CmpStatus.same:
                # copy item to be overridden to backup
                if target.exists():
                    shutil.copy(target, backup_folder)
                shutil.copy(elem, target)


def main() -> None:
    """Set args and copy."""
    parser = argparse.ArgumentParser("copy files from folder.")
    parser.add_argument(
        "-o",
        "--other_direction",
        help="reverse copy destination",
        action="store_true",
    )
    parser.add_argument("-c", "--copy", action="store_true", help="copy the files")
    parser.add_argument(
        "-d",
        "--hide_diff",
        action="store_true",
        help="hide diff output",
    )
    parser.add_argument(
        "-w",
        "--windows",
        action="store_true",
        help="use windows path",
        default=None,
    )
    args = parser.parse_args()

    nvim = FolderConfig.nvim(args.windows)
    origin, dest, _ = (
        dataclasses.astuple(nvim)
        if args.other_direction
        else dataclasses.astuple(nvim.flip())
    )
    dry_run = not args.copy
    copy_files(
        origin, dest, skip=nvim.skip, dry_run=dry_run, show_diff=not args.hide_diff
    )


if __name__ == "__main__":
    main()
