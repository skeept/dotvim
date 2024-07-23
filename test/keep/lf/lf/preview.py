"""simple preview to handle bat and tar files."""

import os
import shlex
import subprocess
import sys

DEBUG = False

file, *others = sys.argv[1:]
_, suffix = os.path.splitext(file.lower())
if suffix.startswith("."):
    suffix = suffix[1:]


if DEBUG:
    import logging

    logging.basicConfig(filename="log.txt", level=logging.WARNING)
    logging.debug("suffix = %s", suffix)

if suffix == "tar":
    subprocess.run(["tar", "tf", file], check=False)
elif suffix in {"7z", "exe", "dll", "zip"}:
    subprocess.run(["7z", "l", file], check=False)
else:
    subprocess.run(
        [*shlex.split("bat --style=plain --color=always"), file],
        check=False,
    )
