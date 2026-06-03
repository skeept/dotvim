"""Define a wrapper to run python scripts."""

import os
import shutil
import subprocess
import sys
from collections.abc import Iterator
from pathlib import Path
from typing import Any

import tomllib

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


# wk-owned flags — only consumed when they appear *before* the command keyword
_WK_FLAGS = frozenset({"--dry-run", "-v", "--verbose", "-i", "--info", "-h", "--help"})


def _iter_py_files(base_dir: Path) -> Iterator[Path]:
    """Walk base_dir recursively, skipping noise directories."""
    for entry in base_dir.iterdir():
        if entry.is_dir():
            if entry.name not in _SKIP_DIRS and not entry.name.startswith("."):
                yield from _iter_py_files(entry)
        elif entry.suffix == ".py" and entry.name != "__init__.py":
            yield entry


def expand_path(path_str: str | None) -> str:
    """Expand ~ and environment variables in a path string."""
    if not path_str:
        return ""
    return os.path.expandvars(str(Path(path_str).expanduser()))


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


def resolve_python(python_spec: str | list[str], script_path: Path) -> str:
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


def _process_folders(
    folders: list[str], def_py_spec: list[str], commands: dict[str, Any],
) -> None:
    """Recursively scan defined folders for discoverable scripts."""
    for folder in folders:
        base_dir = Path(expand_path(folder))
        if not base_dir.is_dir():
            continue
        for py_file in _iter_py_files(base_dir):
            key = py_file.stem.replace("_", "-")
            if key in commands:
                existing = commands[key]["path"]
                print(
                    f"Warning: name conflict '{key}' — '{existing}' vs '{py_file}'. "
                    f"Rename one of them. Keeping the first.",
                    file=sys.stderr,
                )
                continue
            commands[key] = {
                "path": str(py_file),
                "method": "direct",
                "python": def_py_spec,
            }


def _process_explicit(
    explicit: dict[str, Any], def_py_spec: list[str], commands: dict[str, Any],
) -> None:
    """Parse explicitly declared commands from the configuration file."""
    for key, val in explicit.items():
        raw_path = val.get("path", "")
        if not raw_path:
            continue

        abs_path = Path(expand_path(raw_path))
        base_name = abs_path.stem

        if base_name in commands and base_name != key:
            del commands[base_name]

        py_val = val.get("python", def_py_spec)
        commands[key] = {
            "path": str(abs_path),
            "method": val.get("method", "direct"),
            "python": py_val if isinstance(py_val, list) else [py_val],
        }


def _process_overrides(overrides: dict[str, Any], commands: dict[str, Any]) -> None:
    """Apply specific runtime methods or python spec overrides."""
    for key, val in overrides.items():
        if val is None or key not in commands:
            continue
        if "method" in val:
            commands[key]["method"] = val["method"]
        if "python" in val:
            py_val = val["python"]
            commands[key]["python"] = py_val if isinstance(py_val, list) else [py_val]


def _process_aliases(aliases: dict[str, str], commands: dict[str, Any]) -> None:
    """Map operational command aliases to target descriptors."""
    for alias, target in aliases.items():
        if target in commands:
            commands[alias] = dict(commands[target])


def load_config() -> dict[str, Any]:
    """Load the TOML configuration and build the command dictionary."""
    config_file = Path.home() / ".wk_config.toml"
    if not config_file.is_file():
        print(f"Config file not found: {config_file}", file=sys.stderr)
        sys.exit(1)

    with config_file.open("rb") as f:
        config = tomllib.load(f)

    settings = config.get("settings", {})
    raw_py = settings.get("python") or "python"
    def_py_spec = raw_py if isinstance(raw_py, list) else [raw_py]

    commands: dict[str, Any] = {}
    _process_folders(config.get("folders", []), def_py_spec, commands)
    _process_explicit(config.get("explicit", {}), def_py_spec, commands)
    _process_overrides(config.get("overrides", {}), commands)
    _process_aliases(config.get("aliases", {}), commands)

    return commands


def run_pym(script_dict: dict[str, Any], dry_run: bool, script_args: list[str]) -> None:  # noqa: FBT001
    """Run the script as a module if 'src' is found in the path hierarchy."""
    abs_script = Path(script_dict["path"]).resolve()
    python_bin = resolve_python(script_dict["python"], abs_script)

    pkg_root = abs_script
    found_src = False

    while pkg_root != pkg_root.parent:
        if pkg_root.name == "src":
            found_src = True
            break
        pkg_root = pkg_root.parent

    env = os.environ.copy()

    if found_src:
        module_path = abs_script.relative_to(pkg_root).with_suffix("")
        module_str = str(module_path).replace(os.sep, ".")
        curr_pythonpath = env.get("PYTHONPATH", "")
        env["PYTHONPATH"] = (
            f"{pkg_root}{os.pathsep}{curr_pythonpath}"
            if curr_pythonpath
            else str(pkg_root)
        )
        cmd = [python_bin, "-m", module_str, *script_args]
    else:
        parent_dir = abs_script.parent
        curr_pythonpath = env.get("PYTHONPATH", "")
        env["PYTHONPATH"] = (
            f"{parent_dir}{os.pathsep}{curr_pythonpath}"
            if curr_pythonpath
            else str(parent_dir)
        )
        cmd = [python_bin, str(abs_script), *script_args]

    if dry_run:
        env_str = f'PYTHONPATH="{env["PYTHONPATH"]}" '
        print(
            f"++ {env_str}" + " ".join(f'"{c}"' if " " in c else c for c in cmd),
            file=sys.stderr,
        )
        return

    subprocess.run(cmd, env=env, check=False)  # noqa: S603


def run_bash(
    script_dict: dict[str, Any], dry_run: bool, script_args: list[str],
) -> None:
    """Run a bash script explicitly using the system bash interpreter."""
    abs_script = Path(script_dict["path"]).resolve()
    bash_bin = shutil.which("bash") or "bash"
    cmd = [bash_bin, str(abs_script), *script_args]

    if dry_run:
        print(
            "++ " + " ".join(f'"{c}"' if " " in c else c for c in cmd),
            file=sys.stderr,
        )
        return

    subprocess.run(cmd, check=False)  # noqa: S603


def print_help(commands: dict[str, Any]) -> None:
    """Print usage information and list of registered commands."""
    config_file = Path.home() / ".wk_config.toml"
    print(
        "Usage: wk [--dry-run] [-v] <command> [args...]\n"
        "       wk -h | --help\n"
        "\n"
        "Flags:\n"
        "  --dry-run      Print the resolved command without executing it.\n"
        "  -v, --verbose  Show command details (path, python, method) before running.\n"
        "  -i, --info     Show command details and exit without running.\n"
        "  -h, --help     Show this help message.\n"
        "\n"
        f"Config file: {config_file}\n"
        f"Commands registered: {len(commands)}\n"
        "\n"
        "Run 'wk' with no arguments to list all available commands.",
    )


def print_command_info(key: str, script_dict: dict[str, Any]) -> None:
    """Print details (path, interpreter/python, method) for a single command."""
    method = script_dict["method"]

    if method == "bash":
        bash_bin = shutil.which("bash") or "bash"
        print(
            f"Command  : {key}\n"
            f"  Path     : {script_dict['path']}\n"
            f"  Resolved : {bash_bin}\n"
            f"  Method   : {method}",
        )
    else:
        py_spec = script_dict["python"]
        py_display = " → ".join(py_spec) if isinstance(py_spec, list) else py_spec
        resolved = resolve_python(py_spec, Path(script_dict["path"]).resolve())
        print(
            f"Command  : {key}\n"
            f"  Path     : {script_dict['path']}\n"
            f"  Python   : {py_display}\n"
            f"  Resolved : {resolved}\n"
            f"  Method   : {method}",
        )


def _handle_autocomplete(args: list[str]) -> None:
    """Process autocompletion requests early."""
    if "--_complete" in args:
        commands = load_config()
        print(" ".join(commands.keys()))
        sys.exit(0)


def _handle_resolve_python(args: list[str]) -> None:
    """Handle internal diagnostic path evaluation commands."""
    if len(args) >= 2 and args[0] == "--_resolve-python":  # noqa: PLR2004
        script_path = Path(args[1]).resolve()
        commands = load_config()
        spec = None
        for cmd in commands.values():
            if Path(cmd["path"]).resolve() == script_path:
                spec = cmd["python"]
                break
        if spec is None:
            config_file = Path.home() / ".wk_config.toml"
            with config_file.open("rb") as f:
                cfg = tomllib.load(f)
            raw = cfg.get("settings", {}).get("python") or "python"
            spec = raw if isinstance(raw, list) else [raw]
        print(resolve_python(spec, script_path))
        sys.exit(0)


def _consume_flags(args: list[str]) -> tuple[bool, bool, bool]:
    """Parse and consume leading wrapper execution flags."""
    dry_run = False
    verbose = False
    info_only = False

    while args and args[0] in _WK_FLAGS:
        flag = args.pop(0)
        if flag == "--dry-run":
            dry_run = True
        elif flag in ("-v", "--verbose"):
            verbose = True
        elif flag in ("-i", "--info"):
            info_only = True
        elif flag in ("-h", "--help"):
            commands = load_config()
            print_help(commands)
            sys.exit(0)

    return dry_run, verbose, info_only


def _dispatch_command(
    key: str,
    script_dict: dict[str, Any],
    dry_run: bool,
    verbose: bool,
    info_only: bool,
    args: list[str],
) -> None:
    """Dispatch tracking profiles and execute the matched command payload."""
    if info_only:
        print_command_info(key, script_dict)
        sys.exit(0)

    if verbose:
        print_command_info(key, script_dict)
        print()

    if script_dict["method"] == "pym":
        run_pym(script_dict, dry_run, args)
    elif script_dict["method"] == "bash":
        run_bash(script_dict, dry_run, args)
    else:
        abs_script = Path(script_dict["path"]).resolve()
        python_bin = resolve_python(script_dict["python"], abs_script)
        cmd = [python_bin, script_dict["path"], *args]
        if dry_run:
            print(
                "++ " + " ".join(f'"{c}"' if " " in c else c for c in cmd),
                file=sys.stderr,
            )
        else:
            subprocess.run(cmd, check=False)  # noqa: S603


def main() -> None:
    """Parse CLI arguments and dispatch to the appropriate registered command."""
    args = sys.argv[1:]

    _handle_autocomplete(args)
    _handle_resolve_python(args)

    dry_run, verbose, info_only = _consume_flags(args)

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

    _dispatch_command(key, commands[key], dry_run, verbose, info_only, args)


if __name__ == "__main__":
    main()
