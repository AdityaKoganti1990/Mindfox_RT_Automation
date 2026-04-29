"""
Recount test cases in every tests/*.robot module and rewrite the
"Total Test Cases: N" portion of each suite-level Documentation line,
plus the per-module breakdown in tests/__init__.robot.

Run manually:    python scripts/update_test_counts.py
Run as a check:  python scripts/update_test_counts.py --check   (exit 1 if anything would change)

A test case is detected as: a non-indented, non-comment line under the
*** Test Cases *** section of a Robot Framework file.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TESTS_DIR = REPO_ROOT / "tests"
INIT_FILE = TESTS_DIR / "__init__.robot"

# Friendly module label keyed by filename — used when rebuilding the
# per-module breakdown in __init__.robot. Order matches list order.
MODULE_LABELS: list[tuple[str, str]] = [
    ("01__login_test.robot", "Login"),
    ("02_General.robot", "General"),
    ("03_Annotations.robot", "Annotations"),
    ("04_Tools.robot", "Tools"),
    ("05_Actions.robot", "Actions"),
    ("06_Image Viewer Operations.robot", "Image Viewer"),
    ("07_Online Mode.robot", "Online Mode"),
]


_TEST_ID_TOKEN = r"[A-Z]+\d+(?:-\d+)?"
_RANGE_PATTERN = re.compile(rf"\b({_TEST_ID_TOKEN})(\s*-\s*)({_TEST_ID_TOKEN})\b")


def scan_test_cases(robot_file: Path) -> tuple[int, str | None]:
    """Return (count, last_test_id) for the file."""
    in_test_section = False
    count = 0
    last_id: str | None = None
    for raw_line in robot_file.read_text(encoding="utf-8").splitlines():
        stripped = raw_line.strip()
        if stripped.startswith("***"):
            header = stripped.strip("* ").strip().lower()
            in_test_section = header.startswith("test case")
            continue
        if not in_test_section:
            continue
        if not stripped or stripped.startswith("#"):
            continue
        # Test case names sit at column 0; steps are indented.
        if raw_line and raw_line[0] not in (" ", "\t"):
            count += 1
            # First whitespace-delimited token of the test name line is the ID.
            last_id = stripped.split(maxsplit=1)[0]
    return count, last_id


def update_module_doc(robot_file: Path, count: int, last_id: str | None) -> bool:
    """Rewrite 'Total Test Cases: N' and the upper bound of the last ID range. Returns True if changed."""
    text = robot_file.read_text(encoding="utf-8")
    found_marker = False

    def update_line(line: str) -> str:
        nonlocal found_marker
        if "Total Test Cases:" not in line:
            return line
        found_marker = True
        new_line = re.sub(
            r"(Total Test Cases:\s*)\d+",
            lambda m: f"{m.group(1)}{count}",
            line,
            count=1,
        )
        if last_id:
            matches = list(_RANGE_PATTERN.finditer(new_line))
            if matches:
                last = matches[-1]
                # Replace only the right-hand ID of the last range; left side stays.
                new_line = new_line[: last.start(3)] + last_id + new_line[last.end(3):]
        return new_line

    new_text = "".join(update_line(line) for line in text.splitlines(keepends=True))

    if not found_marker:
        print(f"[skip] {robot_file.name}: no 'Total Test Cases: N' marker found", file=sys.stderr)
        return False
    if new_text == text:
        return False
    robot_file.write_text(new_text, encoding="utf-8")
    return True


def update_init(counts: dict[str, int]) -> bool:
    text = INIT_FILE.read_text(encoding="utf-8")
    total = sum(counts.values())

    new_text, n_total = re.subn(
        r"(Total Test Cases:\s*)\d+",
        lambda m: f"{m.group(1)}{total}",
        text,
        count=1,
    )

    breakdown = " | ".join(f"{label}: {counts[fname]}" for fname, label in MODULE_LABELS if fname in counts)
    new_text, n_break = re.subn(
        r"(Login:\s*\d+(?:\s*\|\s*[^\n.]+)+)",
        breakdown,
        new_text,
        count=1,
    )

    if n_total == 0:
        print("[skip] __init__.robot: no 'Total Test Cases: N' marker found", file=sys.stderr)
    if n_break == 0:
        print("[skip] __init__.robot: no per-module breakdown line found", file=sys.stderr)

    if new_text == text:
        return False
    INIT_FILE.write_text(new_text, encoding="utf-8")
    return True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Exit non-zero if anything would change; do not modify files.")
    args = parser.parse_args()

    counts: dict[str, int] = {}
    last_ids: dict[str, str | None] = {}
    for robot_file in sorted(TESTS_DIR.glob("*.robot")):
        if robot_file.name == "__init__.robot":
            continue
        count, last_id = scan_test_cases(robot_file)
        counts[robot_file.name] = count
        last_ids[robot_file.name] = last_id

    if args.check:
        original_states: dict[Path, str] = {}
        for fname in counts:
            path = TESTS_DIR / fname
            original_states[path] = path.read_text(encoding="utf-8")
        original_states[INIT_FILE] = INIT_FILE.read_text(encoding="utf-8")

        any_change = False
        for fname, count in counts.items():
            if update_module_doc(TESTS_DIR / fname, count, last_ids[fname]):
                any_change = True
        if update_init(counts):
            any_change = True

        # Restore originals so --check is read-only.
        for path, original in original_states.items():
            path.write_text(original, encoding="utf-8")

        if any_change:
            print("Test-count documentation is out of date. Run: python scripts/update_test_counts.py", file=sys.stderr)
            return 1
        print("Test-count documentation is up to date.")
        return 0

    changed_files: list[str] = []
    for fname, count in counts.items():
        if update_module_doc(TESTS_DIR / fname, count, last_ids[fname]):
            changed_files.append(fname)
    if update_init(counts):
        changed_files.append(INIT_FILE.name)

    print(f"Module counts: {dict(sorted(counts.items()))}")
    print(f"Grand total: {sum(counts.values())}")
    if changed_files:
        print(f"Updated: {', '.join(changed_files)}")
    else:
        print("No changes needed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
