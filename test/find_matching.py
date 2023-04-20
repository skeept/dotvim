"""Find matching files or folders."""

import os
import sys


def find_matching(
    folder_name,
    folder_criteria=None,
    folder_action=None,
    file_criteria=None,
    file_action=None,
):
    """Find files or folders according to criteria and apply criteria."""
    def default_action(x) -> None:
        return sys.stdout.write(f"{x}\n")
    to_skip = [".git", ".svn", "dd_"]
    if file_action is None:
        file_action = default_action
    if folder_action is None:
        folder_action = default_action
    for root, dirs, files in os.walk(folder_name):
        for name in (n for n in to_skip if n in dirs):
            dirs.remove(name)
        if file_criteria is not None:
            for _ff in files:
                fname = os.path.join(
                    root,
                )
                if file_criteria(fname):
                    file_action(fname)
        if folder_criteria(root):
            folder_action(root)


def empty_folder_or_with_tags(name):
    """Find empty folders or folder only with tags."""
    all_files = os.listdir(name)
    return len([x for x in all_files if x != "tags"]) == 0


if __name__ == "__main__":
    find_matching(".", folder_criteria=empty_folder_or_with_tags, folder_action=None)
