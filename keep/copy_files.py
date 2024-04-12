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

WINDOWS_PATH = Path("/mnt/c/Users/SG0216489/AppData/Local")


@dataclasses.dataclass
class FolderConfig:
    actual: Path
    local: Path

    @classmethod
    def nvim(cls, windows: Optional[bool] = None):
        """Get nvim config."""
        conf_dir = (
            Path(os.path.expandvars(r"%LOCALAPPDATA%"))
            if os.name == "nt"
            else (WINDOWS_PATH if windows else Path.home() / ".config")
        )
        return cls(actual=conf_dir / "nvim/lua", local=Path("nvim/lua"))

    def flip(self):
        return FolderConfig(actual=self.local, local=self.actual)


def get_all_elements(name: Path):
    """Get all elements recursively."""
    for elem in name.iterdir():
        yield elem
        if elem.is_dir():
            yield from get_all_elements(elem)


class CmpStatus(enum.Enum):
    """Status of file comparison."""

    same = enum.auto()
    missing = enum.auto()
    diff = enum.auto()


def copy_files(
    origin: Path,
    destination: Path,
    dry_run: bool = True,
    display_all: bool = False,
    show_diff: bool = True,
) -> None:
    """Assume folders and copy nested files."""
    show_diff = not dry_run or show_diff
    for elem in get_all_elements(origin):
        status = CmpStatus.same
        backup = destination / elem.relative_to(origin)
        if not backup.exists():
            status = CmpStatus.missing
        elif not elem.is_dir() and not filecmp.cmp(elem, backup, shallow=False):
            status = CmpStatus.diff
        if display_all or status != CmpStatus.same:
            print(f"{status.name:<7} {elem!s:<50} => {backup}")
            if show_diff and status == CmpStatus.diff and shutil.which("delta"):
                delta_options = ["--side-by-side"]
                subprocess.run(["delta", *delta_options, elem, backup], check=False)

        if not dry_run:
            if elem.is_dir():
                backup.mkdir(exist_ok=True, parents=True)
            elif status != CmpStatus.same:
                shutil.copy(elem, backup)


def main() -> None:
    """Set args and copy."""
    parser = argparse.ArgumentParser("copy files from folder.")
    parser.add_argument(
        "-o", "--other_direction", help="reverse copy destination", action="store_true",
    )
    parser.add_argument("-c", "--copy", action="store_true", help="copy the files")
    parser.add_argument(
        "-d", "--hide_diff", action="store_true", help="hide diff output",
    )
    parser.add_argument(
        "-w", "--windows", action="store_true", help="use windows path", default=None,
    )
    args = parser.parse_args()

    nvim = FolderConfig.nvim(args.windows)
    origin, dest = (
        dataclasses.astuple(nvim)
        if args.other_direction
        else dataclasses.astuple(nvim.flip())
    )
    dry_run = not args.copy
    copy_files(origin, dest, dry_run=dry_run, show_diff=not args.hide_diff)


if __name__ == "__main__":
    main()
