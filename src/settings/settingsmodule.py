from PySide6.QtQml import qmlRegisterType

from .models import SettingsModel, BpmSettingsModel

def registerTypes() -> None:
    qmlRegisterType(SettingsModel, "Metronome.Settings", 1, 0, "SettingsModel")
    qmlRegisterType(BpmSettingsModel, "Metronome.Settings", 1, 0, "BpmSettingsModel")
