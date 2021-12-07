#!/usr/bin/env python3

import os
from pathlib import Path

SCRIPT_PATH = Path(__file__).parent.resolve()


# Setup iTerm2 dark mode switching
SWITCHER_SCRIPT_NAME = "auto_dark_mode.py"
ITERM_SCRIPTS_DIR = Path(
    "~/Library/Application Support/iTerm2/Scripts"
).expanduser()
try:
	os.symlink(
	    src=SCRIPT_PATH / SWITCHER_SCRIPT_NAME,
	    dst=ITERM_SCRIPTS_DIR / SWITCHER_SCRIPT_NAME,
	)
except FileExistsError:
	print("Skipped linking iTerm2 script since it is already linked")

# Setup Sublime settings
SUBLIME_SETTINGS_DIR = Path(
    "~/Library/Application Support/Sublime Text 3/Packages/User"
).expanduser()
SUBLIME_SETTINGS = Path(
    "~/settings/sublime"
).expanduser()
try:
    os.symlink(
        src=SUBLIME_SETTINGS,
        dst=SUBLIME_SETTINGS_DIR,
        target_is_directory=True,
    )
except FileExistsError:
    print("Skipped linking Sublime settings since it is already linked")
