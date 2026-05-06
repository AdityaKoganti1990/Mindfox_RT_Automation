"""Adds OEM_PLUS / OEM_MINUS to FlaUILibrary's shortcut key dictionary.

The bundled FlaUILibrary KeyboardInputConverter omits OEM_PLUS (the `=`/`+`
key) and OEM_MINUS (the `-`/`_` key), so shortcuts like ``s'CTRL+OEM_PLUS'``
silently fall through and get typed as text. The underlying FlaUI
VirtualKeyShort C# enum does expose them, so we register them here.

Importing this file as a Robot Framework Library is enough — the patch runs
at import time and no keywords need to be called.
"""
import FlaUILibrary  # noqa: F401  (forces FlaUI .NET assembly resolution)
from FlaUI.Core.WindowsAPI import VirtualKeyShort  # pylint: disable=import-error
from FlaUILibrary.flaui.util.keyboardinputconverter import KeyboardInputConverter

KeyboardInputConverter.Keys.setdefault("OEM_PLUS", VirtualKeyShort.OEM_PLUS)
KeyboardInputConverter.Keys.setdefault("OEM_MINUS", VirtualKeyShort.OEM_MINUS)
