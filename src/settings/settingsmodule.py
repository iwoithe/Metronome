from PySide6.QtQml import qmlRegisterType

from .models import SettingsModel, SettingsModelPage, BpmSettingsModel


def registerTypes() -> None:
    qmlRegisterType(SettingsModelPage, "Metronome.Settings", 1, 0, "SettingsModelPage")
    qmlRegisterType(SettingsModel, "Metronome.Settings", 1, 0, "SettingsModel")
    qmlRegisterType(BpmSettingsModel, "Metronome.Settings", 1, 0, "BpmSettingsModel")
