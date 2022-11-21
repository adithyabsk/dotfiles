#!/usr/bin/env python3

import os
import subprocess
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
    print("Linked iTerm2 auto_dark_mode")
    print("Please make sure to go to Prefs > General > Magic > Allow all Apps to connect")
except FileExistsError:
	print("Skipped linking iTerm2 auto_dark_mode script since it is already linked")

# Setup linking to the dotfiles
ITERM_CONFIG = Path(
    "~/.config/iterm2"
).expanduser()
s1 = subprocess.run([
    "defaults", "write", "com.googlecode.iterm2", "PrefsCustomFolder", "-string", f'"{ITERM_CONFIG}"'
])
s2 = subprocess.run([
    "defaults", "write", "com.googlecode.iterm2", "LoadPrefsFromCustomFolder", "-bool", "true"
])
if all(s.returncode == 0 for s in [s1, s2]):
    print("Setup iTerm2 to use custom settings folder")
else:
    print("Failed to setup iTerm2 settings folder")

# Setup Sublime settings
SUBLIME_SETTINGS_DIR = Path(
    "~/Library/Application Support/Sublime Text/Packages/User"
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
