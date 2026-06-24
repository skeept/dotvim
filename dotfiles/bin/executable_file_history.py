#!/usr/bin/env python3
import argparse
import subprocess
import tempfile
from pathlib import Path

DEFAULT_CMD = "nvim -R"


def main():
    # 1. Set up argparse with the new optional command flag
    parser = argparse.ArgumentParser(
        description="Browse Git history of a file and open a specific revision in a customizable editor."
    )
    parser.add_argument(
        "filename",
        type=str,
        help="The path to the file you want to browse history for.",
    )
    parser.add_argument(
        "-c",
        "--command",
        type=str,
        default=DEFAULT_CMD,
        help="The command used to open the file revision. (default: 'nvim -R')",
    )

    args = parser.parse_args()
    target = Path(args.filename).resolve()

    # 2. Safety Checks
    if not target.is_file():
        parser.error(f"File '{args.filename}' not found.")

    try:
        subprocess.run(
            ["git", "rev-parse", "--is-inside-work-tree"],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except (subprocess.CalledProcessError, FileNotFoundError):
        parser.error("Not a git repository, or git is not installed.")

    # 3. Gather Git path metrics
    repo_root_str = subprocess.check_output(
        ["git", "rev-parse", "--show-toplevel"], text=True
    ).strip()
    repo_root = Path(repo_root_str).resolve()
    rel_path = target.relative_to(repo_root).as_posix()

    # 4. Run fzf picker
    preview_cmd = f'git diff {{1}}^! -- "{rel_path}"'

    try:
        log_cmd = ["git", "log", "--oneline", "--follow", "--", str(target)]
        log_proc = subprocess.Popen(
            log_cmd, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL
        )

        fzf_cmd = [
            "fzf",
            "--ansi",
            f"--header=History for {target.name} (Enter to open)",
            f"--preview={preview_cmd}",
        ]

        fzf_proc = subprocess.run(
            fzf_cmd, stdin=log_proc.stdout, capture_output=True, text=True
        )
        log_proc.wait()
    except FileNotFoundError:
        print("Error: fzf is not installed or not found in PATH.")
        return

    selected = fzf_proc.stdout.strip()
    if not selected:
        return  # Exited safely

    sha = selected.split()[0]

    # 5. Smart Filename Construction
    stem = target.stem
    ext = target.suffix

    temp_dir = Path(tempfile.gettempdir())
    tmp_file = temp_dir / f"{stem}_{sha}{ext}"

    # 6. Extract and View using the Custom Command
    try:
        git_show_cmd = ["git", "show", f"{sha}:{rel_path}"]
        content = subprocess.check_output(git_show_cmd, stderr=subprocess.DEVNULL)
        tmp_file.write_bytes(content)

        # We run this through the system shell so users can pass complex commands with flags
        # e.g., "code --wait" or "nvim -R"
        full_run_cmd = f'{args.command} "{tmp_file}"'
        subprocess.run(full_run_cmd, shell=True)

    except subprocess.CalledProcessError:
        print("Error: Could not retrieve file revision from git.")
    finally:
        if tmp_file.exists():
            try:
                tmp_file.unlink()
            except OSError:
                pass


if __name__ == "__main__":
    main()
