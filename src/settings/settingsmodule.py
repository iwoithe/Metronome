from PySide6.QtQml import qmlRegisterType

from .models import SettingsModel, SettingsModelPage, AccentsSettingsModel, BpmSettingsModel, TimeSignatureSettingsModel


def registerTypes() -> None:
    qmlRegisterType(SettingsModelPage, "Metronome.Settings", 1, 0, "SettingsModelPage")
    qmlRegisterType(SettingsModel, "Metronome.Settings", 1, 0, "SettingsModel")
    qmlRegisterType(AccentsSettingsModel, "Metronome.Settings", 1, 0, "AccentsSettingsModel")
    qmlRegisterType(BpmSettingsModel, "Metronome.Settings", 1, 0, "BpmSettingsModel")
    qmlRegisterType(TimeSignatureSettingsModel, "Metronome.Settings", 1, 0, "TimeSignatureSettingsModel")
