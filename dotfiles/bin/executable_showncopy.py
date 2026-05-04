#!/usr/bin/env python3

import argparse
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


def copy_to_clipboard(text: str, force_pwsh: bool = False) -> None:
    """Universal clipboard support with optional PowerShell override for WSL."""
    cmd = []
    input_bytes = text.encode("utf-8")

    # If user explicitly asks for PowerShell (great for large WSL transfers)
    if force_pwsh and shutil.which("powershell.exe"):
        cmd = ["powershell.exe", "-NoProfile", "-Command", "$input | Set-Clipboard"]
        # PowerShell often handles large pipes better if we encode as UTF-16
        input_bytes = text.encode("utf-16")

    # Default Hierarchy
    elif shutil.which("xclip"):
        cmd = ["xclip", "-selection", "clipboard"]
    elif shutil.which("wl-copy"):
        cmd = ["wl-copy"]
    elif sys.platform == "darwin" and shutil.which("pbcopy"):
        cmd = ["pbcopy"]
    elif shutil.which("clip.exe"):
        text = text.replace("\n", "\r\n")
        cmd = ["clip.exe"]
        input_bytes = text.encode("utf-8")

    if not cmd:
        print("\n[!] No suitable clipboard tool found.", file=sys.stderr)
        return

    try:
        subprocess.run(cmd, input=input_bytes, check=True)
        print(f"\nCopied to clipboard using {cmd[0]}")
    except subprocess.CalledProcessError as e:
        print(f"\nClipboard error with {cmd[0]}: {e}", file=sys.stderr)


def process_files(
    paths: list[str], truncate: Optional[int], show: bool, force_pwsh: bool
) -> None:
    output_parts = []

    for p in paths:
        for file_path in iter_files(Path(p)):
            try:
                with file_path.open("r", encoding="utf-8", errors="replace") as f:
                    all_lines = f.readlines()

                total_lines = len(all_lines)

                # Logic for the header line count string
                if truncate and total_lines > truncate:
                    line_info = f"{truncate}/{total_lines}"
                    content_lines = all_lines[:truncate]
                    content_lines.append("[... truncated ...]\n")
                else:
                    line_info = str(total_lines)
                    content_lines = all_lines

                header = (
                    f"============ FILE: {file_path} ({line_info} lines) ============"
                )
                content = "".join(content_lines)
                formatted_block = f"{header}\n{content}\n"

                if show:
                    print(formatted_block)
                else:
                    print(header)

                output_parts.append(formatted_block)

            except Exception as e:
                header = f"============ FILE: {file_path} ============"
                print(f"{header}\n[Error reading file: {e}]", file=sys.stderr)

    if output_parts:
        copy_to_clipboard("".join(output_parts), force_pwsh=force_pwsh)
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
        "-s", "--show", help="Print file contents to stdout.", action="store_true"
    )
    parser.add_argument(
        "--pwsh",
        help="Force use of powershell.exe (recommended for large files on WSL).",
        action="store_true",
    )

    args = parser.parse_args()
    process_files(args.paths, args.truncate, show=args.show, force_pwsh=args.pwsh)


if __name__ == "__main__":
    main()
