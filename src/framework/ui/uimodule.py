from PySide6.QtQml import qmlRegisterSingletonInstance

from .theme import Theme


__theme: Theme = Theme()


def getTheme() -> Theme:
    return __theme


def registerTypes() -> None:
    qmlRegisterSingletonInstance(Theme, "Metronome.Ui", 1, 0, "Theme", getTheme())
