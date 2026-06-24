#!/usr/bin/env python3
import argparse
import contextlib
import subprocess
import tempfile
from pathlib import Path


def main() -> None:
    # 1. Set up argparse
    parser = argparse.ArgumentParser(
        description="Browse Git history of a file and open a specific revision in a customizable editor.",
    )
    parser.add_argument(
        "filename",
        type=str,
        nargs="?",
        help="The path to the file. If omitted, you will be prompted to select a file from the current folder.",
    )
    parser.add_argument(
        "-c",
        "--command",
        type=str,
        default="nvim -R",
        help="The command used to open the file revision. (default: 'nvim -R')",
    )

    args = parser.parse_args()

    # 2. Pre-Check: Ensure we are inside a Git repository first
    try:
        subprocess.run(
            ["git", "rev-parse", "--is-inside-work-tree"],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except (subprocess.CalledProcessError, FileNotFoundError):
        parser.error("Not a git repository, or git is not installed.")

    # 3. Determine the target file
    if args.filename:
        # User specified a file -> validate it
        target = Path(args.filename).resolve()
        if not target.is_file():
            parser.error(f"File '{args.filename}' not found.")
    else:
        # No file specified -> Let user select a tracked file via fzf
        try:
            # OPTIMIZATION: Added "." to restrict the scope to the current directory only
            ls_cmd = ["git", "ls-files", "."]
            ls_proc = subprocess.Popen(
                ls_cmd, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
            )

            fzf_file_cmd = [
                "fzf",
                "--header=Select a file from the current folder (Esc to cancel)",
            ]
            fzf_file_proc = subprocess.run(
                fzf_file_cmd, stdin=ls_proc.stdout, capture_output=True, text=True,
            )
            ls_proc.wait()

            selected_file = fzf_file_proc.stdout.strip()
            if not selected_file:
                return  # User canceled out of the file picker

            target = Path(selected_file).resolve()
        except FileNotFoundError:
            print("Error: fzf is not installed or not found in PATH.")
            return

    # 4. Gather Git path metrics for the chosen file
    repo_root_str = subprocess.check_output(
        ["git", "rev-parse", "--show-toplevel"], text=True,
    ).strip()
    repo_root = Path(repo_root_str).resolve()
    rel_path = target.relative_to(repo_root).as_posix()

    # 5. Run the second fzf picker (Commit History)
    preview_cmd = f'git diff {{1}}^! -- "{rel_path}"'

    try:
        log_cmd = ["git", "log", "--oneline", "--follow", "--", str(target)]
        log_proc = subprocess.Popen(
            log_cmd, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
        )

        fzf_cmd = [
            "fzf",
            "--ansi",
            f"--header=History for {target.name} (Enter to open)",
            f"--preview={preview_cmd}",
        ]

        fzf_proc = subprocess.run(
            fzf_cmd, stdin=log_proc.stdout, capture_output=True, text=True,
        )
        log_proc.wait()
    except FileNotFoundError:
        print("Error: fzf is not installed or not found in PATH.")
        return

    selected_revision = fzf_proc.stdout.strip()
    if not selected_revision:
        return  # User exited safely

    sha = selected_revision.split()[0]

    # 6. Smart Filename Construction
    stem = target.stem
    ext = target.suffix

    temp_dir = Path(tempfile.gettempdir())
    tmp_file = temp_dir / f"{stem}_{sha}{ext}"

    # 7. Extract and View using the Custom Command
    try:
        git_show_cmd = ["git", "show", f"{sha}:{rel_path}"]
        content = subprocess.check_output(git_show_cmd, stderr=subprocess.DEVNULL)
        tmp_file.write_bytes(content)

        full_run_cmd = f'{args.command} "{tmp_file}"'
        subprocess.run(full_run_cmd, shell=True)

    except subprocess.CalledProcessError:
        print("Error: Could not retrieve file revision from git.")
    finally:
        if tmp_file.exists():
            with contextlib.suppress(OSError):
                tmp_file.unlink()


if __name__ == "__main__":
    main()
