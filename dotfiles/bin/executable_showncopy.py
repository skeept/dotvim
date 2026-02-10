#!/usr/bin/env python3
import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Iterator, Optional

# --- Configuration ---
SKIP_FILES = {
    ".tfstate",
    ".tfstate.backup",
    ".terraform.lock.hcl",
    "DS_Store",
    "LICENCE",
    "lazy-lock.json",
}
SKIP_DIRS = {
    ".terraform",
    ".git",
    "node_modules",
    "__pycache__",
    ".venv",
    ".ruff_cache",
}


def is_binary(file_path: Path) -> bool:
    """Check if a file is binary by looking for a null byte in the first 1kb."""
    try:
        with file_path.open("rb") as f:
            return b"\x00" in f.read(1024)
    except (PermissionError, OSError):
        return True


def iter_files(path: Path) -> Iterator[Path]:
    """Recursively yields non-binary, non-skipped files."""
    if path.is_dir():
        if path.name in SKIP_DIRS:
            return
        try:
            # Sorting ensures deterministic output order
            for entry in sorted(path.iterdir()):
                yield from iter_files(entry)
        except PermissionError:
            print(f"![Permission Denied]: {path}", file=sys.stderr)
    elif path.is_file():
        if path.name in SKIP_FILES or any(
            path.name.endswith(ext) for ext in SKIP_FILES
        ):
            return
        if is_binary(path):
            return
        yield path


def copy_to_clipboard(text: str) -> None:
    """Universal clipboard support with priority for native tools."""
    # macOS
    if sys.platform == "darwin" and shutil.which("pbcopy"):
        cmd = ["pbcopy"]
    # Linux (X11)
    elif shutil.which("xclip"):
        cmd = ["xclip", "-selection", "clipboard"]
    # Linux (Wayland)
    elif shutil.which("wl-copy"):
        cmd = ["wl-copy"]
    # Windows / WSL
    elif shutil.which("clip.exe"):
        # clip.exe expects UTF-16 usually, but UTF-8 often works with CRLF
        text = text.replace("\n", "\r\n")
        cmd = ["clip.exe"]
    else:
        print(
            "\n[!] No clipboard tool found (xclip, wl-copy, pbcopy, or clip.exe).",
            file=sys.stderr,
        )
        return

    try:
        subprocess.run(cmd, input=text.encode("utf-8"), check=True)
        print(f"\nCopied to clipboard using {cmd[0]}")
    except subprocess.CalledProcessError as e:
        print(f"\nClipboard error: {e}", file=sys.stderr)


def process_files(paths: list[str], truncate: Optional[int], *, show: bool) -> None:
    output_parts = []

    for p in paths:
        for file_path in iter_files(Path(p)):
            header = f"============ FILE: {file_path} ============"
            try:
                content_lines = []
                with file_path.open("r", encoding="utf-8", errors="replace") as f:
                    if truncate:
                        for i, line in enumerate(f):
                            if i >= truncate:
                                content_lines.append("[... truncated ...]\n")
                                break
                            content_lines.append(line)
                    else:
                        content_lines = f.readlines()

                content = "".join(content_lines)
                formatted_block = f"{header}\n{content}\n"

                if show:
                    print(formatted_block)
                else:
                    print(header)
                output_parts.append(formatted_block)

            except Exception as e:
                error_msg = f"{header}\n[Error reading file: {e}]\n"
                print(error_msg, file=sys.stderr)

    if output_parts:
        copy_to_clipboard("".join(output_parts))
    else:
        print("No readable text files found.", file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(
        description="Concatenate files into a single clipboard-ready string.",
        formatter_class=argparse.RawTextHelpFormatter,
    )
    parser.add_argument("paths", nargs="+", help="Files or directories to scan.")
    parser.add_argument(
        "-t",
        "--truncate",
        type=int,
        nargs="?",
        const=20,
        help="Truncate files to N lines (default 20 if flag is set).",
    )
    parser.add_argument(
        "-s", "--show", help="print file to stdout", action="store_true"
    )

    args = parser.parse_args()
    process_files(args.paths, args.truncate, show=args.show)


if __name__ == "__main__":
    main()
