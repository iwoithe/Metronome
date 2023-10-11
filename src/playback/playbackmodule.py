from .models.accentsmodel import AccentsModel
from .models.playbackmodel import PlaybackModel

from PySide6.QtQml import qmlRegisterType, qmlRegisterSingletonInstance


__accentsModel: AccentsModel = AccentsModel()


def getAccentsModel() -> AccentsModel:
    return __accentsModel


def registerTypes() -> None:
    qmlRegisterSingletonInstance(AccentsModel, "Metronome.Playback", 1, 0, "AccentsModel", getAccentsModel())
    qmlRegisterType(PlaybackModel, "Metronome.Playback", 1, 0, "PlaybackModel")
