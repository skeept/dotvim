"""Define a wrapper to run python scripts."""

import os
import sys
import subprocess
import tomllib
from pathlib import Path
import shutil

# Special keyword in python_location lists: search upward from the script for a venv
VENV_KEYWORD = ":venv:"

# Directories to skip during recursive folder scan
_SKIP_DIRS = {
    ".venv",
    "venv",
    "env",
    ".env",
    "site-packages",
    "dist-packages",
    "__pycache__",
    ".tox",
    ".mypy_cache",
    ".git",
    "node_modules",
    ".eggs",
    "build",
    "dist",
}


def _iter_py_files(base_dir: Path):
    """Walk base_dir recursively, skipping noise directories."""
    for entry in base_dir.iterdir():
        if entry.is_dir():
            if entry.name not in _SKIP_DIRS and not entry.name.startswith("."):
                yield from _iter_py_files(entry)
        elif entry.suffix == ".py" and entry.name != "__init__.py":
            yield entry


def expand_path(path_str):
    """Expands ~ and environment variables in a path string."""
    if not path_str:
        return ""
    return os.path.expandvars(os.path.expanduser(path_str))


def _find_venv_python(script_path: Path) -> str | None:
    """Walk upward from script_path looking for a venv or .venv directory.

    Returns the path to the Python executable inside the first one found,
    or None if no virtual environment is discovered.
    """
    bin_dir = "Scripts" if sys.platform == "win32" else "bin"
    search = script_path.parent.resolve()
    while True:
        for venv_name in ("venv", ".venv"):
            venv_dir = search / venv_name
            if venv_dir.is_dir():
                for py_name in ("python3", "python", "python.exe"):
                    candidate = venv_dir / bin_dir / py_name
                    if candidate.is_file():
                        return str(candidate)
        if search == search.parent:
            break
        search = search.parent
    return None


def resolve_python(python_spec, script_path: Path) -> str:
    """Resolve a python_location spec (str or list) to an executable path.

    Items in the list are tried in order; the first match wins.
    The special keyword ':venv:' triggers an upward search from the script
    directory for a venv or .venv virtual environment.
    Falls back to the system python3 / python if nothing matches.
    """
    items = python_spec if isinstance(python_spec, list) else [python_spec]
    for item in items:
        if item == VENV_KEYWORD:
            found = _find_venv_python(script_path)
            if found:
                return found
        else:
            expanded = expand_path(item)
            resolved = shutil.which(expanded)
            if resolved:
                return resolved
            p = Path(expanded)
            if p.is_file() and os.access(p, os.X_OK):
                return str(p)
    return shutil.which("python3") or shutil.which("python") or "python"


def load_config():
    """Loads the TOML configuration and builds the command dictionary."""
    config_file = Path.home() / ".wk_config.toml"
    if not config_file.is_file():
        print(f"Config file not found: {config_file}", file=sys.stderr)
        sys.exit(1)

    # tomllib requires the file to be opened in binary mode ("rb")
    with open(config_file, "rb") as f:
        config = tomllib.load(f)

    settings = config.get("settings", {})
    raw_py = settings.get("python") or "python"
    # Normalise to list; expansion and venv search happen at resolve time.
    def_py_spec = raw_py if isinstance(raw_py, list) else [raw_py]

    commands = {}

    # 1. Recursive Scan (Folders array)
    for folder in config.get("folders", []):
        base_dir = Path(expand_path(folder))
        if not base_dir.is_dir():
            continue
        for py_file in _iter_py_files(base_dir):
            commands[py_file.stem] = {
                "path": str(py_file),
                "method": "direct",
                "python": def_py_spec,
            }

    # 2. Explicit Definitions (Explicit table)
    for key, val in config.get("explicit", {}).items():
        raw_path = val.get("path", "")
        if not raw_path:
            continue

        abs_path = Path(expand_path(raw_path))
        base_name = abs_path.stem

        # Clear auto-discovered entry if it conflicts with a custom named definition
        if base_name in commands and base_name != key:
            del commands[base_name]

        py_val = val.get("python", def_py_spec)
        commands[key] = {
            "path": str(abs_path),
            "method": val.get("method", "direct"),
            "python": py_val if isinstance(py_val, list) else [py_val],
        }

    # 3. Apply Overrides
    for key, val in config.get("overrides", {}).items():
        if val is None:
            continue
        if key in commands:
            if "method" in val:
                commands[key]["method"] = val["method"]
            if "python" in val:
                py_val = val["python"]
                commands[key]["python"] = (
                    py_val if isinstance(py_val, list) else [py_val]
                )

    # 4. Process Aliases
    for alias, target in config.get("aliases", {}).items():
        if target in commands:
            commands[alias] = dict(commands[target])

    return commands


def run_pym(script_dict, dry_run, script_args):
    """Runs the script as a module if 'src' is found in the path hierarchy."""
    abs_script = Path(script_dict["path"]).resolve()
    python_bin = resolve_python(script_dict["python"], abs_script)

    pkg_root = abs_script
    found_src = False

    # Upward search for 'src' folder
    while pkg_root != pkg_root.parent:
        if pkg_root.name == "src":
            found_src = True
            break
        pkg_root = pkg_root.parent

    env = os.environ.copy()

    if found_src:
        # Run as module (-m)
        module_path = abs_script.relative_to(pkg_root).with_suffix("")
        module_str = str(module_path).replace(os.sep, ".")

        # Prepend src dir to PYTHONPATH
        curr_pythonpath = env.get("PYTHONPATH", "")
        env["PYTHONPATH"] = (
            f"{pkg_root}{os.pathsep}{curr_pythonpath}"
            if curr_pythonpath
            else str(pkg_root)
        )

        cmd = [python_bin, "-m", module_str] + script_args
    else:
        # Run directly, but inject parent dir to PYTHONPATH
        parent_dir = abs_script.parent
        curr_pythonpath = env.get("PYTHONPATH", "")
        env["PYTHONPATH"] = (
            f"{parent_dir}{os.pathsep}{curr_pythonpath}"
            if curr_pythonpath
            else str(parent_dir)
        )

        cmd = [python_bin, str(abs_script)] + script_args

    if dry_run:
        env_str = f'PYTHONPATH="{env["PYTHONPATH"]}" '
        print(
            f"++ {env_str}" + " ".join(f'"{c}"' if " " in c else c for c in cmd),
            file=sys.stderr,
        )
        return

    # Execute the command, replacing the current process context
    subprocess.run(cmd, env=env)


def print_help(commands):
    config_file = Path.home() / ".wk_config.toml"
    print(
        "Usage: wk [--dry-run] [-v] <command> [args...]\n"
        "       wk -h | --help\n"
        "\n"
        "Flags:\n"
        "  --dry-run   Print the resolved command without executing it.\n"
        "  -v          Show details about a command (path, python, method) before running.\n"
        "  -h, --help  Show this help message.\n"
        "\n"
        f"Config file: {config_file}\n"
        f"Commands registered: {len(commands)}\n"
        "\n"
        "Run 'wk' with no arguments to list all available commands."
    )


def print_command_info(key, script_dict):
    py_spec = script_dict["python"]
    py_display = " → ".join(py_spec) if isinstance(py_spec, list) else py_spec
    resolved = resolve_python(py_spec, Path(script_dict["path"]).resolve())
    print(
        f"Command  : {key}\n"
        f"  Path     : {script_dict['path']}\n"
        f"  Python   : {py_display}\n"
        f"  Resolved : {resolved}\n"
        f"  Method   : {script_dict['method']}"
    )


def main():
    args = sys.argv[1:]

    # Handle autocompletion request from bash/powershell
    if "--_complete" in args:
        commands = load_config()
        print(" ".join(commands.keys()))
        sys.exit(0)

    # Diagnostic: print the resolved Python for a given script path
    # Usage: wk_core.py --_resolve-python /path/to/script.py
    if len(args) >= 2 and args[0] == "--_resolve-python":
        script_path = Path(args[1]).resolve()
        commands = load_config()
        # Find a registered command matching this path, or fall back to settings spec
        spec = None
        for cmd in commands.values():
            if Path(cmd["path"]).resolve() == script_path:
                spec = cmd["python"]
                break
        if spec is None:
            # Not a registered script — use the default spec from settings
            config_file = Path.home() / ".wk_config.toml"
            with open(config_file, "rb") as f:
                cfg = tomllib.load(f)
            raw = cfg.get("settings", {}).get("python") or "python"
            spec = raw if isinstance(raw, list) else [raw]
        print(resolve_python(spec, script_path))
        sys.exit(0)

    dry_run = "--dry-run" in args
    if dry_run:
        args.remove("--dry-run")

    verbose = "-v" in args
    if verbose:
        args.remove("-v")

    # Help only when explicitly requested
    if args and args[0] in ("-h", "--help"):
        commands = load_config()
        print_help(commands)
        sys.exit(0)

    commands = load_config()

    if not args:
        print("Available commands:")
        keys = sorted(commands.keys())
        for k in keys:
            print(f"  {k}")
        sys.exit(0)

    key = args.pop(0)

    if key not in commands:
        print(f"Script '{key}' not found.", file=sys.stderr)
        sys.exit(1)

    script_dict = commands[key]

    if verbose:
        print_command_info(key, script_dict)
        print()

    if script_dict["method"] == "pym":
        run_pym(script_dict, dry_run, args)
    else:
        # Standard direct run
        abs_script = Path(script_dict["path"]).resolve()
        python_bin = resolve_python(script_dict["python"], abs_script)
        cmd = [python_bin, script_dict["path"]] + args
        if dry_run:
            print(
                "++ " + " ".join(f'"{c}"' if " " in c else c for c in cmd),
                file=sys.stderr,
            )
        else:
            subprocess.run(cmd)


if __name__ == "__main__":
    main()
