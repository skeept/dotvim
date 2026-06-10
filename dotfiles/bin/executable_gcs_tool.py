#!/usr/bin/env python3
import os
import sys
import argparse
import subprocess
import tomllib

CONFIG_PATH = os.path.expanduser("~/.wk_config.toml")


def load_buckets():
    if not os.path.exists(CONFIG_PATH):
        print(f"Error: Configuration file not found at {CONFIG_PATH}", file=sys.stderr)
        sys.exit(1)

    with open(CONFIG_PATH, "rb") as f:
        config = tomllib.load(f)

    return config.get("gcs", {}).get("buckets", [])


def fzf_select(choices, prompt):
    try:
        process = subprocess.Popen(
            ["fzf", f"--prompt={prompt}"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            text=True,
        )
        stdout, _ = process.communicate(input="\n".join(choices))
        if process.returncode != 0:
            print("Selection cancelled.", file=sys.stderr)
            sys.exit(1)
        return stdout.strip()
    except FileNotFoundError:
        print("Error: 'fzf' is not installed or not in PATH.", file=sys.stderr)
        sys.exit(1)


def get_gcs_subfolders(current_path):
    """Performs a shallow list of the current GCS path and extracts subfolders."""
    try:
        result = subprocess.run(
            ["gcloud", "storage", "ls", current_path],
            capture_output=True,
            text=True,
            check=True,
        )
        lines = result.stdout.splitlines()
        # In GCS listings, virtual directories/prefixes always end with a trailing slash '/'
        folders = [
            line.strip()
            for line in lines
            if line.strip().endswith("/") and line.strip() != current_path
        ]
        return folders
    except subprocess.CalledProcessError:
        print(f"Error: Could not list contents for {current_path}", file=sys.stderr)
        return []


def navigate_gcs_folders(bucket_root):
    """An interactive loop allowing the user to navigate nested GCS folders via fzf."""
    # Ensure our path ends with a slash to start
    current_path = bucket_root if bucket_root.endswith("/") else bucket_root + "/"

    while True:
        # Get absolute paths of subfolders from gcloud (e.g., 'gs://my-bucket/dir1/')
        absolute_folders = get_gcs_subfolders(current_path)

        # Build the menu choices
        choices = [". (Upload to this directory)"]

        # Only allow going up if we are deeper than the root bucket path (e.g., gs://bucket-name/)
        if current_path.count("/") > 3:
            choices.append(".. (Go up a directory)")

        # Add subfolders to choices, stripping out the parent path prefix for a cleaner UI
        for folder in absolute_folders:
            relative_name = folder[len(current_path) :]
            choices.append(relative_name)

        # Prompt the user via fzf
        selection = fzf_select(choices, f"GCS Browse [{current_path}]: ")

        if selection.startswith(". "):
            # User chose to lock in the current path
            return current_path
        elif selection.startswith(".. "):
            # User chose to go up: strip trailing slash, split at the last slash, add slash back
            stripped = current_path.rstrip("/")
            parent_path = stripped.rsplit("/", 1)[0] + "/"
            current_path = parent_path
        else:
            # User selected a relative subfolder name (e.g., 'my_folder/'), append it and loop
            current_path = current_path + selection


def handle_upload(files):
    buckets = load_buckets()
    if not buckets:
        print("Error: No buckets defined in config.", file=sys.stderr)
        sys.exit(1)

    if not files:
        print("Error: No files specified for upload.", file=sys.stderr)
        sys.exit(1)

    # Step 1: Choose the root bucket
    selected_bucket = fzf_select(buckets, "Select target bucket: ")

    # Step 2: Interactively navigate nested folders inside that bucket
    print("Opening directory browser...")
    target_gcs_path = navigate_gcs_folders(selected_bucket)

    # Step 3: Run the upload to the finalized path
    for file in files:
        if os.path.exists(file):
            print(f"Uploading '{file}' to {target_gcs_path}...")
            subprocess.run(["gcloud", "storage", "cp", "-r", file, target_gcs_path])
        else:
            print(f"Warning: File '{file}' does not exist, skipping.", file=sys.stderr)


def handle_download():
    buckets = load_buckets()
    if not buckets:
        print("Error: No buckets defined in config.", file=sys.stderr)
        sys.exit(1)

    selected_bucket = fzf_select(buckets, "Select source bucket: ")

    print(f"Indexing items in {selected_bucket}...")
    cmd_list = subprocess.run(
        ["gcloud", "storage", "ls", "--recursive", selected_bucket],
        capture_output=True,
        text=True,
    )

    objects = [line.strip() for line in cmd_list.stdout.split("\n") if line.strip()]
    if not objects:
        print("Bucket is empty.", file=sys.stderr)
        sys.exit(0)

    selected_object = fzf_select(objects, "Select object to download: ")

    print(f"Downloading {selected_object} to current directory...")
    subprocess.run(["gcloud", "storage", "cp", "-r", selected_object, "."])


def main():
    parser = argparse.ArgumentParser(description="GCS Upload/Download Helper")
    subparsers = parser.add_subparsers(dest="command", required=True)

    upload_parser = subparsers.add_parser("up", help="Upload files to a bucket")
    upload_parser.add_argument(
        "files", nargs="*", help="File(s) or folder(s) to upload"
    )

    subparsers.add_parser("down", help="Download a file from a bucket")

    args = parser.parse_args()

    if args.command == "up":
        handle_upload(args.files)
    elif args.command == "down":
        handle_download()


if __name__ == "__main__":
    main()
