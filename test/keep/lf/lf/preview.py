"""simple preview to handle bat and tar files."""

import os
import shlex
import subprocess
import sys

file, *others = sys.argv[1:]
_, suffix = os.path.splitext(file)

if suffix == "tar":
    subprocess.run(["tar", "tf", file], check=False)
elif suffix in {"7z", "exe", "dll"}:
    subprocess.run(["7z", "l", file], check=False)
else:
    subprocess.run(
        [*shlex.split("bat --style=plain --color=always"), file], check=False,
    )
