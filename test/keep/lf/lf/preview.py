"""simple preview to handle bat and tar files"""

import sys
from pathlib import Path
import subprocess
import shlex

file, *others = sys.argv[1:]
file = Path(file)

suffix = file.suffix.lower()[1:]
if suffix == "tar":
    subprocess.run(["tar", "tf", file])
elif suffix in {"7z", "exe", "dll"}:
    subprocess.run(["7z", "l", file])
else:
    subprocess.run([*shlex.split("bat --style=plain --color=always"), file])
