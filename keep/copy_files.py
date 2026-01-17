"""Copy files to/from config folder."""

import argparse
import dataclasses
import enum
import filecmp
import os
import shutil
import subprocess
import typing
from pathlib import Path
from typing import Optional

GLOBAL_SKIP = [".git", ".ruff_cache"]

# Configuration for different diff tools
DIFF_TOOLS = {
    "delta": ["--side-by-side"],
    # "difft": ["--display", "side-by-side"],
    "difft": [],
    "diff": ["-u", "--color=auto"],  # Standard diff with color
    "none": [],
}


@dataclasses.dataclass
class FolderConfig:
    """Configuration for source and destination folders."""

    actual: Path
    local: Path
    skip: list[str] = dataclasses.field(default_factory=list)

    @classmethod
    def nvim(cls, windows: Optional[bool] = None):
        """Get nvim config.
        windows option is to force windows path (e.g. for WSL).
        """
        conf_dir = (
            Path(os.path.expandvars(r"%LOCALAPPDATA%"))
            if os.name == "nt"
            else (
                Path("/mnt/c/Users/SG0216489/AppData/Local")
                if windows
                else Path.home() / ".config"
            )
        )
        # Add global ignores here
        skip = ["example.lua", "lazy-lock.json", *GLOBAL_SKIP]
        return cls(actual=conf_dir / "nvim", local=Path("nvim"), skip=skip)

    def flip(self):
        """Swap the actual and local paths."""
        return FolderConfig(actual=self.local, local=self.actual)


def get_all_elements(name: Path, skip: list[str]) -> typing.Iterator[Path]:
    """Get all elements recursively, honoring the skip list."""
    for elem in name.iterdir():
        if elem.name in skip:
            # print(f"Skipping {elem}") # Optional: commented out to reduce noise
            continue
        yield elem
        if elem.is_dir():
            yield from get_all_elements(elem, skip=skip)


class CmpStatus(enum.Enum):
    """Status of file comparison."""

    same = enum.auto()
    missing = enum.auto()
    diff = enum.auto()


def run_diff(tool_name: str, file_a: Path, file_b: Path) -> None:
    """Run the specified diff tool if available."""
    if tool_name == "none":
        return

    # Check if tool exists in path
    if not shutil.which(tool_name):
        print(f"  [Warning] Diff tool '{tool_name}' not found in PATH.")
        return

    options = DIFF_TOOLS.get(tool_name, [])
    try:
        subprocess.run([tool_name, *options, str(file_a), str(file_b)], check=False)
    except subprocess.SubprocessError as e:
        print(f"  [Error] Failed to run diff: {e}")


def copy_files(
    origin: Path,
    destination: Path,
    skip: list[str],
    backup_folder: Path = Path("tmp"),
    dry_run: bool = True,
    display_all: bool = False,
    diff_tool: str = "delta",
) -> None:
    """Assume folders and copy nested files."""
    
    # If dry_run is True, we generally want to see diffs unless explicitly set to 'none'
    # logic handled by caller passing appropriate diff_tool string

    origin.mkdir(parents=True, exist_ok=True)
    destination.mkdir(parents=True, exist_ok=True)

    for elem in get_all_elements(origin, skip=skip):
        status = CmpStatus.same
        target = destination / elem.relative_to(origin)

        if not target.exists():
            status = CmpStatus.missing
        elif not elem.is_dir() and not filecmp.cmp(elem, target, shallow=False):
            status = CmpStatus.diff

        if display_all or status != CmpStatus.same:
            print(f"{status.name:<7} {elem!s:<50} => {target}")
            
            if status == CmpStatus.diff:
                run_diff(diff_tool, elem, target)

        if not dry_run:
            if not backup_folder.is_dir():
                backup_folder.mkdir(parents=True, exist_ok=True)

            if elem.is_dir():
                target.mkdir(exist_ok=True, parents=True)
            elif status != CmpStatus.same:
                if target.exists():
                    shutil.copy(target, backup_folder)
                shutil.copy(elem, target)


def main() -> None:
    """Set args and copy."""
    default_tool = "difft"
    parser = argparse.ArgumentParser("copy files from folder.")
    parser.add_argument(
        "-o",
        "--other-direction",
        help="reverse copy destination",
        action="store_true",
    )
    parser.add_argument("-c", "--copy", action="store_true", help="copy the files")
    
    # Updated -d argument
    parser.add_argument(
        "-d",
        "--diff-tool",
        choices=DIFF_TOOLS.keys(),
        default=default_tool,
        help=f"Select diff tool (default: {default_tool}). Use 'none' to hide diffs.",
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
    
    # If copying (not dry run), you might want to suppress diffs by default 
    # unless user explicitly asked for a tool. 
    # For now, it respects the -d argument regardless of dry_run status.
    
    copy_files(
        origin,
        dest,
        skip=nvim.skip,
        dry_run=dry_run,
        diff_tool=args.diff_tool,
    )


if __name__ == "__main__":
    main()